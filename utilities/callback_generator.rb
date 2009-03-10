s = "AW_EVENT_ADMIN_WORLD_DELETE
    AW_EVENT_ADMIN_WORLD_INFO
    AW_EVENT_AVATAR_ADD
    AW_EVENT_AVATAR_CHANGE
    AW_EVENT_AVATAR_CLICK
    AW_EVENT_AVATAR_DELETE
    AW_EVENT_AVATAR_RELOAD
    AW_EVENT_BOTGRAM
    AW_EVENT_BOTMENU
    AW_EVENT_CAMERA
    AW_EVENT_CELL_BEGIN
    AW_EVENT_CELL_END
    AW_EVENT_CELL_OBJECT
    AW_EVENT_CHAT
    AW_EVENT_CONSOLE_MESSAGE
    AW_EVENT_CONTACT_STATE
    AW_EVENT_ENTITY_ADD
    AW_EVENT_ENTITY_CHANGE
    AW_EVENT_ENTITY_DELETE
    AW_EVENT_ENTITY_LINKS
    AW_EVENT_ENTITY_RIDER_ADD
    AW_EVENT_ENTITY_RIDER_CHANGE
    AW_EVENT_ENTITY_RIDER_DELETE
    AW_EVENT_HUD_CLEAR
    AW_EVENT_HUD_CLICK
    AW_EVENT_HUD_CREATE
    AW_EVENT_HUD_DESTROY
    AW_EVENT_JOIN
    AW_EVENT_NOISE
    AW_EVENT_OBJECT_ADD
    AW_EVENT_OBJECT_BUMP
    AW_EVENT_OBJECT_CLICK
    AW_EVENT_OBJECT_DELETE
    AW_EVENT_OBJECT_SELECT
    AW_EVENT_SEND_FILE
    AW_EVENT_TELEGRAM
    AW_EVENT_TELEPORT
    AW_EVENT_TERRAIN_BEGIN
    AW_EVENT_TERRAIN_CHANGED
    AW_EVENT_TERRAIN_DATA
    AW_EVENT_TERRAIN_END
    AW_EVENT_TOOLBAR_CLICK
    AW_EVENT_UNIVERSE_ATTRIBUTES
    AW_EVENT_UNIVERSE_DISCONNECT
    AW_EVENT_URL
    AW_EVENT_URL_CLICK
    AW_EVENT_USER_INFO
    AW_EVENT_VOIP_DATA
    AW_EVENT_WORLD_ATTRIBUTES
    AW_EVENT_WORLD_DISCONNECT
    AW_EVENT_WORLD_INFO
    AW_CALLBACK_ADDRESS
    AW_CALLBACK_ADMIN
    AW_CALLBACK_ADMIN_WORLD_LIST
    AW_CALLBACK_ADMIN_WORLD_RESULT
    AW_CALLBACK_ATTRIBUTES_RESET_RESULT
    AW_CALLBACK_AVATAR_LOCATION
    AW_CALLBACK_BOTGRAM_RESULT
    AW_CALLBACK_BOTMENU_RESULT
    AW_CALLBACK_CAV
    AW_CALLBACK_CAV_RESULT
    AW_CALLBACK_CAV_TEMPLATE
    AW_CALLBACK_CAV_TEMPLATE_RESULT
    AW_CALLBACK_CELL_RESULT
    AW_CALLBACK_CITIZEN_ATTRIBUTES
    AW_CALLBACK_CITIZEN_RESULT
    AW_CALLBACK_CONTACT_ADD
    AW_CALLBACK_CREATE
    AW_CALLBACK_DELETE_ALL_OBJECTS_RESULT
    AW_CALLBACK_ENTER
    AW_CALLBACK_HUD_RESULT
    AW_CALLBACK_IMMIGRATE
    AW_CALLBACK_JOIN
    AW_CALLBACK_LICENSE_ATTRIBUTES
    AW_CALLBACK_LICENSE_RESULT
    AW_CALLBACK_LOGIN
    AW_CALLBACK_OBJECT_RESULT
    AW_CALLBACK_PASSWORD_SEND
    AW_CALLBACK_QUERY
    AW_CALLBACK_REGISTER
    AW_CALLBACK_RELOAD_REGISTRY
    AW_CALLBACK_SEND_FILE
    AW_CALLBACK_TELEGRAM_RESULT
    AW_CALLBACK_TERRAIN_DELETE_ALL_RESULT
    AW_CALLBACK_TERRAIN_LOAD_NODE_RESULT
    AW_CALLBACK_TERRAIN_NEXT_RESULT
    AW_CALLBACK_TERRAIN_SET_RESULT
    AW_CALLBACK_UNIVERSE_EJECTION
    AW_CALLBACK_UNIVERSE_EJECTION_RESULT
    AW_CALLBACK_USER_LIST
    AW_CALLBACK_WORLD_EJECTION
    AW_CALLBACK_WORLD_EJECTION_RESULT
    AW_CALLBACK_WORLD_INSTANCE
    AW_CALLBACK_WORLD_LIST"

meth ="  
  VALUE %s(VALUE self%s) {
    return Qnil;
  }
  void %s_hook(%s) {
    rb_funcall(ruby_aw_instance(), rb_intern(\"%s\"), %s);
  }
  static VALUE receive_%s(VALUE self) {
    return INT2NUM(aw_instance_%s_set(%s,%s_hook));
  }
"
def_str = "  rb_define_method(cRubyActiveworld, \"%s\",(VALUE(*)(ANYARGS))%s,%d);\n" +
"  rb_define_method(cRubyActiveworld, \"receive_%s\",(VALUE(*)(ANYARGS))receive_%s,%d);"

methods = []
defs = []

s.split.each do |name|
  lname = name.to_s.downcase
  ruby_set_method_name = "receive_#{lname}"
  event = name =~ /event/i ? true : false
  ruby_callback_method_name = "#{lname.sub(/(aw_callback|aw_event)_/i,"")}#{"_event" if event}_callback"
  methods.push( meth % [ruby_callback_method_name, event ? "" : ", VALUE rc",
    ruby_callback_method_name, event ? "" : "int rc", ruby_callback_method_name, event ? "0" : "1, INT2FIX(rc)",
    name.downcase,event ? "event" : "callback", name,ruby_callback_method_name] )
  defs.push( def_str % [ruby_callback_method_name, ruby_callback_method_name, event ? 0 : 1,
                        lname, lname, event ? 0 : 1])
end

puts methods.join("\n")
puts defs.join("\n")