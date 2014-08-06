use strict;
use warnings;

# this test was generated with Dist::Zilla::Plugin::Test::NoTabs 0.08

use Test::More 0.88;
use Test::NoTabs;

my @files = (
    'lib/Dist/Zilla/Plugin/Run.pm',
    'lib/Dist/Zilla/Plugin/Run/AfterBuild.pm',
    'lib/Dist/Zilla/Plugin/Run/AfterMint.pm',
    'lib/Dist/Zilla/Plugin/Run/AfterRelease.pm',
    'lib/Dist/Zilla/Plugin/Run/BeforeBuild.pm',
    'lib/Dist/Zilla/Plugin/Run/BeforeRelease.pm',
    'lib/Dist/Zilla/Plugin/Run/Release.pm',
    'lib/Dist/Zilla/Plugin/Run/Role/Runner.pm',
    'lib/Dist/Zilla/Plugin/Run/Test.pm',
    't/00-load.t',
    't/00-report-prereqs.dd',
    't/00-report-prereqs.t',
    't/10_build_phase.t',
    't/20_formatter.t',
    't/30_all_phases.t',
    't/40_test_phase.t',
    't/50_mint.t',
    't/60_redacted_configs.t',
    'xt/author/00-compile.t',
    'xt/author/pod-spell.t',
    'xt/release/changes_has_content.t',
    'xt/release/clean-namespaces.t',
    'xt/release/cpan-changes.t',
    'xt/release/distmeta.t',
    'xt/release/eol.t',
    'xt/release/kwalitee.t',
    'xt/release/minimum-version.t',
    'xt/release/mojibake.t',
    'xt/release/no-tabs.t',
    'xt/release/pod-syntax.t',
    'xt/release/portability.t'
);

notabs_ok($_) foreach @files;
done_testing;
