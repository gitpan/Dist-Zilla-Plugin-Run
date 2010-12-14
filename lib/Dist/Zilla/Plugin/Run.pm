package Dist::Zilla::Plugin::Run;
BEGIN {
  $Dist::Zilla::Plugin::Run::AUTHORITY = 'cpan:GETTY';
}
BEGIN {
  $Dist::Zilla::Plugin::Run::VERSION = '0.003';
}
# ABSTRACT: Overview Module - just documentation
use strict;
use warnings;


1;

__END__
=pod

=head1 NAME

Dist::Zilla::Plugin::Run - Overview Module - just documentation

=head1 VERSION

version 0.003

=head1 SYNOPSIS

  [Run::BeforeRelease]
  run = script/myapp_before.pl %s

  [Run::Release]
  run = script/myapp_deploy.pl %s

  [Run::AfterRelease]
  run = script/myapp_after.pl %s

=head1 AUTHOR

Torsten Raudssus <torsten@raudssus.de> L<http://www.raudssus.de/>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2010 by L<Raudssus Social Software|http://www.raudssus.de/>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

