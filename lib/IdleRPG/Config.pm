package IdleRPG::Config;

use strict;
use warnings;

use AppConfig qw(:expand :argcount);

my $CONFFILE = 'lib/IdleRPG/irpg.conf';

my $config = AppConfig->new({
            CASE    => 1,
            GLOBAL  => {
                DEFAULT     => undef,
                ARGCOUNT    => ARGCOUNT_ONE,
            },
        });

my $init = 0;

my @EXPORT_OK = qw(get_config);
my %EXPORT_TAGS = ( config => [qw(get_config)] );

sub get_config {
    _init() unless $init;
    return $config;
}

sub _init {
    unless($init) {
        $config->define(
            'baseurl',
            'logo',
            'db',
            'modifiers',
            'botname',
            'server',
            'botchan',
            'map',
            'map_rel',
            'outmap',
        );
        $config->file($CONFFILE);

        $init = 1;
    }
}

1;
