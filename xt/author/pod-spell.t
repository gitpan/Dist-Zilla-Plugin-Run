use strict;
use warnings;
use Test::More;

# generated by Dist::Zilla::Plugin::Test::PodSpelling 2.006008
use Test::Spelling 0.12;
use Pod::Wordlist;


add_stopwords(<DATA>);
all_pod_files_spelling_ok( qw( bin lib  ) );
__DATA__
Torsten
Raudssus
torsten
https
Social
Software
Al
Newkirk
github
Karen
Etheridge
ether
Nickolay
Platonov
nplatonov
Olivier
Mengué
dolmen
Randy
Stauner
rwstauner
Tatsuhiko
Miyagawa
miyagawa
getty
lib
Dist
Zilla
Plugin
Run
AfterBuild
BeforeRelease
AfterMint
Role
Runner
AfterRelease
Test
BeforeBuild
Release
