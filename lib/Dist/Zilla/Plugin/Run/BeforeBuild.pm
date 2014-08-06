use strict;
use warnings;

package Dist::Zilla::Plugin::Run::BeforeBuild;
BEGIN {
  $Dist::Zilla::Plugin::Run::BeforeBuild::AUTHORITY = 'cpan:GETTY';
}
# ABSTRACT: execute a command of the distribution before build
$Dist::Zilla::Plugin::Run::BeforeBuild::VERSION = '0.023';
use Moose;
with qw(
    Dist::Zilla::Role::BeforeBuild
    Dist::Zilla::Plugin::Run::Role::Runner
);

use namespace::autoclean;

sub before_build {
    my ($self) = @_;
  $self->call_script({
    pos => [sub { $self->zilla->version }]
  });
}

#pod =head1 SYNOPSIS
#pod
#pod   [Run::BeforeBuild]
#pod   run = script/do_this.pl --version %s
#pod   run = script/do_that.pl
#pod
#pod
#pod =head1 DESCRIPTION
#pod
#pod This plugin executes the specified command before building the dist.
#pod
#pod =head1 POSITIONAL PARAMETERS
#pod
#pod See L<Dist::Zilla::Plugin::Run/CONVERSIONS>
#pod for the list of common formatting variables available to all plugins.
#pod
#pod For backward compatibility:
#pod
#pod =for :list
#pod * The 1st C<%s> will be replaced by the dist version.
#pod
#pod =cut

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Dist::Zilla::Plugin::Run::BeforeBuild - execute a command of the distribution before build

=head1 VERSION

version 0.023

=head1 SYNOPSIS

  [Run::BeforeBuild]
  run = script/do_this.pl --version %s
  run = script/do_that.pl

=head1 DESCRIPTION

This plugin executes the specified command before building the dist.

=head1 POSITIONAL PARAMETERS

See L<Dist::Zilla::Plugin::Run/CONVERSIONS>
for the list of common formatting variables available to all plugins.

For backward compatibility:

=over 4

=item *

The 1st C<%s> will be replaced by the dist version.

=back

=head1 AUTHOR

Torsten Raudssus <torsten@raudss.us> L<https://raudss.us/>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2010 by L<Raudssus Social Software|https://raudss.us/>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
