.PHONY: clean

PORT := 9000

CONTENTS := $(wildcard *.lua) $(wildcard *.md) $(wildcard *.po2) \
  apps development docs download img news powered sitemap style testimonials wiki

werc.alg: $(CONTENTS)
	@mkdir -p werc && cp -r $(CONTENTS) werc && zip -q -r '$@' werc && rm -rf werc && echo 'Created $@'

debug:
	@echo 'Serving .'
	@algernon -n -t . :$(PORT)

run: werc.alg
	@echo 'Serving $<'
	@algernon -n -t '$<' :$(PORT)

clean:
	@rm -f werc.alg
