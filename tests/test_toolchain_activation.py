"""Activation regressions for isolated TeX support and Fontconfig setup."""
from pathlib import Path
import json
import os
import subprocess
import tempfile
import unittest
import xml.etree.ElementTree as ET

ROOT = Path(__file__).resolve().parents[1]
PINS = dict(
    line.split("=", 1)
    for line in (ROOT / "scripts/toolchain.env").read_text().splitlines()
    if line and not line.startswith("#")
)

class ToolchainActivationTests(unittest.TestCase):
    def setUp(self):
        self.temporary = tempfile.TemporaryDirectory(prefix="toolchain & fonts ")
        self.addCleanup(self.temporary.cleanup)
        self.directory = Path(self.temporary.name)
        self.environment = os.environ.copy()
        self.environment["DHBW_TOOLCHAIN_DIR"] = str(self.directory)
        self.environment["HTTPS_PROXY"] = "https://proxy.example.invalid"
        self.environment["NODE_EXTRA_CA_CERTS"] = "/test/session-ca.pem"

    def quarto(self):
        binary = self.directory / f"quarto-{PINS['QUARTO_VERSION']}/bin/quarto"
        binary.parent.mkdir(parents=True)
        binary.write_text("#!/bin/sh\nexit 0\n")
        binary.chmod(0o755)

    def activate(self):
        return subprocess.run(
            ["bash", "-c", 'source "$1" || exit $?; python3 -c '
             '\'import json,os;print(json.dumps({k:os.environ.get(k) for k in '
             '["FONTCONFIG_FILE","TEXMFLOCAL","TEXMFHOME","HTTPS_PROXY","NODE_EXTRA_CA_CERTS"]}))\'',
             "activation-test", str(ROOT / "scripts/activate.sh")],
            env=self.environment, capture_output=True, text=True,
        )

    def test_requires_pinned_quarto_instead_of_host_fallback(self):
        result = self.activate()
        self.assertNotEqual(result.returncode, 0)
        self.assertIn("Pinned Quarto is missing", result.stderr)
        self.assertFalse((self.directory / "config").exists())

    def test_fontconfig_handles_paths_with_spaces_and_xml_characters(self):
        self.quarto()
        result = self.activate()
        self.assertEqual(result.returncode, 0, result.stderr)
        values = json.loads(result.stdout)
        config = ET.parse(values["FONTCONFIG_FILE"]).getroot()
        self.assertEqual(config.find("dir").text, str(
            self.directory / f"texlive-{PINS['TEXLIVE_VERSION']}/texmf-dist/fonts/opentype"
        ))
        self.assertEqual(config.find("include").text, "/etc/fonts/fonts.conf")
        self.assertTrue(Path(config.find("cachedir").text).is_relative_to(self.directory))
        self.assertIn(str(self.directory / f"tex-support-{PINS['TEX_SUPPORT_VERSION']}/texmf"), values["TEXMFLOCAL"])
        self.assertEqual(values["HTTPS_PROXY"], self.environment["HTTPS_PROXY"])
        self.assertEqual(values["NODE_EXTRA_CA_CERTS"], self.environment["NODE_EXTRA_CA_CERTS"])

    def test_reactivation_preserves_local_files_and_config(self):
        self.quarto()
        first = self.activate()
        self.assertEqual(first.returncode, 0, first.stderr)
        values = json.loads(first.stdout)
        sentinel = Path(values["TEXMFHOME"]) / "author-resource.txt"
        sentinel.write_text("preserve this local resource")
        config = Path(values["FONTCONFIG_FILE"])
        before = (config.read_bytes(), config.stat().st_mtime_ns)
        second = self.activate()
        self.assertEqual(second.returncode, 0, second.stderr)
        self.assertEqual(sentinel.read_text(), "preserve this local resource")
        self.assertEqual((config.read_bytes(), config.stat().st_mtime_ns), before)

if __name__ == "__main__":
    unittest.main()
