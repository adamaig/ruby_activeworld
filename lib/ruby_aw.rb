require 'ruby_activeworld'
require 'ruby_activeworld_support'

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
    @@attrs_available_to[callback].each do |aw_attr|
      params[aw_attr] = aw_attribute_to_ruby(aw_attr)
    end
    params
  end
  
  def aw_attribute_to_ruby(attribute)
    eval "ruby_aw_#{get_aw_attribute_type(attribute)}(#{attribute})"
  end
  
  def get_aw_attribute_type(attribute)
    ATTRIBUTE_TYPE_MAP[attribute.to_sym]
  end
  
  def self.attributes_available_to(callback, *attributes)
    @@attrs_available_to[callback] = attributes
  end
  
  attributes_available_to :AW_EVENT_AVATAR_ADD, :AW_AVATAR_SESSION, :AW_AVATAR_NAME,
      :AW_AVATAR_X, :AW_AVATAR_Y, :AW_AVATAR_Z, :AW_AVATAR_YAW, :AW_AVATAR_TYPE, :AW_AVATAR_GESTURE, :AW_AVATAR_VERSION,
      :AW_AVATAR_CITIZEN, :AW_AVATAR_PRIVILEGE, :AW_AVATAR_PITCH, :AW_AVATAR_STATE, :AW_PLUGIN_STRING

  attributes_available_to :AW_EVENT_AVATAR_DELETE, :AW_AVATAR_SESSION, :AW_AVATAR_NAME,
      :AW_AVATAR_X, :AW_AVATAR_Y, :AW_AVATAR_Z, :AW_AVATAR_YAW, :AW_AVATAR_TYPE, :AW_AVATAR_GESTURE, :AW_AVATAR_VERSION,
      :AW_AVATAR_CITIZEN, :AW_AVATAR_PRIVILEGE, :AW_AVATAR_PITCH, :AW_AVATAR_STATE, :AW_PLUGIN_STRING

  attributes_available_to :AW_EVENT_CHAT, :AW_AVATAR_NAME, :AW_CHAT_SESSION, :AW_CHAT_TYPE, :AW_CHAT_MESSAGE
  attributes_available_to :AW_EVENT_AVATAR_CLICK, :AW_AVATAR_NAME, :AW_AVATAR_SESSION, :AW_CLICKED_NAME, :AW_CLICKED_SESSION

  attributes_available_to :AW_EVENT_USER_INFO, :AW_USERLIST_ID, :AW_USERLIST_NAME, :AW_USERLIST_WORLD, 
      :AW_USERLIST_CITIZEN, :AW_USERLIST_STATE

  attributes_available_to :AW_EVENT_OBJECT_ADD, :AW_OBJECT_SESSION, :AW_CELL_SEQUENCE, 
      :AW_CELL_X, :AW_CELL_Z, :AW_OBJECT_TYPE, :AW_OBJECT_ID, :AW_OBJECT_NUMBER, :AW_OBJECT_OWNER, 
      :AW_OBJECT_BUILD_TIMESTAMP, :AW_OBJECT_X, :AW_OBJECT_Y, :AW_OBJECT_Z, :AW_OBJECT_YAW, :AW_OBJECT_TILT, 
      :AW_OBJECT_ROLL, :AW_OBJECT_MODEL, :AW_OBJECT_DESCRIPTION, :AW_OBJECT_ACTION, :AW_OBJECT_DATA

  attributes_available_to :AW_EVENT_OBJECT_DELETE, :AW_OBJECT_SESSION, :AW_CELL_SEQUENCE, 
      :AW_CELL_X, :AW_CELL_Z, :AW_OBJECT_ID, :AW_OBJECT_NUMBER

  attributes_available_to :AW_EVENT_URL, :AW_AVATAR_SESSION, :AW_AVATAR_NAME, :AW_URL_NAME, :AW_URL_POST,
      :AW_URL_TARGET, :AW_URL_TARGET_3D

  attributes_available_to :AW_EVENT_UNIVERSE_DISCONNECT, :AW_DISCONNECT_REASON  
  attributes_available_to :AW_EVENT_WORLD_DISCONNECT, :AW_DISCONNECT_REASON

end
