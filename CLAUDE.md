# Task for the agent

Deploy this folder as a GitHub Pages personal site. Do it end to end without
asking the user to run anything by hand.

## Steps

1. Run `./deploy.sh`. It is idempotent and safe to re-run.
2. If `gh` is missing, install it (macOS: `brew install gh`) and continue.
3. If `gh auth status` fails, run `gh auth login` and walk the user through the
   browser prompt, then continue.
4. When it finishes, open `https://<username>.github.io` and confirm the page
   loads. Pages can take a minute on the first build; if it 404s, wait and retry
   once before reporting.
5. Report the live URL.

## What the script does

- Reads the GitHub username from `gh api user`
- Replaces the `HANDLE` placeholder in the GitHub contact link with that username
- Commits, creates `<username>.github.io` if absent, pushes to `main`
- Enables Pages from `main` at root

## Rules

- Do not add a CNAME file and do not configure a custom domain. david-smalling.com
  currently points at a different site and the DNS move is happening separately.
- Do not change the page's copy, typography, colors, or layout. The design is
  settled. Only the GitHub username placeholder gets filled in.
- The repo must be named exactly `<username>.github.io` so the site serves from
  the root with no subpath.
- Keep it public. GitHub Pages requires it on free accounts.

## Contents

    index.html   the entire site, no build step, no dependencies
    deploy.sh    the deployment script
    README.md    notes for future edits
