package Dist::Zilla::Plugin::Run::Role::Runner;
BEGIN {
  $Dist::Zilla::Plugin::Run::Role::Runner::AUTHORITY = 'cpan:GETTY';
}
BEGIN {
  $Dist::Zilla::Plugin::Run::Role::Runner::VERSION = '0.004';
}
# ABSTRACT: Role for the packages of Dist::Zilla::Plugin::Run
use Moose::Role;
use namespace::autoclean;

has run => (
	is => 'ro',
	isa => 'Str',
);

has notexist_fatal => (
	is => 'ro',
	isa => 'Bool',
	default => sub { 1 },
);

sub call_script {
	my ( $self, @params ) = @_;
	if ($self->run) {
		my @cmdparts = split(' ',$self->run);
		# this is not good, i should also check if its a command in PATH
		if (-f $cmdparts[0]) {
			my $command = sprintf($self->run,@params);
			$self->log("Executing: ".$command);
			my $output = `$command`;
			$self->log($output);
			$self->log_fatal("Errorlevel ".$?." on command execute") if $?;		
			$self->log("command executed successful");
		} else {
			if ($self->notexist_fatal) {
				$self->log_fatal($cmdparts[0]." command not exist - breaking up here");
			} else {
				$self->log($cmdparts[0]." command not exist - ignoring this");
			}
		}
	}
}


1;

__END__
=pod

=head1 NAME

Dist::Zilla::Plugin::Run::Role::Runner - Role for the packages of Dist::Zilla::Plugin::Run

=head1 VERSION

version 0.004

=head1 DESCRIPTION

This is the base role for all the plugins L<Dist::Zilla::Plugin::Run> delivers. You dont need this.

=head1 AUTHOR

Torsten Raudssus <torsten@raudssus.de> L<http://www.raudssus.de/>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2010 by L<Raudssus Social Software|http://www.raudssus.de/>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

