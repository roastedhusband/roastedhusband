---
---
PATH := ../node_modules/.bin:$(PATH)

FA_ROOT_DIRECTORY = assets/{{ site.fontawesome.fa_fnt_prefix }}
RH_ROOT_DIRECTORY = assets/{{ site.fontawesome.rh_fnt_prefix }}

FA_LESS_DIRECTORY = assets/{{ site.fontawesome.fa_fnt_prefix }}/less
RH_LESS_DIRECTORY = assets/{{ site.fontawesome.rh_fnt_prefix }}/less

FA_SCSS_DIRECTORY = assets/{{ site.fontawesome.fa_fnt_prefix }}/scss
RH_SCSS_DIRECTORY = assets/{{ site.fontawesome.rh_fnt_prefix }}/scss

FA_CSS_DIRECTORY = assets/{{ site.fontawesome.fa_fnt_prefix }}/css
RH_CSS_DIRECTORY = assets/{{ site.fontawesome.rh_fnt_prefix }}/css

FA_LESS_MODERN = ${FA_LESS_DIRECTORY}/{{ site.fontawesome.fa_fnt_prefix }}.less
RH_LESS_MODERN = ${RH_LESS_DIRECTORY}/{{ site.fontawesome.rh_fnt_prefix }}.less

FA_SCSS_MODERN = ${FA_SCSS_DIRECTORY}/{{ site.fontawesome.fa_fnt_prefix }}.scss
RH_SCSS_MODERN = ${RH_SCSS_DIRECTORY}/{{ site.fontawesome.rh_fnt_prefix }}.scss

FA_CSS_MODERN = ${FA_CSS_DIRECTORY}/{{ site.fontawesome.fa_fnt_prefix }}.css
RH_CSS_MODERN = ${RH_CSS_DIRECTORY}/{{ site.fontawesome.rh_fnt_prefix }}.css

FA_CSS_MODERN_MIN = ${FA_CSS_DIRECTORY}/{{ site.fontawesome.fa_fnt_prefix }}.min.css
RH_CSS_MODERN_MIN = ${RH_CSS_DIRECTORY}/{{ site.fontawesome.rh_fnt_prefix }}.min.css

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
	
	cd assets && mv {{ site.fontawesome.rh_fnt_prefix }} {{ site.fontawesome.rh_fnt_prefix }}-{{ site.fontawesome.version }} && zip -r9 {{ site.fontawesome.rh_fnt_prefix }}-{{ site.fontawesome.version }}.zip {{ site.fontawesome.rh_fnt_prefix }}-{{ site.fontawesome.version }} && mv {{ site.fontawesome.rh_fnt_prefix }}-{{ site.fontawesome.version }} {{ site.fontawesome.rh_fnt_prefix }}

	find .. -type f ! -perm 644 -exec chmod 644 {} \;

default: build


.PHONY: build
