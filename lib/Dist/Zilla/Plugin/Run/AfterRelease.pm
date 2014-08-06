use strict;
use warnings;

package Dist::Zilla::Plugin::Run::AfterRelease;
BEGIN {
  $Dist::Zilla::Plugin::Run::AfterRelease::AUTHORITY = 'cpan:GETTY';
}
# ABSTRACT: execute a command of the distribution after release
$Dist::Zilla::Plugin::Run::AfterRelease::VERSION = '0.023';
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
    pos     => [$archive, sub { $self->zilla->version }]
  });
}

#pod =head1 SYNOPSIS
#pod
#pod   [Run::AfterRelease]
#pod   run = script/myapp_after.pl --archive %s --version %s
#pod
#pod or
#pod
#pod   [Run::AfterRelease / MyAppAfter]
#pod   run = script/myapp_after.pl %s %s
#pod
#pod =head1 DESCRIPTION
#pod
#pod This plugin executes the specified command after releasing.
#pod
#pod =head1 POSITIONAL PARAMETERS
#pod
#pod See L<Dist::Zilla::Plugin::Run/CONVERSIONS>
#pod for the list of common formatting variables available to all plugins.
#pod
#pod For backward compatibility:
#pod
#pod =for :list
#pod * The 1st C<%s> will be replaced by the archive of the release.
#pod * The 2nd C<%s> will be replaced by the dist version.
#pod
#pod =cut

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Dist::Zilla::Plugin::Run::AfterRelease - execute a command of the distribution after release

=head1 VERSION

version 0.023

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

Torsten Raudssus <torsten@raudss.us> L<https://raudss.us/>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2010 by L<Raudssus Social Software|https://raudss.us/>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
