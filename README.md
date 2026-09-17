# <username>.github.io

A single static page. No build step, no dependencies, no framework.

    index.html   the whole site
    deploy.sh    one-command deploy to GitHub Pages

## Deploy

    ./deploy.sh

Needs the GitHub CLI, logged in (`brew install gh` then `gh auth login`).
The script finds your username, fills the GitHub link, creates the repo,
pushes, and turns Pages on. Safe to run more than once.

## Editing

Open `index.html` and edit the text inside `<main>` or the header. Commit and
push; Pages redeploys in under a minute.

The name at the top can be set in either face. In the `h1` rule near the top of
the stylesheet, two lines are marked SANS and two are marked SERIF. Uncomment
the pair you want and comment out the other.

## Custom domain (deliberately not configured)

There is no CNAME file. david-smalling.com currently points at another site.
When the DNS move is ready: add a `CNAME` file containing `david-smalling.com`,
set the custom domain under Settings > Pages, and point the apex at GitHub's
four A records (185.199.108-111.153).

## Next

The full research site (31 essays, notes, a scorecard, RSS, and a Python build
script) is built and waiting. It drops in on top of this when the writing is
ready to publish.
