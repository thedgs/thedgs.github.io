#!/usr/bin/env bash
# Deploy this page to GitHub Pages at https://<your-username>.github.io
# Safe to re-run. Figures out your username, fills the placeholder, creates the
# repo if needed, pushes, and turns Pages on.
set -euo pipefail

say() { printf '\n\033[1m%s\033[0m\n' "$*"; }
die() { printf '\n\033[31mERROR: %s\033[0m\n' "$*" >&2; exit 1; }

command -v git >/dev/null || die "git is not installed."
command -v gh  >/dev/null || die "GitHub CLI not installed. Install: https://cli.github.com  (macOS: brew install gh)"
gh auth status >/dev/null 2>&1 || die "Not logged in to GitHub. Run: gh auth login"

USERNAME="$(gh api user --jq .login)"
[ -n "$USERNAME" ] || die "Could not read your GitHub username."
REPO="${USERNAME}.github.io"
say "GitHub user: $USERNAME  ->  repo: $REPO"

# 1. Fill the GitHub link placeholder (portable; avoids GNU/BSD sed differences)
if grep -q "github.com/HANDLE" index.html; then
  python3 - "$USERNAME" <<'PY'
import sys, pathlib
u = sys.argv[1]
p = pathlib.Path("index.html")
t = p.read_text()
t = t.replace("https://github.com/HANDLE", f"https://github.com/{u}")
t = t.replace(' class="todo"', '')          # link is real now, drop the grey styling
t = t.replace("  <!-- Replace HANDLE in the GitHub link with your username. -->\n", "")
p.write_text(t)
print(f"  patched GitHub link -> github.com/{u}")
PY
else
  echo "  GitHub link already set, skipping"
fi

# 2. Local git
if [ ! -d .git ]; then
  git init -q
  git branch -M main
fi
git add -A
git diff --cached --quiet || git commit -q -m "Personal site: single page"
echo "  local commit ready"

# 3. Remote
if gh repo view "$USERNAME/$REPO" >/dev/null 2>&1; then
  echo "  repo exists"
  git remote get-url origin >/dev/null 2>&1 || git remote add origin "https://github.com/$USERNAME/$REPO.git"
else
  say "Creating $REPO"
  gh repo create "$REPO" --public --source=. --remote=origin
fi

say "Pushing"
git push -u origin main

# 4. Pages (user sites usually auto-enable; this makes it explicit and is safe to fail)
say "Enabling GitHub Pages"
gh api --method POST "repos/$USERNAME/$REPO/pages" \
  -f "source[branch]=main" -f "source[path]=/" >/dev/null 2>&1 \
  && echo "  Pages enabled" \
  || echo "  Pages already enabled (or enables itself on first push)"

say "Done. Your site: https://${USERNAME}.github.io"
echo "First build takes about a minute. Check status:"
echo "  https://github.com/$USERNAME/$REPO/actions"
