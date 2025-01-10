# Woo Witboek
## How it works
The content is in the 'witboek' directory. The Sass command line
tool compiles the CSS, and then Jekyll generates the static site.

###
For a new year:
- Edit docker-compose.yml and change the `make` command year
- Edit Makefile and include a section for the new year at the bottom
- Copy the directory of the previous year for the new year
- Enter the new directory
- Edit `_config.yml`
- Edit the Matomo code in `_layouts/default.html`
- Edit `index.html`

## To run locally
This repo includes submodules, so you’ll either want to start with a recursive
clone:

```
git clone --recursive git@github.com:openstate/woo-witboek.git
```

Or, if you’ve already cloned the project, you’ll want to update the submodules:

```
cd jaarverslag
git submodule update --init --recursive
```

Build and start the docker container

```
docker compose up -d
```

The container runs a `Makefile` command for the specified year which
automatically generates the Jekyll site and CSS files after a change in the
source files (very useful when actively developing). Output from both commands
can be viewed using `docker compose logs`.

The site will be available at http://0.0.0.0:4000 while the docker container
runs. Make sure the right `location /` part in our `nginx-load-balancer` is
used to serve it.

Once active development is finished stop the container and change the
`nginx-load-balancer` config to the right `location /` part so it serves the
HTML and files directly.

If you need to make a change, simply start the container, make and save the
change (the container will compile it) and stop the container.

Edit the stylesheets in `assets/sass` (not `assets/css` as this is the generated
output) and edit `index.html` (not `_site/index.html` which is also generated).
