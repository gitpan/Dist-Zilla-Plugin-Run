use strict;
use warnings;

package Dist::Zilla::Plugin::Run;
BEGIN {
  $Dist::Zilla::Plugin::Run::AUTHORITY = 'cpan:GETTY';
}
# git description: 0.022-14-ge39fe5a
$Dist::Zilla::Plugin::Run::VERSION = '0.023';
# ABSTRACT: Run external commands at specific phases of Dist::Zilla

#pod =head1 SYNOPSIS
#pod
#pod   [Run::AfterBuild]
#pod   run = script/do_this.pl --dir %s --version %s
#pod   run = script/do_that.pl
#pod
#pod   [Run::BeforeBuild]
#pod   run = script/do_this.pl --version %s
#pod   run = script/do_that.pl
#pod
#pod   [Run::BeforeRelease]
#pod   run = script/myapp_before1.pl %s
#pod   run = script/myapp_before2.pl %n %v
#pod   run_no_trial = script/no_execution_on_trial.pl %n %v
#pod
#pod   [Run::Release]
#pod   run = script/myapp_deploy1.pl %s
#pod   run = deployer.pl --dir %d --tgz %a --name %n --version %v
#pod   run_no_trial = script/no_execution_on_trial.pl --dir %d --tgz %a --name %n --version %v
#pod
#pod   [Run::AfterRelease]
#pod   run = script/myapp_after.pl --archive %s --version %s
#pod   ; %p can be used as the path separator if you have contributors on a different OS
#pod   run = script%pmyapp_after.pl --archive %s --version %s
#pod
#pod   [Run::AfterRelease / MyAppAfter]
#pod   run = script/myapp_after.pl --archive %s --version %s
#pod
#pod   [Run::Test]
#pod   run = script/tester.pl --name %n --version %v some_file.ext
#pod   run_if_release = ./Build install
#pod   run_if_release = make install
#pod
#pod   [Run::AfterMint]
#pod   run = some command %d
#pod
#pod =head1 DESCRIPTION
#pod
#pod Run arbitrary commands at various L<Dist::Zilla> phases.
#pod
#pod =head1 PARAMETERS
#pod
#pod =head2 run
#pod
#pod Run the specific command at the specific Dist::Zilla phase given by the
#pod plugin, like I<[Run::Release]> runs on release phase.
#pod
#pod =head2 run_no_trial
#pod
#pod Only run the given command if this isn't a I<trial> build or release.
#pod
#pod =head2 run_if_trial
#pod
#pod Only run the given command if this is a I<trial> build or release.
#pod
#pod =head2 run_if_release
#pod
#pod Only run the given command if this is a release.
#pod
#pod =head2 run_no_release
#pod
#pod Only run a given command if this isn't a release.
#pod
#pod =head2 censor_commands
#pod
#pod Normally, C<run*> commands are included in distribution metadata when used
#pod with the L<[MetaConfig]|Dist::Zilla::Plugin::MetaConfig> plugin. To bypass
#pod this, set C<censor_commands = 1>.  Additionally, this command is set to true
#pod automatically when a URL with embedded password is present.
#pod
#pod Defaults to false.
#pod
#pod =head1 CONVERSIONS
#pod
#pod The following conversions/format specifiers are defined
#pod for passing as arguments to the specified commands
#pod (though not all values are available at all phases).
#pod
#pod =for :list
#pod * C<%a> the archive of the release (available to all C<*Release> phases)
#pod * C<%d> the directory in which the dist was built (or minted) (not in C<BeforeBuild>)
#pod * C<%n> the dist name
#pod * C<%p> path separator ('/' on Unix, '\\' on Win32... useful for cross-platform dist.ini files)
#pod * C<%v> the dist version
#pod * C<%x> full path to the current perl interpreter (like $^X but from L<Config>)
#pod
#pod Additionally C<%s> is retained for backward compatibility.
#pod Each occurrence is replaced by a different value
#pod (like the regular C<sprintf> function).
#pod Individual plugins define their own values for the positional replacement of C<%s>.
#pod
#pod =cut

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Dist::Zilla::Plugin::Run - Run external commands at specific phases of Dist::Zilla

