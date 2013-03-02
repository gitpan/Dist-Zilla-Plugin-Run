use strict;
use warnings;

package Dist::Zilla::Plugin::Run::BeforeBuild;
BEGIN {
  $Dist::Zilla::Plugin::Run::BeforeBuild::AUTHORITY = 'cpan:GETTY';
}
{
  $Dist::Zilla::Plugin::Run::BeforeBuild::VERSION = '0.018';
}
# ABSTRACT: execute a command of the distribution before build
use Moose;
with qw(
	Dist::Zilla::Role::BeforeBuild
	Dist::Zilla::Plugin::Run::Role::Runner
);

use namespace::autoclean;

sub before_build {
    my ($self) = @_;
  $self->call_script({
    pos => [$self->zilla->version]
  });
}


1;

__END__
=pod

=head1 NAME

Dist::Zilla::Plugin::Run::BeforeBuild - execute a command of the distribution before build

=head1 VERSION

version 0.018

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

Torsten Raudssus <torsten@raudssus.de> L<http://www.raudssus.de/>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2010 by L<Raudssus Social Software|http://www.raudssus.de/>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

