#! bash

make setup >/dev/null || return

source ./testml/.rc

export PERL5LIB="YAML-PP-p5/lib${PERL5LIB:+:$PERL5LIB}"
