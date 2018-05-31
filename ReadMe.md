Using TestML with the YAML Test Suite
=====================================

# Synopsis

Try `make test` to see some premade tests run.

To run `testml` commands from the command line yourself, first do:
```
source ./setup.sh
```

Then run testml commands like:
```
testml -h
testml -R perl-tap -B TestMLBridgeYAMLPP -I test -a test/load-yaml-eq-load-json.tml yaml-test-suite/test/2*.tml
```
