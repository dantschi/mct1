#!/usr/bin/env bash
# Register the pinned German patterns; this uses local files only, no tlmgr updates.
set -euo pipefail
repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source "$repo_dir/scripts/activate.sh"
tex_support="$DHBW_TOOLCHAIN_DIR/tex-support-$TEX_SUPPORT_VERSION"
package_marker="$tex_support/.installed-packages"
if [[ ! -f "$package_marker" ]] || [[ "$(cat "$package_marker")" != "$TEX_LUATEX_SHA256:$TEX_GERMAN_SHA256" ]]; then
  echo 'Pinned TeX support is missing or incomplete. Run bash scripts/setup.sh.' >&2
  exit 1
fi
# Include the recipe and source snippets so existing installs are repaired when
# registration changes. Mark success only after both formats have been rebuilt.
configuration_digest="$(
  { printf '%s\n' "$TEXLIVE_SHA256" "$TEX_GERMAN_SHA256";
    cat "$repo_dir/scripts/configure-tex.sh" "$repo_dir"/scripts/tex-support/language-local.*;
  } | sha256sum | cut -d ' ' -f 1
)"
configuration_marker="$tex_support/.configured-hyphenation-sha256"
if [[ -f "$configuration_marker" ]] && [[ "$(cat "$configuration_marker")" == "$configuration_digest" ]]; then
  exit 0
fi
config_dir="$tex_support/texmf/tex/generic/config"
mkdir -p "$config_dir"
cp "$repo_dir"/scripts/tex-support/language-local.* "$config_dir/"
mktexlsr "$tex_support/texmf"
# TEXMFLOCAL is a brace list of two trees. Pass each local configuration path
# explicitly rather than letting tlmgr concatenate a filename onto that list.
for extension in dat def dat.lua; do
  tlmgr generate "language.$extension" --localcfg "$config_dir/language-local.$extension"
done
fmtutil-sys --byfmt lualatex
fmtutil-sys --byfmt xelatex
printf '%s\n' "$configuration_digest" > "$configuration_marker.partial"
mv "$configuration_marker.partial" "$configuration_marker"
