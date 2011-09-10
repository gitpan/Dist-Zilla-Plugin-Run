package Dist::Zilla::Plugin::Run::AfterBuild;
BEGIN {
  $Dist::Zilla::Plugin::Run::AfterBuild::AUTHORITY = 'cpan:GETTY';
}
{
  $Dist::Zilla::Plugin::Run::AfterBuild::VERSION = '0.010';
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
  $self->call_script({
    dir =>  $param->{ build_root },
    pos => [$param->{ build_root }, $self->zilla->version]
  });
}


1;

__END__
=pod

=head1 NAME

Dist::Zilla::Plugin::Run::AfterBuild - execute a command of the distribution after build

=head1 VERSION

version 0.010

=head1 SYNOPSIS

  [Run::AfterBuild]
  run = script/do_this.pl --dir %s --version %s
  run = script/do_that.pl

=head1 DESCRIPTION

This plugin executes the specified command after building the dist.

=head1 POSITIONAL PARAMETERS

See L<Dist::Zilla::Plugin::Run/CONVERSIONS>
for the list of common formatting variables available to all plugins.

For backward compatibility:

=over 4

=item *

The 1st C<%s> will be replaced by the directory in which the dist was built.

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

