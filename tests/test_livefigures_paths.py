"""Livefigures resource-path regressions using Pandoc's actual Lua path API.

No Node, TeX, browser or network is needed. The suite requires the activated
pinned Quarto toolchain and skips explicitly when that environment is absent.
"""
import json
import os
from pathlib import Path
import re
import subprocess
import tempfile
import unittest


ROOT = Path(__file__).resolve().parents[1]
FILTER = ROOT / "_extensions/seandavi/livefigures/livefigures.lua"


class LivefiguresPathTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        toolchain = os.environ.get("DHBW_TOOLCHAIN_DIR")
        version = re.search(
            r"(?m)^QUARTO_VERSION=(.+)$",
            (ROOT / "scripts/toolchain.env").read_text(encoding="utf-8"),
        ).group(1)
        quarto = Path(toolchain or "") / f"quarto-{version}" / "bin/quarto"
        if not toolchain or not quarto.is_file() or not os.access(quarto, os.X_OK):
            raise unittest.SkipTest(
                "Activate the pinned toolchain with source scripts/activate.sh "
                "before running Lua path regressions"
            )
        cls.command = [str(quarto), "pandoc"]
        source = FILTER.read_text(encoding="utf-8")
        # Exercise the production helper, without invoking the renderer or
        # duplicating its path logic in Python.
        cls.norm = re.search(
            r"(?ms)^local function norm_path\(p\)\n.*?(?=^local function ensure_dir)",
            source,
        ).group()
        cls.cache_helpers = re.search(
            r"(?ms)^local function ensure_dir\(dir\)\n.*?(?=^local function read_file)",
            source,
        ).group()
        cls.relative = re.search(
            r"(?ms)^local function relative_to\(target, from\)\n.*?(?=^local function render_image)",
            source,
        ).group()

    def setUp(self):
        self.temporary = tempfile.TemporaryDirectory(prefix="livefigures-paths-")
        self.root = Path(self.temporary.name) / "Kurs mit Umlauten ä"
        self.root.mkdir()

    def tearDown(self):
        self.temporary.cleanup()

    def assert_relative(self, target, source, expected, cwd=None):
        cwd = cwd or self.root
        cwd.mkdir(parents=True, exist_ok=True)
        # Lua accepts these JSON string literals; non-ASCII is emitted as UTF-8
        # rather than JSON-specific backslash-u escapes.
        quoted = lambda value: json.dumps(str(value), ensure_ascii=False)
        harness = self.root / "path-check.lua"
        harness.write_text(
            "local path = pandoc.path\n" + self.norm + self.relative
            + "\nfunction Pandoc(doc)\n"
            + f"  local result = relative_to({quoted(target)}, {quoted(source)})\n"
            + f"  assert(result == {quoted(expected)}, result)\n"
            + "  return pandoc.Pandoc({pandoc.Para({pandoc.Str(result)})})\nend\n",
            encoding="utf-8",
        )
        result = subprocess.run(
            self.command + ["--from=markdown", "--to=plain", "--lua-filter", str(harness)],
            cwd=cwd, input="", text=True, capture_output=True, check=False,
        )
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertEqual(result.stdout.strip(), expected)

    def test_plain_project_cache_from_root_document(self):
        self.assert_relative("_livefigures/chart.svg", self.root, "_livefigures/chart.svg")

    def test_dot_prefixed_project_cache(self):
        self.assert_relative("./_livefigures/chart.svg", self.root, "_livefigures/chart.svg")

    def test_lecture_document(self):
        self.assert_relative("_livefigures/chart.svg", self.root / "vorlesungen",
                             "../_livefigures/chart.svg")

    def test_nested_lecture_document(self):
        self.assert_relative("_livefigures/chart.svg", self.root / "vorlesungen/Vertiefung",
                             "../../_livefigures/chart.svg")

    def test_arbitrary_nested_non_lecture_document(self):
        self.assert_relative("_livefigures/chart.svg", self.root / "labs/a/b",
                             "../../../_livefigures/chart.svg")

    def test_filter_working_directory_in_lecture_folder(self):
        folder = self.root / "vorlesungen"
        self.assert_relative("../_livefigures/chart.svg", folder,
                             "../_livefigures/chart.svg", cwd=folder)

    def test_filter_working_directory_three_levels_deep(self):
        folder = self.root / "labs/a/b"
        self.assert_relative("../../../_livefigures/chart.svg", folder,
                             "../../../_livefigures/chart.svg", cwd=folder)

    def test_absolute_cache_target(self):
        self.assert_relative(self.root / "_livefigures/chart.svg", self.root / "labs",
                             "../_livefigures/chart.svg")

    def test_relative_source_directory(self):
        self.assert_relative("_livefigures/chart.svg", "vorlesungen/Vertiefung",
                             "../../_livefigures/chart.svg")

    def test_dot_segments_are_normalized(self):
        self.assert_relative("./_livefigures/../_livefigures/chart.svg",
                             self.root / "vorlesungen/./Vertiefung/..",
                             "../_livefigures/chart.svg")

    def test_backslash_cache_separator(self):
        self.assert_relative("_livefigures\\chart.svg", self.root / "vorlesungen",
                             "../_livefigures/chart.svg")

    def test_non_cache_target(self):
        self.assert_relative("assets/images/chart.svg", self.root / "vorlesungen",
                             "../assets/images/chart.svg")

    def assert_cache_directory(self, cwd, expected):
        cwd.mkdir(parents=True, exist_ok=True)
        harness = self.root / "cache-check.lua"
        harness.write_text(
            "local path = pandoc.path\n" + self.cache_helpers
            + "\nfunction Pandoc(doc)\n  local result = cache_dir()\n"
            + f"  assert(result == {json.dumps(expected)}, result)\n"
            + "  return pandoc.Pandoc({pandoc.Para({pandoc.Str(result)})})\nend\n",
            encoding="utf-8",
        )
        result = subprocess.run(
            self.command + ["--from=markdown", "--to=plain", "--lua-filter", str(harness)],
            cwd=cwd, input="", text=True, capture_output=True, check=False,
        )
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertEqual(result.stdout.strip(), expected)
        self.assertTrue((cwd / expected / ".keep").is_file())

    def test_cache_discovery_more_than_two_source_folders_deep(self):
        (self.root / "_quarto.yml").write_text("project:\n  type: default\n")
        self.assert_cache_directory(self.root / "labs/a/b", "../../../_livefigures")
        self.assertFalse((self.root / "labs/a/b/_livefigures").exists())

    def test_standalone_without_project_uses_local_cache(self):
        self.assert_cache_directory(self.root / "standalone", "_livefigures")


if __name__ == "__main__":
    unittest.main()
