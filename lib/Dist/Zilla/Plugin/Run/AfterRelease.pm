package Dist::Zilla::Plugin::Run::AfterRelease;
BEGIN {
  $Dist::Zilla::Plugin::Run::AfterRelease::AUTHORITY = 'cpan:GETTY';
}
BEGIN {
  $Dist::Zilla::Plugin::Run::AfterRelease::VERSION = '0.006';
}
# ABSTRACT: execute a command of the distribution after release
use Moose;
with qw(
	Dist::Zilla::Role::AfterRelease
	Dist::Zilla::Plugin::Run::Role::Runner
);

use namespace::autoclean;

sub after_release {
    my $self = shift;
    
	$self->call_script(@_, $self->zilla->version);
}


1;

__END__
=pod

=head1 NAME

Dist::Zilla::Plugin::Run::AfterRelease - execute a command of the distribution after release

=head1 VERSION

version 0.006

=head1 SYNOPSIS

  [Run::AfterRelease]
  run = script/myapp_after.pl --archive %s --version %s

or

  [Run::AfterRelease / MyAppAfter]
  run = script/myapp_after.pl %s %s

=head1 DESCRIPTION

This plugin executes after release a command, if its given on config. The 1st %s get replaced by the archive of the release.
The 2nd - by the version of the distribution.

=head2 notexist_fatal

If this value is set to false, the plugin will ignore a not existing script. Default is true.

=head1 AUTHOR

Torsten Raudssus <torsten@raudssus.de> L<http://www.raudssus.de/>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2010 by L<Raudssus Social Software|http://www.raudssus.de/>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

