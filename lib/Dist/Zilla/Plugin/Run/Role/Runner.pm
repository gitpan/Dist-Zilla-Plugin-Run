use strict;
use warnings;

package Dist::Zilla::Plugin::Run::Role::Runner;
BEGIN {
  $Dist::Zilla::Plugin::Run::Role::Runner::AUTHORITY = 'cpan:GETTY';
}
{
  $Dist::Zilla::Plugin::Run::Role::Runner::VERSION = '0.012';
}
# ABSTRACT: Role for the packages of Dist::Zilla::Plugin::Run
use Moose::Role;
use String::Formatter 0.102082 ();
use namespace::autoclean;
use File::Spec (); # core
use IPC::Open3 (); # core
use Config     (); # core

has perlpath => (
    is      => 'ro',
    isa     => 'Str',
    builder => 'current_perl_path',
);

has run => (
    is => 'ro',
    isa  => 'ArrayRef',
    default => sub { [] },
);

around BUILDARGS => sub {
    my ( $orig, $class, @args ) = @_;
    my $built = $class->$orig(@args);

    foreach my $dep (qw( notexist_fatal )) {
        if ( exists $built->{$dep} ) {
            warn(" !\n ! $class attribute '$dep' is deprecated and has no effect.\n !\n");
            delete $built->{$dep};
        }
    }
    return $built;
};

sub call_script {
    my ( $self, $params ) = @_;

    foreach my $run_cmd (@{$self->run}) {

        if ($run_cmd) {
            my $command = $self->build_formatter($params)->format($run_cmd);
            $self->log("Executing: $command");

            # autoflush STDOUT so we can see command output right away
            local $| = 1;
            # combine stdout and stderr for ease of proxying through the logger
            my $pid = IPC::Open3::open3(my ($in, $out), undef, $command);
            while(defined(my $line = <$out>)){
                chomp($line); # logger appends its own newline
                $self->log($line);
            }
            # zombie repellent
            waitpid($pid, 0);
            my $status = ($? >> 8);

            $self->log_fatal("Command exited with status $status ($?)") if $status;
            $self->log("Command executed successfully");
        }
    } 
}

around mvp_multivalue_args => sub {
    my ($original, $self) = @_;
    
    my @res = $self->$original();

    push @res, qw( run );
    
    @res; 
};

my $path_separator = (File::Spec->catfile(qw(a b)) =~ m/^a(.+?)b$/)[0];

sub build_formatter {
    my ( $self, $params ) = @_;

    # stringify build directory
    my $dir = $params->{dir} || $self->zilla->built_in;
    $dir = $dir ? "$dir" : '';

    return String::Formatter->new({
        codes => {
            # not always available
            # explicitly pass a string (not an object) [rt-72008]
            a => defined $params->{archive} ? "$params->{archive}" : '',
            d => $dir,
            n => $self->zilla->name,
            p => $path_separator,
            v => $self->zilla->version,
            # positional replace (backward compatible)
            s => sub { shift(@{ $params->{pos} }) || '' },
            x => $self->perlpath,
        },
    });
}

sub current_perl_path {
    # see perlvar $^X
    my $perl = $Config::Config{perlpath};
    if ($^O ne 'VMS') {
        $perl .= $Config::Config{_exe}
            unless $perl =~ m/$Config::Config{_exe}$/i;
    }
    return $perl;
}


1;
# vim: set ts=4 sts=4 sw=4 expandtab smarttab:

__END__
=pod

=head1 NAME

Dist::Zilla::Plugin::Run::Role::Runner - Role for the packages of Dist::Zilla::Plugin::Run

=head1 VERSION

version 0.012

=head1 DESCRIPTION

This is the base role for all the plugins L<Dist::Zilla::Plugin::Run> delivers. You dont need this.

=head1 AUTHOR

Torsten Raudssus <torsten@raudssus.de> L<http://www.raudssus.de/>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2010 by L<Raudssus Social Software|http://www.raudssus.de/>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

