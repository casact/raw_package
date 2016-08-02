all:
	Rscript -e "devtools::document(roclets = c('rd', 'collate', 'namespace'))"
	Rscript -e "devtools::build(vignettes = FALSE)"
	Rscript -e "devtools::document(roclets = c('vignette'))"
	Rscript -e "devtools::build(vignettes = TRUE)"
	Rscript -e "devtools::check(args = c('--as-cran'))"
	Rscript -e "rmarkdown::render('README.Rmd')"
	Rscript -e "staticdocs::build_site()"
	cp -rTu ./inst/web/ ~/Projects/Websites/raw_package/