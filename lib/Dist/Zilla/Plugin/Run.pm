package Dist::Zilla::Plugin::Run;
BEGIN {
  $Dist::Zilla::Plugin::Run::AUTHORITY = 'cpan:GETTY';
}
BEGIN {
  $Dist::Zilla::Plugin::Run::VERSION = '0.006';
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

version 0.006

=head1 SYNOPSIS

  [Run::BeforeRelease]
  run = script/myapp_before1.pl %s
  run = script/myapp_before2.pl %s

  [Run::Release]
  run = script/myapp_deploy1.pl %s
  run = script/myapp_deploy2.pl %s

  [Run::AfterRelease]
  run = script/myapp_after.pl %s

=head1 DESCRIPTION

Please be aware that so far just commands are possible which are inside your distribution (its a TODO to fix this).

=head1 AUTHOR

Torsten Raudssus <torsten@raudssus.de> L<http://www.raudssus.de/>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2010 by L<Raudssus Social Software|http://www.raudssus.de/>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

