package Dist::Zilla::Plugin::Run::BeforeBuild;
BEGIN {
  $Dist::Zilla::Plugin::Run::BeforeBuild::AUTHORITY = 'cpan:GETTY';
}
BEGIN {
  $Dist::Zilla::Plugin::Run::BeforeBuild::VERSION = '0.005';
}
# ABSTRACT: execute a command of the distribution after build
use Moose;
with qw(
	Dist::Zilla::Role::BeforeBuild
	Dist::Zilla::Plugin::Run::Role::Runner
);

use namespace::autoclean;

sub before_build {
    my ($self) = @_;
    
	$self->call_script($self->zilla->version);
}


1;

__END__
=pod

=head1 NAME

Dist::Zilla::Plugin::Run::BeforeBuild - execute a command of the distribution after build

=head1 VERSION

version 0.005

=head1 SYNOPSIS

  [Run::BeforeBuild]
  run = script/do_this.pl --version %s
  run = script/do_that.pl

=head1 DESCRIPTION

This plugin executes before build a command, if its given on config. The %s get replaced by the version of the distribution.

=head2 notexist_fatal

If this value is set to false, the plugin will ignore a not existing script. Default is true.

=head1 AUTHOR

Torsten Raudssus <torsten@raudssus.de> L<http://www.raudssus.de/>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2010 by L<Raudssus Social Software|http://www.raudssus.de/>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

