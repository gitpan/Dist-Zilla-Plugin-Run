use strict;
use warnings;

package Dist::Zilla::Plugin::Run::AfterMint;
BEGIN {
  $Dist::Zilla::Plugin::Run::AfterMint::AUTHORITY = 'cpan:GETTY';
}
# ABSTRACT: Execute a command after a new dist is minted
$Dist::Zilla::Plugin::Run::AfterMint::VERSION = '0.021';
use Moose;
with qw(
  Dist::Zilla::Role::AfterMint
  Dist::Zilla::Plugin::Run::Role::Runner
);

use namespace::autoclean;

sub after_mint {
  my ($self, $param) = @_;
  $self->call_script({
    dir     => $param->{mint_root},
    minting => 1,
  });
}


1;

__END__

=pod

=head1 NAME

Dist::Zilla::Plugin::Run::AfterMint - Execute a command after a new dist is minted

=head1 VERSION

version 0.021

=head1 SYNOPSIS

  [Run::AfterMint]
  run = some command %d

=head1 DESCRIPTION

This plugin executes the specified command after minting a new dist.

=head1 CONVERSIONS

See L<Dist::Zilla::Plugin::Run/CONVERSIONS>
for the list of common formatting variables available to all plugins.

=head1 AUTHOR

Torsten Raudssus <torsten@raudss.us> L<https://raudss.us/>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2010 by L<Raudssus Social Software|https://raudss.us/>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
