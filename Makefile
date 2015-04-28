WORLD_JSON_VERSION?=0.1.2

src: topojson translations
	./bin/compile

topojson: topojson.tar.gz
	tar -zxvf $<
topojson.tar.gz:
	curl -L -o $@ https://github.com/camshaft/world-json/releases/download/$(WORLD_JSON_VERSION)/topojson.tar.gz

translations: translations.tar.gz
	tar -zxvf $<
translations.tar.gz:
	curl -L -o $@ https://github.com/camshaft/world-json/releases/download/$(WORLD_JSON_VERSION)/translations.tar.gz
