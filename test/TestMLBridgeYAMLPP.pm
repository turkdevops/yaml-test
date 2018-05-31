package TestMLBridgeYAMLPP;
use base 'TestML::Bridge';

use YAML::PP;

sub yaml_load {
    my ($self, $yaml) = @_;

    $yaml =~ s/<SPC>/ /g;
    $yaml =~ s/<TAB>/\t/g;

    return YAML::PP->new->load_string($yaml);
}

1;
