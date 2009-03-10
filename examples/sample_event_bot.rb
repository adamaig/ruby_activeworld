$:.unshift "#{File.dirname(__FILE__)}/../lib"
require 'yaml'
require 'ruby_aw.rb'

$configs = YAML.load_file("configs.yml")[:simple_event_config]

class SampleEventBot < RubyAw
  
  def avatar_add_event_callback
    attrs = attributes_for(:AW_EVENT_AVATAR_ADD)
    puts "** Avatar added: parameters are #{attrs.inspect}"
  end
  
  def self.bot_for_world(worldname)
    bot = SampleEventBot.new($configs[:universe_server], $configs[:universe_port], $configs[:enter_global])
    bot.login($configs[:app_name], $configs[:citizen_id], $configs[:password])
    bot.enter(worldname)
    bot.receive :AW_EVENT_AVATAR_ADD
    bot
  end
end

bot = SampleEventBot.bot_for_world($configs[:worldname])

3.times do
  while 0 == SampleEventBot.ruby_aw_wait(2000)
    puts "Taking a break"
  end
end
