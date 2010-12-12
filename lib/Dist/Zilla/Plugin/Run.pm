package Dist::Zilla::Plugin::Run;
BEGIN {
  $Dist::Zilla::Plugin::Run::AUTHORITY = 'cpan:GETTY';
}
BEGIN {
  $Dist::Zilla::Plugin::Run::VERSION = '0.001';
}
# ABSTRACT: execute a command of the distribution on (so far) release
use Moose;
with 'Dist::Zilla::Role::Releaser';

use Cwd;

use namespace::autoclean;

has on_release => (
	is => 'ro',
	isa => 'Str',
	required => 1,
);

sub release {
	my ( $self, $archive ) = @_;

	if ($self->on_release) {
		my $command = sprintf($self->on_release,$archive);
		$self->log("Executing: ".$command);
		my $output = `$command`;
		$self->log($output);
		$self->log_fatal("Errorlevel ".$?." on command execute") if $?;		
		$self->log("on_release command executed successful");		
	}

}


1;

__END__
=pod

=head1 NAME

Dist::Zilla::Plugin::Run - execute a command of the distribution on (so far) release

=head1 VERSION

version 0.001

=head1 SYNOPSIS

  [Run]
  on_release = script/myapp_deploy.pl %s

=head1 DESCRIPTION

This plugin executes (so far) on release a command, if its given on config. %s gets replaced by the release archive file name.

=head1 AUTHOR

Torsten Raudssus <torsten@raudssus.de> L<http://www.raudssus.de/>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2010 by L<Raudssus Social Software|http://www.raudssus.de/>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

