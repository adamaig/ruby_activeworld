
spec = Gem::Specification.new do |s|
  s.name = %q{ruby_activeworld}
  s.version = "0.3"
  s.rubygems_version = "1.3.1"

  s.homepage = "http://github.com/adamaig/ruby_activeworld/tree/master"
  s.date = %q{2009-03-09}
  s.authors = ["Adam Ingram-Goble"]
  s.email = %q{adamaig@gmail.com}
  s.summary = %q{A ruby binding, and sugary methods for the Activeworlds SDK. See http://www.activeworlds.com}
  s.description = %q{A ruby binding, and sugary methods for the Activeworlds SDK. You must have the linux sdk 
    in your LD_LIBRARY_PATH to use this gem (libaw_sdk.41.so) See http://www.activeworlds.com}
  s.platform = "linux"

  s.extensions = ["ext/extconf.rb"]
  candidates = ["examples/configs.yml", "examples/sample_event_bot.rb", 
    "ext/ruby_activeworld.c",
    "utilities/aw_enums_and_constants.rb", "utilities/callback_generator.rb", 
    "utilities/ruby_activeworld_enums.rb", "utilities/t.txt"]
  candidates += Dir["lib/**/*"].entries
  s.files = ["README"] + candidates

  s.require_paths = ["ext","lib"]

  s.has_rdoc = true
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "RubyActiveworlds"]
  s.requirements = " You must have libaw_sdk.41.so in your LD_LIBRARY_PATH."
end


