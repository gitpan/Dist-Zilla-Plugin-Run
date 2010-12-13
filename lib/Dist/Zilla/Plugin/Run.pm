package Dist::Zilla::Plugin::Run;
BEGIN {
  $Dist::Zilla::Plugin::Run::AUTHORITY = 'cpan:GETTY';
}
BEGIN {
  $Dist::Zilla::Plugin::Run::VERSION = '0.002';
}
# ABSTRACT: execute a command of the distribution on (so far) release
use Moose;
with qw(
	Dist::Zilla::Role::BeforeRelease
	Dist::Zilla::Role::Releaser
	Dist::Zilla::Role::AfterRelease
);

use Cwd;

use namespace::autoclean;

has [qw( on_release on_before_release on_after_release on_all )] => (
	is => 'ro',
	isa => 'Str',
);

has notexist_fatal => (
	is => 'ro',
	isa => 'Bool',
	default => sub { 1 },
);

sub before_release {
	shift->call_script('on_before_release',@_);
}

sub release {
	shift->call_script('on_release',@_);
}

sub after_release {
	shift->call_script('on_after_release',@_);
}

sub call_script {
	my ( $self, $hook, @params ) = @_;
	if ($self->$hook) {
		my @cmdparts = split(' ',$self->$hook);
		if (-f $cmdparts[0]) {
			my $command = sprintf($self->$hook,@params);
			$self->log("Executing: ".$command);
			my $output = `$command`;
			$self->log($output);
			$self->log_fatal("Errorlevel ".$?." on command execute") if $?;		
			$self->log($hook." command executed successful");
		} else {
			if ($self->notexist_fatal) {
				$self->log_fatal($hook." command not exist - breaking up here");
			} else {
				$self->log($hook." command not exist - ignoring this");
			}
		}
	}
	$self->call_script('on_all', $hook, @params) if $hook ne 'on_all';
}


1;

__END__
=pod

=head1 NAME

Dist::Zilla::Plugin::Run - execute a command of the distribution on (so far) release

=head1 VERSION

version 0.002

=head1 SYNOPSIS

  [Run]
  on_before_release = script/myapp_before_release.pl %s
  on_release = script/myapp_deploy.pl %s
  on_after_release = script/myapp_after_release.pl %s
  notexist_fatal = 1
  on_all = script/myapp_on_dzil.pl %s %s

=head1 DESCRIPTION

This plugin executes (so far) on release a command, if its given on config. The %s get replaced by the parameters called on
the hook of L<Dist::Zilla>.

=head1 METHOD

=head2 on_before_release

Script started on the before_release hook of L<Dist::Zilla>.

=head2 on_release

Script started on the release hook of L<Dist::Zilla>.

=head2 on_after_release

Script started on the after_release hook of L<Dist::Zilla>.

=head2 notexist_fatal

If this value is set to false, the plugin will ignore a not existing script. Default is true.

=head2 on_all

This script is called on every hook of L<Dist::Zilla> this plugin covers, but the first %s will be the name of the
hook of L<Dist::Zilla> and the rest gets replaced in order of the parameters. It gets called after the more specific
hook defined by the other parameters.

=head1 AUTHOR

Torsten Raudssus <torsten@raudssus.de> L<http://www.raudssus.de/>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2010 by L<Raudssus Social Software|http://www.raudssus.de/>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

