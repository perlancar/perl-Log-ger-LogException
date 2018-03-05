package Log::ger::LogException;

# DATE
# VERSION

use Log::ger;

my $prev_die_handler  = $SIG{__DIE__};
my $prev_warn_handler = $SIG{__WARN__};

$SIG{__DIE__} = sub {
    my ($msg) = @_;
    chomp $msg;
    log_fatal "die(): $msg";
    if ($prev_die_handler) { goto &$prev_die_handler } else { die @_ }
};

$SIG{__WARN__} = sub {
    my ($msg) = @_;
    chomp $msg;
    log_warn "warn(): $msg";
    if ($prev_warn_handler) { goto &$prev_warn_handler } else { warn @_ }
};

1;
# ABSTRACT: Log warn()/die()

=head1 SYNOPSIS

 use Log::ger::LogException;

 warn "blah ..."; # "blah ..." will be logged as well as printed to stderr
 die  "argh ..."; # "argh ..." will be logged as well as printed to stderr, then we die


=head1 DESCRIPTION


=head1 SEE ALSO
