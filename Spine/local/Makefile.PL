use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    'NAME'		=> 'Spine',
    'VERSION_FROM'	=> 'lib/SPINE/Constant.pm', # finds $VERSION
    'PREREQ_PM'		=> {}, # e.g., Module::Name => 1.2
    ($] >= 5.005 ?    ## Add these new keywords supported since 5.005
      (AUTHOR     => 'Hendrik Van Belleghem <beatnik@users.sourceforge.org>') : ()),
);
