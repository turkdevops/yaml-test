ifeq ($(shell which node),)
    $(error You need to install NodeJS)
endif
ifeq ($(shell which testml-compiler),)
    $(error You need to install testml-compiler: 'npm install -g testml-compiler')
endif


# These are the variables that 'source testml/.rc' would set:
export TESTML_ROOT := $(PWD)/testml
export PATH := $(PWD)/testml/bin:$(PATH)
export PERL5LIB := $(PWD)/YAML-PP-p5:$(PERL5LIB)


DEPS := testml yaml-test-suite YAML-PP-p5



.PHONY: setup
setup: $(DEPS)

.PHONY: test
test: test-yamlpp-1 test-yamlpp-2

test-yamlpp-1: $(DEPS)
	testml \
	    -R perl-tap \
	    -B TestMLBridgeYAMLPP \
	    -I test \
	    -e '*in-yaml.yaml-load.ToJSON == FromJSON(*in-json).ToJSON' \
	    -e '  :"YAML load matches JSON load - +"' \
	    -a \
	    yaml-test-suite/test/2*.tml

test-yamlpp-2: $(DEPS)
	testml \
	    -R perl-tap \
	    -B TestMLBridgeYAMLPP \
	    -I test \
	    -a \
	    test/load-yaml-eq-load-json.tml \
	    yaml-test-suite/test/2*.tml

clean:
	rm -fr $(DEPS) .testml/



#------------------------------------------------------------------------------
yaml-test-suite:
	git worktree add -f $@ master

testml:
	git clone --depth=1 git@github.com:testml-lang/testml

YAML-PP-p5:
	git clone --depth=1 git@github.com:perlpunk/YAML-PP-p5
