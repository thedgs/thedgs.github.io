# david-smalling.com

A single static page served by GitHub Pages from `main`. No build step: push to `main` and the site redeploys in about a minute.

    index.html                    the page
    404.html + redirect.js        forwards old art-site paths to smallingstudio.com
    rosa-widgets.js               interactive figure, copied from the ROSA project page (provenance in its header)
    widget-fallback.js            hides the interactive figure if its script fails to start
    hanami.jpg, hanami-1400.jpg, hanami-800.jpg     Hanami at 2660, 1400 and 800 px wide
    portrait.jpg, portrait-800.jpg                  header portrait at 400 and 800 px wide
    robots.txt, sitemap.xml       search-engine files
    CNAME                         the custom domain. Do not delete.
    google01de7b4257c8e82f.html   Search Console verification. Do not delete.
    .nojekyll                     serve files exactly as committed

## Editing

Edit `index.html` and push. The name at the top can be set in either face: in the `h1` rule near the top of the stylesheet, two lines are marked SANS and two are marked SERIF; swap which pair is commented out.

## Domain

DNS for david-smalling.com points at GitHub Pages. Keep the `CNAME` file, and keep the GitHub Pages domain-verification TXT record in DNS once it has been created.
