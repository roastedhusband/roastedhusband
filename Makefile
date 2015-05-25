PATH := ../node_modules/.bin:$(PATH)

FA_ROOT_DIRECTORY = assets/font-awesome
RH_ROOT_DIRECTORY = assets/roasted-husband

FA_LESS_DIRECTORY = assets/font-awesome/less
RH_LESS_DIRECTORY = assets/roasted-husband/less

FA_SCSS_DIRECTORY = assets/font-awesome/scss
RH_SCSS_DIRECTORY = assets/roasted-husband/scss

FA_CSS_DIRECTORY = assets/font-awesome/css
RH_CSS_DIRECTORY = assets/roasted-husband/css

FA_LESS_MODERN = ${FA_LESS_DIRECTORY}/font-awesome.less
RH_LESS_MODERN = ${RH_LESS_DIRECTORY}/roasted-husband.less

FA_SCSS_MODERN = ${FA_SCSS_DIRECTORY}/font-awesome.scss
RH_SCSS_MODERN = ${RH_SCSS_DIRECTORY}/roasted-husband.scss

FA_CSS_MODERN = ${FA_CSS_DIRECTORY}/font-awesome.css
RH_CSS_MODERN = ${RH_CSS_DIRECTORY}/roasted-husband.css

FA_CSS_MODERN_MIN = ${FA_CSS_DIRECTORY}/font-awesome.min.css
RH_CSS_MODERN_MIN = ${RH_CSS_DIRECTORY}/roasted-husband.min.css

SITE_LESS_DIRECTORY = assets/less
SITE_CSS_DIRECTORY = assets/css

SITE_LESS = ${SITE_LESS_DIRECTORY}/site.less
SITE_CSS = ${SITE_CSS_DIRECTORY}/site.css

build:
	@echo "Compiling Less files"
	@mkdir -p ${FA_CSS_DIRECTORY}
	@mkdir -p ${RH_CSS_DIRECTORY}

	lessc ${FA_LESS_MODERN} > ${FA_CSS_MODERN}
	lessc ${RH_LESS_MODERN} > ${RH_CSS_MODERN}
	
	lessc --compress ${FA_LESS_MODERN} > ${FA_CSS_MODERN_MIN}
	lessc --compress ${RH_LESS_MODERN} > ${RH_CSS_MODERN_MIN}
#	sass ${FA_SCSS_MODERN} ${FA_CSS_MODERN}

	lessc ${SITE_LESS} > ${SITE_CSS}

	cp -r ${FA_ROOT_DIRECTORY}/* ../
	cp -r ${RH_ROOT_DIRECTORY}/* ../

	mv README.md-nobuild ../README.md
	
	cd assets && mv roasted-husband roasted-husband-1.0.0 && zip -r9 roasted-husband-1.0.0.zip roasted-husband-1.0.0 && mv roasted-husband-1.0.0 roasted-husband

	find .. -type f ! -perm 644 -exec chmod 644 {} \;

default: build


.PHONY: build
