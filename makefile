JEKYLL_VERSION=3.8

serve:
	docker run --rm \
	--volume="$(PWD):/srv/jekyll" \
	-p 4000:4000 \
	-it jekyll/jekyll:$(JEKYLL_VERSION) \
	jekyll serve --drafts

shell:
	docker run --rm \
	--volume="$(PWD):/srv/jekyll" \
	-p 4000:4000 \
	-w /srv/jekyll \
	-it jekyll/jekyll:$(JEKYLL_VERSION) \
	bash

build:
	docker run --rm \
	--volume="$(PWD):/srv/jekyll" \
	-p 4000:4000 \
	-it jekyll/jekyll:$(JEKYLL_VERSION) \
	jekyll build

deploy: build
	gsutil cp -r ./_site/ gs://datadyne.io/
