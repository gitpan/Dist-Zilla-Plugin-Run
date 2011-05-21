package Dist::Zilla::Plugin::Run::BeforeRelease;
BEGIN {
  $Dist::Zilla::Plugin::Run::BeforeRelease::AUTHORITY = 'cpan:GETTY';
}
BEGIN {
  $Dist::Zilla::Plugin::Run::BeforeRelease::VERSION = '0.006';
}
# ABSTRACT: execute a command of the distribution before release
use Moose;
with qw(
	Dist::Zilla::Role::BeforeRelease
	Dist::Zilla::Plugin::Run::Role::Runner
);

use namespace::autoclean;

sub before_release {
	shift->call_script(@_);
}


1;

__END__
=pod

=head1 NAME

Dist::Zilla::Plugin::Run::BeforeRelease - execute a command of the distribution before release

=head1 VERSION

version 0.006

=head1 SYNOPSIS

  [Run::BeforeRelease]
  run = script/myapp_before.pl %s

or

  [Run::BeforeRelease / MyAppBefore]
  run = script/myapp_before.pl %s

=head1 DESCRIPTION

This plugin executes before release a command, if its given on config. The %s get replaced by the archive of the release.

=head2 notexist_fatal

If this value is set to false, the plugin will ignore a not existing script. Default is true.

=head1 AUTHOR

Torsten Raudssus <torsten@raudssus.de> L<http://www.raudssus.de/>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2010 by L<Raudssus Social Software|http://www.raudssus.de/>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

