
require 'rubygems'
require 'echoe'

Echoe.new('ruby_activeworld') do |s|
  s.name = %q{ruby_activeworld}
  s.author = "Adam Ingram-Goble"
  s.email = %q{adamaig@gmail.com}
  s.version = "0.1"
  s.summary = %q{A ruby binding, and sugary methods for the Activeworlds SDK. See http://www.activeworlds.com}
  s.description = %q{A ruby binding, and sugary methods for the Activeworlds SDK. You must have the linux sdk 
    in your LD_LIBRARY_PATH to use this gem (libaw_sdk.41.so) See http://www.activeworlds.com}
  s.install_message = s.description
  
  s.platform = "linux"
  candidates = Dir.glob("{docs,examples,ext,lib,tests,utilities}/**/*")
  s.files = ["README"] + candidates
  s.has_rdoc = false
  s.eval Proc.new {
    s.require_paths = ['ext','lib']
  }
  # s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "RubyActiveworlds", "--main", "README"]
end


