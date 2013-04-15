use strict;
use warnings;

package Dist::Zilla::Plugin::Run::BeforeRelease;
BEGIN {
  $Dist::Zilla::Plugin::Run::BeforeRelease::AUTHORITY = 'cpan:GETTY';
}
{
  $Dist::Zilla::Plugin::Run::BeforeRelease::VERSION = '0.019';
}
# ABSTRACT: execute a command of the distribution before release
use Moose;
with qw(
	Dist::Zilla::Role::BeforeRelease
	Dist::Zilla::Plugin::Run::Role::Runner
);

use namespace::autoclean;

sub before_release {
  my ( $self, $archive ) = @_;
  $self->call_script({
    archive =>  $archive,
    pos     => [$archive]
  });
}


1;

__END__

=pod

=head1 NAME

Dist::Zilla::Plugin::Run::BeforeRelease - execute a command of the distribution before release

=head1 VERSION

version 0.019

=head1 SYNOPSIS

  [Run::BeforeRelease]
  run = script/myapp_before.pl %s

or

  [Run::BeforeRelease / MyAppBefore]
  run = script/myapp_before.pl %s

=head1 DESCRIPTION

This plugin executes the specified command before releasing.

=head1 POSITIONAL PARAMETERS

See L<Dist::Zilla::Plugin::Run/CONVERSIONS>
for the list of common formatting variables available to all plugins.

For backward compatibility:

=over 4

=item *

The 1st C<%s> will be replaced by the archive of the release.

=back

=head1 AUTHOR

Torsten Raudssus <torsten@raudssus.de> L<http://www.raudssus.de/>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2010 by L<Raudssus Social Software|http://www.raudssus.de/>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
