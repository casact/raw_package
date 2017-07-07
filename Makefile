NAIC_DATA = data/othliab.rda data/comauto.rda data/ppauto.rda data/wkcomp.rda data/medmal.rda data/prodliab.rda
STATE_REGION = data/StateExperience.rda data/RegionExperience.rda
COTOR = data/COTOR2.rda data/COTOR3.rda data/COTOR4.rda data/COTOR5.rda

all:package_build all_data build_site

package_build:all_data
	Rscript -e "devtools::document(roclets = c('rd', 'collate', 'namespace'))"
	Rscript -e "devtools::build(vignettes = FALSE)"
	Rscript -e "devtools::document(roclets = c('vignette'))"
	Rscript -e "devtools::build(vignettes = TRUE)"
	Rscript -e "devtools::check(args = c('--as-cran'))"
	Rscript -e "rmarkdown::render('README.Rmd')"
	Rscript -e "devtools::install()"

build_site:
	Rscript -e "pkgdown::build_site()"
	cp -rTu ./inst/web/ ~/projects/websites/raw_package/

all_data: $(NAIC_DATA) data/MultiTri.rda $(STATE_REGION) data/Hurricane.rda data/NJM_WC.rda $(COTOR) data/PPA.rda

$(STATE_REGION):data-raw/StateRegion.R
	Rscript -e "source('data-raw/StateRegion.R')"

data/Hurricane.rda:data-raw/Hurricane.R
	Rscript -e "source('data-raw/Hurricane.R')"

$(NAIC_DATA):data-raw/CAS_reserves.R
	Rscript -e "source('data-raw/CAS_reserves.R')"

data/MultiTri.rda:data-raw/MultiTri.R $(NAIC_DATA)
	Rscript -e "source('data-raw/MultiTri.R')"
	
data/NJM_WC.rda:data-raw/NJM_WC.R $(NAIC_DATA)
	Rscript -e "source('data-raw/NJM_WC.R')"
	
$(COTOR):data-raw/COTOR.R
	Rscript -e "source('data-raw/COTOR.R')"

data/PPA.rda:data-raw/WernerModlin.R
	Rscript -e "source('data-raw/WernerModlin.R')"

clean:
	rm -rf ./data/*.rda