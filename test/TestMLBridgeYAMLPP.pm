package TestMLBridgeYAMLPP;
use base 'TestML::Bridge';

use YAML::PP;
use YAML::PP::Parser;

our @output;

my $parser = YAML::PP::Parser->new(
  receiver => sub {
    my ($self, @args) = @_;
    push @output, YAML::PP::Parser->event_to_test_suite(\@args);
  },
);

sub yaml_load {
    my ($self, $yaml) = @_;

    $yaml =~ s/<SPC>/ /g;
    $yaml =~ s/<TAB>/\t/g;

    return YAML::PP->new->load_string($yaml);
}

sub to_events {
    my ($self, $yaml) = @_;

    $parser->parse($yaml);

    join "\n", @output, '';
}

1;
