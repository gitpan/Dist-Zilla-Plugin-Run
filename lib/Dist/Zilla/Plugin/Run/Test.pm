use strict;
use warnings;

package Dist::Zilla::Plugin::Run::Test;
# ABSTRACT: execute a command of the distribution after build
$Dist::Zilla::Plugin::Run::Test::VERSION = '0.028';
use Moose;
with qw(
    Dist::Zilla::Role::TestRunner
    Dist::Zilla::Plugin::Run::Role::Runner
);

use namespace::autoclean;

sub test {
    my ($self, $dir) = @_;

    $self->call_script({
        dir =>  $dir
    });
}

#pod =head1 SYNOPSIS
#pod
#pod   [Run::Test]
#pod   run = script/tester.pl --name %n --version %v some_file.ext
#pod
#pod
#pod =head1 DESCRIPTION
#pod
#pod This plugin executes the specified command during the test phase.
#pod
#pod =head1 CAVEAT
#pod
#pod Unlike the other [Run::*] plugins, when running the scripts, the
#pod current working directory will be the directory with
#pod newly built distribution. This is the way Dist::Zilla works.
#pod
#pod =head1 POSITIONAL PARAMETERS
#pod
#pod See L<Dist::Zilla::Plugin::Run/CONVERSIONS>
#pod for the list of common formatting variables available to all plugins.
#pod
#pod There are no positional parameters for this plugin.
#pod
#pod =cut

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Dist::Zilla::Plugin::Run::Test - execute a command of the distribution after build

=head1 VERSION

version 0.028

=head1 SYNOPSIS

  [Run::Test]
  run = script/tester.pl --name %n --version %v some_file.ext

=head1 DESCRIPTION

This plugin executes the specified command during the test phase.

=head1 CAVEAT

Unlike the other [Run::*] plugins, when running the scripts, the
current working directory will be the directory with
newly built distribution. This is the way Dist::Zilla works.

=head1 POSITIONAL PARAMETERS

See L<Dist::Zilla::Plugin::Run/CONVERSIONS>
for the list of common formatting variables available to all plugins.

There are no positional parameters for this plugin.

=head1 AUTHOR

Torsten Raudssus <torsten@raudss.us> L<https://raudss.us/>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2010 by L<Raudssus Social Software|https://raudss.us/>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
