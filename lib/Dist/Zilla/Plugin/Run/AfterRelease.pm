package Dist::Zilla::Plugin::Run::AfterRelease;
BEGIN {
  $Dist::Zilla::Plugin::Run::AfterRelease::AUTHORITY = 'cpan:GETTY';
}
{
  $Dist::Zilla::Plugin::Run::AfterRelease::VERSION = '0.007';
}
# ABSTRACT: execute a command of the distribution after release
use Moose;
with qw(
	Dist::Zilla::Role::AfterRelease
	Dist::Zilla::Plugin::Run::Role::Runner
);

use namespace::autoclean;

sub after_release {
  my ( $self, $archive ) = @_;
  $self->call_script({
    archive =>  $archive,
    pos     => [$archive, $self->zilla->version]
  });
}


1;

__END__
=pod

=head1 NAME

Dist::Zilla::Plugin::Run::AfterRelease - execute a command of the distribution after release

=head1 VERSION

version 0.007

=head1 SYNOPSIS

  [Run::AfterRelease]
  run = script/myapp_after.pl --archive %s --version %s

or

  [Run::AfterRelease / MyAppAfter]
  run = script/myapp_after.pl %s %s

=head1 DESCRIPTION

This plugin executes the specified command after releasing.

=head1 POSITIONAL PARAMETERS

See L<Dist::Zilla::Plugin::Run/CONVERSIONS>
for the list of common formatting variables available to all plugins.

For backward compatibility:

=over 4

=item *

The 1st C<%s> will be replaced by the archive of the release.

=item *

The 2nd C<%s> will be replaced by the dist version.

=back

=head1 AUTHOR

Torsten Raudssus <torsten@raudssus.de> L<http://www.raudssus.de/>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2010 by L<Raudssus Social Software|http://www.raudssus.de/>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

