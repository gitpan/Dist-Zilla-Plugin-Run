package Dist::Zilla::Plugin::Run;
BEGIN {
  $Dist::Zilla::Plugin::Run::AUTHORITY = 'cpan:GETTY';
}
{
  $Dist::Zilla::Plugin::Run::VERSION = '0.011';
}
# ABSTRACT: Running external commands on specific hooks of Dist::Zilla
use strict;
use warnings;


1;

__END__
=pod

=head1 NAME

Dist::Zilla::Plugin::Run - Running external commands on specific hooks of Dist::Zilla

=head1 VERSION

version 0.011

=head1 SYNOPSIS

  [Run::BeforeRelease]
  run = script/myapp_before1.pl %s
  run = script/myapp_before2.pl %n %v

  [Run::Release]
  run = script/myapp_deploy1.pl %s
  run = deployer.pl --dir %d --tgz %a --name %n --version %v

  [Run::AfterRelease]
  run = script/myapp_after.pl %s %v
  ; %p can be used as the path separator if you have contributors on a different OS
  run = script%pmyapp_after.pl %s %v

=head1 DESCRIPTION

Run arbitrary commands at various L<Dist::Zilla> phases.

=head1 CONVERSIONS

The following conversions/format specifiers are defined
for passing as arguments to the specified commands
(though not all values are available at all phases).

=over 4

=item *

C<%a> the archive of the release (available to all C<*Release> phases)

=item *

C<%d> the directory in which the dist was built (not in C<BeforeBuild>)

=item *

C<%n> the dist name

=item *

C<%p> path separator ('/' on Unix, '\\' on Win32... useful for cross-platform dist.ini files)

=item *

C<%v> the dist version

=back

Additionally C<%s> is retained for backward compatibility.
Each occurrence is replaced by a different value
(like the regular C<sprintf> function).
Individual plugins define their own values for the positional replacement of C<%s>.

=head1 AUTHOR

Torsten Raudssus <torsten@raudssus.de> L<http://www.raudssus.de/>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2010 by L<Raudssus Social Software|http://www.raudssus.de/>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

