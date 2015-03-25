src: topojson
	./bin/compile

topojson: topojson.tar.gz
	tar -zxvf $<

topojson.tar.gz:
	curl -L -o $@ https://github.com/camshaft/world-json/releases/download/0.1.0/topojson.tar.gz
