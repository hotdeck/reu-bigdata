
.PHONY: build
build:
	R -e 'rmarkdown::render("docs/index.Rmd")'

push: build
	git status && \
	git add . && \
	git commit -a -m"Updated slides" && \
	git push

pdf: push
	sleep 60s && \
	docker run -v `pwd`/docs:/slides astefanutti/decktape https://hotdeck.github.io/reu-bigdata urban-models.pdf
