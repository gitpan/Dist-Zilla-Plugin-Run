package Dist::Zilla::Plugin::Run::AfterBuild;
BEGIN {
  $Dist::Zilla::Plugin::Run::AfterBuild::AUTHORITY = 'cpan:GETTY';
}
BEGIN {
  $Dist::Zilla::Plugin::Run::AfterBuild::VERSION = '0.005';
}
# ABSTRACT: execute a command of the distribution after build
use Moose;
with qw(
	Dist::Zilla::Role::AfterBuild
	Dist::Zilla::Plugin::Run::Role::Runner
);

use namespace::autoclean;

sub after_build {
    my ($self, $param) = @_;
    
	$self->call_script($param->{ build_root }, $self->zilla->version);
}


1;

__END__
=pod

=head1 NAME

Dist::Zilla::Plugin::Run::AfterBuild - execute a command of the distribution after build

=head1 VERSION

version 0.005

=head1 SYNOPSIS

  [Run::AfterBuild]
  run = script/do_this.pl --dir %s --version %s
  run = script/do_that.pl

=head1 DESCRIPTION

This plugin executes after build a command, if its given on config. The 1st %s get replaced by the directory, containing the distribution just built.
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

