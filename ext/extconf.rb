require 'mkmf'

dir_config("awsdk")

$CFLAGS << "-x c++"
$LDFLAGS << "-Wl,-rpath,. -law_sdk.41 -lstdc++"

create_makefile("ruby_activeworld")
