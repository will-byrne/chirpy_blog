.PHONY: serve build deploy remote_deploy

serve:
	bundle exec jekyll serve --drafts

build:
	bundle exec jekyll build

deploy: build
	rm -r /var/www/jekyll
	cp -r _site /var/www/jekyll

remote_deploy: build
	ssh rose@willbyrne.dev "rm -r /var/www/jekyll"
	scp -r _site rose@willbyrne.dev:/var/www/jekyll
