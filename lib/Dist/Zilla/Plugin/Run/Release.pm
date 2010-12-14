package Dist::Zilla::Plugin::Run::Release;
BEGIN {
  $Dist::Zilla::Plugin::Run::Release::AUTHORITY = 'cpan:GETTY';
}
BEGIN {
  $Dist::Zilla::Plugin::Run::Release::VERSION = '0.003';
}
# ABSTRACT: execute a command of the distribution on (so far) release
use Moose;
with qw(
	Dist::Zilla::Role::Releaser
	Dist::Zilla::Plugin::Run::Role::Runner
);

use namespace::autoclean;

sub release {
	shift->call_script(@_);
}


1;

__END__
=pod

=head1 NAME

Dist::Zilla::Plugin::Run::Release - execute a command of the distribution on (so far) release

=head1 VERSION

version 0.003

=head1 SYNOPSIS

  [Run::Release]
  run = script/myapp_deploy.pl %s

or

  [Run::Release / MyAppDeploy]
  run = script/myapp_deploy.pl %s

=head1 DESCRIPTION

This plugin executes on release a command, if its given on config. The %s get replaced by the archive of the release.

=head2 notexist_fatal

If this value is set to false, the plugin will ignore a not existing script. Default is true.

=head1 AUTHOR

Torsten Raudssus <torsten@raudssus.de> L<http://www.raudssus.de/>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2010 by L<Raudssus Social Software|http://www.raudssus.de/>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

