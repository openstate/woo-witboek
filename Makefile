.PHONY: witboek witboek-jekyll witboek-sass
witboek:
	make -j 2 witboek-jekyll witboek-sass
witboek-jekyll:
	vendor/bin/jekyll serve --source witboek --destination witboek/_site --baseurl ''
witboek-sass:
	vendor/bin/sass --watch witboek/assets/sass:witboek/assets/css
