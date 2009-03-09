require 'mkmf'
$CFLAGS << "-x c++ -I."
$LDFLAGS << " -L. -Wl,-rpath,. -law_sdk.41 -lstdc++"
create_makefile("ruby_activeworld")
