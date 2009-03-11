require 'ruby_activeworld'
require 'ruby_aw_support'

class RubyAw < RubyActiveworld
  include RubyActiveworldSupport
  
  @@attrs_available_to = {}
  
  def initialize(host, port, global_bot=false)
    @@init_run ||= false
    if ! @@init_run
      @@init_run = true
      self.class.ruby_aw_init(AW_BUILD)
    end
    super(host, port)
    ruby_aw_bool_set(AW_ENTER_GLOBAL, global_bot);
  end  

  def login(name, owner_id, privilege_pass, application="")
    ruby_aw_string_set(AW_LOGIN_NAME, name);
    ruby_aw_string_set(AW_LOGIN_PRIVILEGE_PASSWORD, privilege_pass);
    ruby_aw_int_set(AW_LOGIN_OWNER, owner_id);
    ruby_aw_string_set(AW_LOGIN_APPLICATION, application) if ! application.empty?
    ruby_aw_login
  end
  
  def enter(worldname)
    rc_sym ruby_aw_enter(worldname)
  end
  
  # This "registers" the bot as being interested in the named event
  def receive(callback) 
    send("receive_#{callback.to_s.downcase}") 
  end

  def attributes_for(callback)
    params = {}
    unless @@attrs_available_to[callback].nil?
      @@attrs_available_to[callback].each do |aw_attr|
        params[aw_attr] = aw_attribute_to_ruby(aw_attr)
      end
    end
    params
  end
  
  def aw_attribute_to_ruby(attribute)
    eval "ruby_aw_#{get_aw_attribute_type(attribute)}(#{attribute})"
  end
  
  def get_aw_attribute_type(attribute)
    ATTRIBUTE_TYPE_MAP[attribute.to_sym]
  end
  
  # nil arguments mean that the corresponding attribute isn't set/changed
  def state_change(x=nil,y=nil,z=nil,yaw=nil,type=nil,gesture=nil,
    pitch=nil,state=nil)
    ruby_aw_int_set(AW_MY_X, x) unless x.nil?
    ruby_aw_int_set(AW_MY_Y, y) unless y.nil?
    ruby_aw_int_set(AW_MY_Z, z) unless z.nil?
    ruby_aw_int_set(AW_MY_YAW, yaw) unless yaw.nil?
    ruby_aw_int_set(AW_MY_TYPE, type) unless type.nil?
    ruby_aw_int_set(AW_MY_GESTURE, gesture) unless gesture.nil?
    ruby_aw_int_set(AW_MY_PITCH, pitch) unless pitch.nil?
    ruby_aw_int_set(AW_MY_STATE, state) unless state.nil?
    ruby_aw_state_change
  end
  
  # Wraps aw_console_message. Options are :red, :blue, :green, :bold, :italics
  def console_message(session_id, message, options={})
    ruby_aw_int_set(AW_CONSOLE_RED, options[:red] || 0)
    ruby_aw_int_set(AW_CONSOLE_BLUE, options[:blue] || 0)
    ruby_aw_int_set(AW_CONSOLE_GREEN, options[:green] || 0)
    ruby_aw_bool_set(AW_CONSOLE_BOLD, options[:bold] || false)
    ruby_aw_bool_set(AW_CONSOLE_ITALICS, options[:italics] || false)
    ruby_aw_string_set(AW_CONSOLE_MESSAGE, message)
    ruby_aw_console_message(session_id)
  end
  
  # Wraps aw_teleport. Options are :world, :x, :y, :z, :yaw, :warp
  def teleport(session_id, options={}) 
    ruby_aw_string_set(AW_TELEPORT_WORLD, options[:world] || "")
    ruby_aw_int_set(AW_TELEPORT_X, options[:x] || 0)
    ruby_aw_int_set(AW_TELEPORT_Y, options[:y] || 0)
    ruby_aw_int_set(AW_TELEPORT_Z, options[:z] || 0)
    ruby_aw_int_set(AW_TELEPORT_YAW, options[:yaw] || 0)
    ruby_aw_bool_set(AW_TELEPORT_WARP, options[:warp] || false)
    ruby_aw_teleport(session_id)
  end
  
  def world_object_change(object_update)
    ruby_aw_int_set(AW_OBJECT_ID, object_update[:id] || 0)
    ruby_aw_int_set(AW_OBJECT_TYPE, object_update[:type] || ruby_aw_int(AW_OBJECT_TYPE))
    ruby_aw_string_set(AW_OBJECT_DESCRIPTION, object_update[:description] || ruby_aw_string(AW_OBJECT_DESCRIPTION))
    ruby_aw_string_set(AW_OBJECT_ACTION, object_update[:action] || ruby_aw_string(AW_OBJECT_ACTION))
    ruby_aw_string_set(AW_OBJECT_MODEL, object_update[:model] || ruby_aw_string(AW_OBJECT_MODEL))
    ruby_aw_int_set(AW_OBJECT_OLD_NUMBER, 0)
    ruby_aw_int_set(AW_OBJECT_OLD_X, 0)
    ruby_aw_int_set(AW_OBJECT_OLD_Z, 0)
    ruby_aw_int_set(AW_OBJECT_X, object_update[:x] || ruby_aw_int(AW_OBJECT_X))
    ruby_aw_int_set(AW_OBJECT_Y, object_update[:y] || ruby_aw_int(AW_OBJECT_Y))
    ruby_aw_int_set(AW_OBJECT_Z, object_update[:z] || ruby_aw_int(AW_OBJECT_Z))
    ruby_aw_int_set(AW_OBJECT_YAW, object_update[:yaw] || ruby_aw_int(AW_OBJECT_YAW))
    ruby_aw_int_set(AW_OBJECT_TILT, object_update[:tilt] || ruby_aw_int(AW_OBJECT_TILT))
    ruby_aw_int_set(AW_OBJECT_ROLL, object_update[:roll] || ruby_aw_int(AW_OBJECT_ROLL))
    ruby_aw_int_set(AW_OBJECT_OWNER, object_update[:owner] || ruby_aw_int(AW_OBJECT_OWNER))
    ruby_aw_object_change
  end
  
  def url_send(session, url, target_window=nil)
    ruby_aw_url_send(session, url, target_window)
  end
  
  def add_world_ejection(citizen_id, session, expiration=0, comment="Account disabled")
    ruby_aw_int_set AW_EJECTION_TYPE, AW_EJECT_BY_CITIZEN
    ruby_aw_int_set(AW_EJECTION_ADDRESS, citizen_id)
    ruby_aw_int_set(AW_EJECTION_EXPIRATION_TIME, expiration.to_i)
    ruby_aw_string_set(AW_EJECTION_COMMENT, comment)
    ruby_aw_world_ejection_add
    world_eject session
  end

  # eject session for 1 second to force out of world
  def world_eject(session,time=1)
    ruby_aw_int_set AW_EJECT_SESSION, session
    ruby_aw_int_set AW_EJECT_DURATION, time
    ruby_aw_world_eject
  end
end
