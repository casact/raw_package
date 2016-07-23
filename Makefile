all:
	Rscript -e "devtools::document(roclets = c('rd', 'collate', 'namespace'))"
	Rscript -e "devtools::build(vignettes = FALSE)"
	Rscript -e "devtools::document(roclets = c('vignette'))"
	Rscript -e "devtools::build(vignettes = TRUE)"
	Rscript -e "devtools::check(args = c('--as-cran'))"
	Rscript -e "staticdocs::build_site()"