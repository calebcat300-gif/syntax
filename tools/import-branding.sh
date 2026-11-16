#!/usr/bin/env bash
set -euo pipefail
project="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source_dir="${1:-$HOME/Downloads/syntaxx}"
dest="$project/assets/branding"
[[ -d "$source_dir" ]] || { echo "No branding folder: $source_dir" >&2; exit 1; }
mkdir -p "$dest"
for n in nobgnotext nobgwithtext textandbg; do
  if [[ -e "$source_dir/$n" ]]; then
    cp -a "$source_dir/$n" "$dest/"
    echo "Copied original $n"
  else
    echo "Not found: $n" >&2
  fi
done
make_png() {
  local source="$1" output="$2" candidate=""
  [[ -e "$source" ]] || return 0
  if [[ -f "$source" ]]; then
    candidate="$source"
  else
    candidate="$(find "$source" -type f \( -iname '*.png' -o -iname '*.webp' -o -iname '*.jpg' -o -iname '*.jpeg' \) -print -quit)"
  fi
  [[ -n "$candidate" ]] || return 0
  local mime="$(file -b --mime-type "$candidate")"
  if [[ "$mime" == 'image/png' ]]; then
    cp "$candidate" "$dest/$output"
  elif command -v magick >/dev/null 2>&1; then
    magick "$candidate" "$dest/$output"
  else
    echo "Need ImageMagick to convert $candidate to PNG" >&2
  fi
}
make_png "$source_dir/textandbg" hero.png
make_png "$source_dir/nobgnotext" icon.png
make_png "$source_dir/nobgwithtext" lockup.png
[[ -f "$dest/hero.png" ]] && echo "Created README hero.png" || echo "No hero.png; inspect textandbg source."
