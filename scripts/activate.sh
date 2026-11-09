#!/usr/bin/env bash
# Source this file from Bash; paths are independent of the checkout location.
dhbw_repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source "$dhbw_repo_dir/scripts/toolchain.env"
DHBW_TOOLCHAIN_DIR="${DHBW_TOOLCHAIN_DIR:-$dhbw_repo_dir/.tools}"
[[ "$DHBW_TOOLCHAIN_DIR" == /* ]] || DHBW_TOOLCHAIN_DIR="$PWD/$DHBW_TOOLCHAIN_DIR"
export DHBW_TOOLCHAIN_DIR
if [[ ! -x "$DHBW_TOOLCHAIN_DIR/quarto-$QUARTO_VERSION/bin/quarto" ]]; then
  echo 'Pinned Quarto is missing. Run bash scripts/setup.sh first.' >&2
  return 1
fi
export PATH="$DHBW_TOOLCHAIN_DIR/quarto-$QUARTO_VERSION/bin:$DHBW_TOOLCHAIN_DIR/node-$NODE_VERSION/bin:$DHBW_TOOLCHAIN_DIR/texlive-$TEXLIVE_VERSION/bin/x86_64-linux:$DHBW_TOOLCHAIN_DIR/rsvg-$RSVG_VERSION/usr/bin:$PATH"
export XDG_CACHE_HOME="$DHBW_TOOLCHAIN_DIR/cache"
export XDG_CONFIG_HOME="$DHBW_TOOLCHAIN_DIR/config"
export XDG_DATA_HOME="$DHBW_TOOLCHAIN_DIR/data"
export QUARTO_CHROMIUM="$DHBW_TOOLCHAIN_DIR/chrome-$CHROME_VERSION/chrome-headless-shell-linux64/chrome-headless-shell"
export QUARTO_TEXLIVE_BINPATH="$DHBW_TOOLCHAIN_DIR/texlive-$TEXLIVE_VERSION/bin/x86_64-linux"
export TEXMFVAR="$DHBW_TOOLCHAIN_DIR/texmf-var"
export TEXMFCONFIG="$DHBW_TOOLCHAIN_DIR/texmf-config"
export TEXMFHOME="$DHBW_TOOLCHAIN_DIR/texmf-home"
export TEXMFLOCAL="{$DHBW_TOOLCHAIN_DIR/tex-support-$TEX_SUPPORT_VERSION/texmf,$DHBW_TOOLCHAIN_DIR/texlive-$TEXLIVE_VERSION/texmf-local}"
# Do not inherit fonts from a different TeX distribution (e.g. an older setup).
unset OPENTYPEFONTS
# Node's built-in fetch (used by livefigures) must honor the session's proxy.
# Inherited proxy variables, NO_PROXY and CA configuration remain intact.
export NODE_USE_ENV_PROXY=1
mkdir -p "$XDG_CACHE_HOME" "$XDG_CONFIG_HOME" "$XDG_DATA_HOME" "$TEXMFVAR" "$TEXMFCONFIG" "$TEXMFHOME"
# XeTeX resolves font family names through Fontconfig, unlike LuaTeX's loader.
# Expose the pinned bundle's fonts without installing host-wide font packages.
export FONTCONFIG_FILE="$XDG_CONFIG_HOME/tex-fontconfig.xml"
python3 - "$DHBW_TOOLCHAIN_DIR" "$TEXLIVE_VERSION" "$FONTCONFIG_FILE" <<'PY'
from pathlib import Path
import sys
import xml.etree.ElementTree as ET
directory, version, filename = sys.argv[1:]
root = ET.Element("fontconfig")
ET.SubElement(root, "include", ignore_missing="yes").text = "/etc/fonts/fonts.conf"
ET.SubElement(root, "dir").text = str(Path(directory) / f"texlive-{version}/texmf-dist/fonts/opentype")
cache = Path(directory) / "cache/fontconfig"
cache.mkdir(parents=True, exist_ok=True)
ET.SubElement(root, "cachedir").text = str(cache)
content = ET.tostring(root, encoding="unicode")
path = Path(filename)
if not path.exists() or path.read_text(encoding="utf-8") != content:
    path.write_text(content, encoding="utf-8")
PY
unset dhbw_repo_dir
