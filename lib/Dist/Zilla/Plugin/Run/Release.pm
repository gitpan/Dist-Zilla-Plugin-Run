use strict;
use warnings;

package Dist::Zilla::Plugin::Run::Release;
# ABSTRACT: execute a command of the distribution on release
$Dist::Zilla::Plugin::Run::Release::VERSION = '0.029';
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

#pod =head1 SYNOPSIS
#pod
#pod   [Run::Release]
#pod   run = script/myapp_deploy.pl %s
#pod
#pod or
#pod
#pod   [Run::Release / MyAppDeploy]
#pod   run = script/myapp_deploy.pl %s
#pod
#pod =head1 DESCRIPTION
#pod
#pod This plugin executes the specified command for the release process.
#pod
#pod This way you can specify a custom release command without needing any other C<Releaser> plugin.
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
#pod
#pod =cut

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Dist::Zilla::Plugin::Run::Release - execute a command of the distribution on release

=head1 VERSION

version 0.029

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

Torsten Raudssus <torsten@raudss.us> L<https://raudss.us/>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2010 by L<Raudssus Social Software|https://raudss.us/>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
