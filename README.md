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

## Custom domain

The site is served at https://david-smalling.com. The `CNAME` file holds the
domain; don't delete it. DNS lives at Squarespace (the registrar): four A
records on `@` to 185.199.108-111.153 and `www` as a CNAME to
`thedgs.github.io`. Canonical URL, structured data, sitemap and robots all use
https://david-smalling.com/.

The art site is a separate Squarespace site at https://www.smallingstudio.com.

## Next

The full research site (31 essays, notes, a scorecard, RSS, and a Python build
script) is built and waiting. It drops in on top of this when the writing is
ready to publish.
