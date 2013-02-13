use strict;
use warnings;

package Dist::Zilla::Plugin::Run::Release;
BEGIN {
  $Dist::Zilla::Plugin::Run::Release::AUTHORITY = 'cpan:GETTY';
}
{
  $Dist::Zilla::Plugin::Run::Release::VERSION = '0.016';
}
# ABSTRACT: execute a command of the distribution on release
use Moose;
with qw(
	Dist::Zilla::Role::Releaser
	Dist::Zilla::Plugin::Run::Role::Runner
);

use namespace::autoclean;

sub release {
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

Dist::Zilla::Plugin::Run::Release - execute a command of the distribution on release

=head1 VERSION

version 0.016

=head1 SYNOPSIS

  [Run::Release]
  run = script/myapp_deploy.pl %s

or

  [Run::Release / MyAppDeploy]
  run = script/myapp_deploy.pl %s

=head1 DESCRIPTION

This plugin executes the specified command for the release process.

This way you can specify a custom release command without needing any other C<Releaser> plugin.

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
