require 'rubygems'

spec = Gem::Specification.new do |s|
  s.name = %q{ruby_activeworld}
  s.version = "0.1"
  s.bindir = nil
  s.cert_chain = nil
  s.date = %q{2009-03-09}
  s.authors = ["Adam Ingram-Goble"]
  s.email = %q{adamaig@gmail.com}
  s.extensions = ["ext/extconf.rb"]
  s.summary = %q{A ruby binding, and sugary methods for the Activeworlds SDK. See http://www.activeworlds.com}
  s.description = %q{A ruby binding, and sugary methods for the Activeworlds SDK. You must have the linux sdk 
    in your LD_LIBRARY_PATH to use this gem (libaw_sdk.41.so) See http://www.activeworlds.com}
  s.platform = "linux"
  candidates = Dir.glob("{docs,examples,ext,lib,tests,utilities}/**/*")
  s.files = ["README"] + candidates
  s.require_paths = ["ext","lib"]
  s.has_rdoc = false
  # s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "RubyActiveworlds", "--main", "README"]
end

if $0 == __FILE__
  Gem::Builder.new(spec).build
end

