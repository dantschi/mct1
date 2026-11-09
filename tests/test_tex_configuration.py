"""Offline regressions for registration of the pinned German TeX patterns."""
from pathlib import Path
import json
import os
import subprocess
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[1]
PINS = dict(
    line.split("=", 1)
    for line in (ROOT / "scripts/toolchain.env").read_text().splitlines()
    if line and not line.startswith("#")
)


class TexConfigurationTests(unittest.TestCase):
    def setUp(self):
        self.temporary = tempfile.TemporaryDirectory(prefix="tex configuration ")
        self.addCleanup(self.temporary.cleanup)
        self.directory = Path(self.temporary.name)
        self.environment = os.environ.copy()
        self.environment["DHBW_TOOLCHAIN_DIR"] = str(self.directory)
        self.log = self.directory / "commands.jsonl"
        self.environment["FAKE_TEX_LOG"] = str(self.log)
        quarto = self.directory / f"quarto-{PINS['QUARTO_VERSION']}/bin/quarto"
        quarto.parent.mkdir(parents=True)
        quarto.write_text("#!/bin/sh\nexit 0\n")
        quarto.chmod(0o755)
        self.support = self.directory / f"tex-support-{PINS['TEX_SUPPORT_VERSION']}"
        self.support.mkdir()
        (self.support / ".installed-packages").write_text(
            f"{PINS['TEX_LUATEX_SHA256']}:{PINS['TEX_GERMAN_SHA256']}\n"
        )
        self.marker = self.support / ".configured-hyphenation-sha256"
        binaries = self.directory / f"texlive-{PINS['TEXLIVE_VERSION']}/bin/x86_64-linux"
        binaries.mkdir(parents=True)
        for name in ("mktexlsr", "tlmgr", "fmtutil-sys"):
            binary = binaries / name
            binary.write_text("""#!/usr/bin/env python3
from pathlib import Path
import json, os, sys
name = Path(sys.argv[0]).name
with open(os.environ['FAKE_TEX_LOG'], 'a') as output:
    output.write(json.dumps([name, *sys.argv[1:]]) + '\\n')
if name == 'tlmgr':
    config = Path(sys.argv[sys.argv.index('--localcfg') + 1])
    assert config.is_absolute() and config.is_file()
    assert 'ngerman' in config.read_text()
if name == 'fmtutil-sys' and os.environ.get('FAKE_TEX_FAIL') == sys.argv[-1]:
    sys.exit(1)
""")
            binary.chmod(0o755)

    def configure(self):
        return subprocess.run(
            ["bash", str(ROOT / "scripts/configure-tex.sh")],
            env=self.environment, capture_output=True, text=True,
        )

    def calls(self):
        return [json.loads(line) for line in self.log.read_text().splitlines()]

    def test_existing_installation_is_registered_once_with_explicit_local_configs(self):
        first = self.configure()
        self.assertEqual(first.returncode, 0, first.stderr)
        calls = self.calls()
        generators = [call for call in calls if call[0] == "tlmgr"]
        self.assertEqual([call[2] for call in generators],
                         ["language.dat", "language.def", "language.dat.lua"])
        self.assertEqual([call for call in calls if call[0] == "fmtutil-sys"], [
            ["fmtutil-sys", "--byfmt", "lualatex"],
            ["fmtutil-sys", "--byfmt", "xelatex"],
        ])
        previous = (self.marker.read_bytes(), self.marker.stat().st_mtime_ns)
        again = self.configure()
        self.assertEqual(again.returncode, 0, again.stderr)
        self.assertEqual(self.calls(), calls)
        self.assertEqual((self.marker.read_bytes(), self.marker.stat().st_mtime_ns), previous)

    def test_failed_format_rebuild_is_not_marked_complete_and_can_be_retried(self):
        self.environment["FAKE_TEX_FAIL"] = "xelatex"
        failed = self.configure()
        self.assertNotEqual(failed.returncode, 0)
        self.assertFalse(self.marker.exists())
        del self.environment["FAKE_TEX_FAIL"]
        retry = self.configure()
        self.assertEqual(retry.returncode, 0, retry.stderr)
        self.assertTrue(self.marker.is_file())


if __name__ == "__main__":
    unittest.main()