=head1 VERSION

version 0.023

=head1 SYNOPSIS

  [Run::AfterBuild]
  run = script/do_this.pl --dir %s --version %s
  run = script/do_that.pl

  [Run::BeforeBuild]
  run = script/do_this.pl --version %s
  run = script/do_that.pl

  [Run::BeforeRelease]
  run = script/myapp_before1.pl %s
  run = script/myapp_before2.pl %n %v
  run_no_trial = script/no_execution_on_trial.pl %n %v

  [Run::Release]
  run = script/myapp_deploy1.pl %s
  run = deployer.pl --dir %d --tgz %a --name %n --version %v
  run_no_trial = script/no_execution_on_trial.pl --dir %d --tgz %a --name %n --version %v

  [Run::AfterRelease]
  run = script/myapp_after.pl --archive %s --version %s
  ; %p can be used as the path separator if you have contributors on a different OS
  run = script%pmyapp_after.pl --archive %s --version %s

  [Run::AfterRelease / MyAppAfter]
  run = script/myapp_after.pl --archive %s --version %s

  [Run::Test]
  run = script/tester.pl --name %n --version %v some_file.ext
  run_if_release = ./Build install
  run_if_release = make install

  [Run::AfterMint]
  run = some command %d

=head1 DESCRIPTION

Run arbitrary commands at various L<Dist::Zilla> phases.

=head1 PARAMETERS

=head2 run

Run the specific command at the specific Dist::Zilla phase given by the
plugin, like I<[Run::Release]> runs on release phase.

=head2 run_no_trial

Only run the given command if this isn't a I<trial> build or release.

=head2 run_if_trial

Only run the given command if this is a I<trial> build or release.

=head2 run_if_release

Only run the given command if this is a release.

=head2 run_no_release

Only run a given command if this isn't a release.

=head2 censor_commands

Normally, C<run*> commands are included in distribution metadata when used
with the L<[MetaConfig]|Dist::Zilla::Plugin::MetaConfig> plugin. To bypass
this, set C<censor_commands = 1>.  Additionally, this command is set to true
automatically when a URL with embedded password is present.

Defaults to false.

=head1 CONVERSIONS

The following conversions/format specifiers are defined
for passing as arguments to the specified commands
(though not all values are available at all phases).

=over 4

=item *

C<%a> the archive of the release (available to all C<*Release> phases)

=item *

C<%d> the directory in which the dist was built (or minted) (not in C<BeforeBuild>)

=item *

C<%n> the dist name

=item *

C<%p> path separator ('/' on Unix, '\\' on Win32... useful for cross-platform dist.ini files)

=item *

C<%v> the dist version

=item *

C<%x> full path to the current perl interpreter (like $^X but from L<Config>)

=back

Additionally C<%s> is retained for backward compatibility.
Each occurrence is replaced by a different value
(like the regular C<sprintf> function).
Individual plugins define their own values for the positional replacement of C<%s>.

=head1 AUTHOR

Torsten Raudssus <torsten@raudss.us> L<https://raudss.us/>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2010 by L<Raudssus Social Software|https://raudss.us/>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=head1 CONTRIBUTORS

=for stopwords Al Newkirk Karen Etheridge Nickolay Platonov Olivier Mengué Randy Stauner Tatsuhiko Miyagawa Torsten Raudssus

=over 4

=item *

Al Newkirk <github@alnewkirk.com>

=item *

Karen Etheridge <ether@cpan.org>

=item *

Nickolay Platonov <nplatonov@cpan.org>

=item *

Olivier Mengué <dolmen@cpan.org>

=item *

Randy Stauner <rwstauner@cpan.org>

=item *

Tatsuhiko Miyagawa <miyagawa@cpan.org>

=item *

Torsten Raudssus <getty@cpan.org>

=back

=cut
