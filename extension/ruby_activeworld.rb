
require 'rubygems'
require 'inline'
require 'ruby_activeworld_support'

class RubyAwInlineC < Inline::C

  def aw_attribute_to_ruby(attribute)
    attr_type = get_aw_attribute_type(attribute)
    "ruby_aw_#{attr_type}(active_instance,INT2FIX(#{attribute}))"
  end

  def get_aw_attribute_type(attribute)
    RubyActiveworld::ATTRIBUTE_TYPE_MAP[attribute.to_sym]
  end

  def generate_event_callback(event,*attributes)
    event_name = event.to_s.downcase
    ruby_set_method_name = "receive_#{event_name}"
    ruby_callback_method_name = "#{event_name.sub(/aw_event_/i,"")}_event"
    c_callback_method_name = "ruby_#{event_name}_event"

    c_raw %{static VALUE #{ruby_callback_method_name}(VALUE self, VALUE attributes) { return Qnil; } }
    prefix %{ void #{c_callback_method_name}() {
        VALUE h = rb_hash_new();
        VALUE active_instance = ruby_aw_instance();
        #{
        attributes.collect do |attribute|
          attr_name = attribute.to_s.downcase
          %{ rb_hash_aset(h, rb_str_new2("#{attr_name}"), #{aw_attribute_to_ruby(attribute)}); }
        end.join("\n")
        }
        rb_funcall(active_instance, rb_intern("#{ruby_callback_method_name}"), 1, h);
      }
    }
    c_raw %{ static VALUE #{ruby_set_method_name}(VALUE self) { return INT2NUM(aw_instance_event_set(#{event},#{c_callback_method_name})); }}
  end

  def generate_callback(name,*attributes,event=false)
    name = name.to_s.downcase
    ruby_set_method_name = "receive_#{name}"
    ruby_callback_method_name = "#{name.sub(/aw_callback|aw_event/i,"")}#{"_event" if event}_callback"
    c_callback_method_name = "ruby_#{name}#{"_event" if event}_callback"

    c_raw %{static VALUE #{ruby_callback_method_name}(VALUE self, VALUE attributes) { return Qnil; } }
    prefix %{ void #{c_callback_method_name}() {
        VALUE h = rb_hash_new();
        VALUE active_instance = ruby_aw_instance();
        #{
        attributes.collect do |attribute|
          attr_name = attribute.to_s.downcase
          %{ rb_hash_aset(h, rb_str_new2("#{attr_name}"), #{aw_attribute_to_ruby(attribute)}); }
        end.join("\n")
        }
        rb_funcall(active_instance, rb_intern("#{ruby_callback_method_name}"), 1, h);
      }
    }
    c_raw %{ static VALUE #{ruby_set_method_name}(VALUE self) { return INT2NUM(aw_instance_callback_set(#{name},#{c_callback_method_name})); }}

  end
end

class RubyActiveworld
  attr_reader :info

  inline(:RubyAwInlineC) do |builder|
    builder.alias_type_converter('char *', 'string')
    ['"Aw.h"', '<iostream>'].each {|h| builder.include h}
    builder.add_compile_flags('-x c++', '-Wl,-rpath,. -L. -I. -law_sdk.41', '-lstdc++')

    # making this ruby-ish
    builder.prefix %q{ typedef struct { void* c_self; VALUE ruby_self; } RUBY_AW_APPLICATION; }
    # this makes sure the c bot's reference to itself isn't gc'd
    builder.prefix %q{ void ruby_aw_bot_mark(void* p) { rb_gc_mark(((RUBY_AW_APPLICATION*) p)->ruby_self); } }
    builder.c_raw %q{ static VALUE ruby_aw_allocate(VALUE klass) {
      RUBY_AW_APPLICATION* ruby_aw_bot = 0;
      return Data_Make_Struct(klass, RUBY_AW_APPLICATION, ruby_aw_bot_mark, free, ruby_aw_bot);
    }}
    builder.add_to_init %q{ rb_define_alloc_func(c, ruby_aw_allocate); }

    # AWSDK translation/wrapping
    builder.c_singleton %q{ int init_ruby_aw_sdk() { return aw_init(AW_BUILD); } }

    # not implementing aw_init_bind
    builder.c %q{ VALUE ruby_aw_term() { aw_term(); return Qnil; }}
    builder.c %q{ VALUE ruby_aw_create(char * host, int port) { 
      int rc = 0; 
      RUBY_AW_APPLICATION* ruby_aw_bot = 0;
      Data_Get_Struct(self, RUBY_AW_APPLICATION, ruby_aw_bot);
      rc = aw_create(host,port,&(ruby_aw_bot->c_self));
      ruby_aw_bot->ruby_self = self;
      aw_user_data_set(ruby_aw_bot);
      return INT2NUM(rc);
    } }

    # not implementing aw_create_resolved
    builder.c %q{ VALUE ruby_aw_destroy() { return INT2FIX(aw_destroy()); }}
    builder.prefix %q{ VALUE ruby_aw_instance() { return ((RUBY_AW_APPLICATION*) aw_user_data())->ruby_self;} }
    builder.c %q{ int ruby_aw_instance_set() { 
      RUBY_AW_APPLICATION* bot = 0;
      Data_Get_Struct(self, RUBY_AW_APPLICATION, bot);
      return aw_instance_set(bot->c_self);
    } } 
    builder.c %{ int ruby_aw_login(static char * login_name, static char * login_password, int owner_id) {
          aw_string_set(AW_LOGIN_NAME, login_name);
          aw_string_set(AW_LOGIN_PRIVILEGE_PASSWORD, login_password);
          aw_int_set(AW_LOGIN_OWNER, owner_id);
          return aw_login();
    } }
    builder.c_singleton %q{ int ruby_aw_wait(int milliseconds) {return aw_wait(milliseconds); } }

    # AW get/set methods
    builder.c_raw %q{ VALUE ruby_aw_bool(VALUE self, VALUE attr) { return aw_bool((AW_ATTRIBUTE) FIX2INT(attr)) == 0 ? Qfalse : Qtrue; }}
    builder.add_to_init %q{rb_define_method(c, "ruby_aw_bool", (VALUE(*)(ANYARGS))ruby_aw_bool, 1); }
    builder.c %q{ VALUE ruby_aw_bool_set(int attr, VALUE tf) { return INT2FIX(aw_bool_set((AW_ATTRIBUTE) attr, tf == Qtrue ? 1 : 0)); } }

    builder.c_raw %q{ VALUE ruby_aw_int(VALUE self, VALUE _attr) { 
      int attr = NUM2INT(_attr);
      return INT2NUM(aw_int((AW_ATTRIBUTE) attr)); }}
    builder.add_to_init %q{rb_define_method(c, "ruby_aw_int", (VALUE(*)(ANYARGS))ruby_aw_int, 1); }

    builder.c_raw %q{ VALUE ruby_aw_int_set(VALUE self, VALUE _attr, VALUE _val) {
      int attr = NUM2INT(_attr);
      int val = NUM2INT(_val);
      return INT2NUM(aw_int_set((AW_ATTRIBUTE) attr, val)); } }
    builder.add_to_init %q{rb_define_method(c, "ruby_aw_int_set", (VALUE(*)(ANYARGS))ruby_aw_int_set, 2); }

    builder.c %q{ VALUE ruby_aw_float(int attr) { return rb_float_new(aw_float((AW_ATTRIBUTE) attr)); }}
    builder.c %q{ VALUE ruby_aw_float_set(int attr, double val) { return INT2FIX(aw_float_set((AW_ATTRIBUTE) attr, val)); } }
    
    builder.c %q{ VALUE ruby_aw_string(int attr) { return rb_str_new2(aw_string((AW_ATTRIBUTE) attr)); }}
    builder.c %q{ VALUE ruby_aw_string_set(int attr, char * val) { return INT2FIX(aw_string_set((AW_ATTRIBUTE) attr, val));} }

    ### TODO: ADD aw_data functions
    # end get/set methods

    builder.c_raw %q{ VALUE ruby_aw_data(VALUE self, VALUE a) { 
      unsigned int length = 0; 
      char* d;  
      d = aw_data((AW_ATTRIBUTE) FIX2INT(a), &length); 
      VALUE h = rb_hash_new();
      rb_hash_aset(h, rb_str_new2("data"), rb_str_new2(d)); 
      rb_hash_aset(h, rb_str_new2("length"), INT2FIX(length)); 
      return h;
    } }
    builder.add_to_init %q{rb_define_method(c, "ruby_aw_data", (VALUE(*)(ANYARGS))ruby_aw_data, 1); }   

    builder.c_raw %q{ VALUE ruby_aw_data_set(VALUE self, VALUE a, VALUE data, VALUE length) {
      return INT2FIX(aw_data_set((AW_ATTRIBUTE) FIX2INT(a), StringValuePtr(data), FIX2UINT(length)));
    } }
    builder.add_to_init %q{rb_define_method(c, "ruby_aw_data_set", (VALUE(*)(ANYARGS))ruby_aw_data, 3); }    

    # callbacks are set in a specific way due to the pointer issues.
    # both regular callbacks and event callbacks must be handled specially
    # using the generate methods of the builder from above. Only setting instance
    # callbacks is supported.

    builder.c %q{ int ruby_aw_enter(static char * world_name) { return aw_enter(world_name); } }
    builder.c %q{ VALUE ruby_aw_exit() { return INT2FIX(aw_exit()); }}

    builder.c %q{ VALUE ruby_aw_user_list() { return INT2FIX(aw_user_list()); }}
    builder.c %q{ VALUE ruby_aw_state_change() { return INT2FIX(aw_state_change()); } }
    builder.c %q{ int ruby_aw_avatar_reload( int citizen, int session) { return aw_avatar_reload(citizen, session); } }

    # chat functions
    builder.c %q{ int ruby_aw_say(char * message) { return aw_say( message ); } }
    builder.c %q{ int ruby_aw_whisper(int session, char * message) { return aw_whisper( session, message ); } }
    builder.c %q{ int ruby_aw_console_message(int session_id){return aw_console_message( session_id );}}   
    builder.c %q{ int ruby_aw_url_send(int session_id, char * url, VALUE target) { 
      return aw_url_send( session_id, url, NIL_P(target) ?  0 : StringValuePtr(target)); 
    }}
    builder.c %q{ int ruby_aw_teleport(int session_id) { return aw_teleport(session_id);}}

    builder.c %q{ int ruby_aw_citizen_attributes_by_name(char * name) { return aw_citizen_attributes_by_name ( name );  }}
    builder.c %q{ int ruby_aw_citizen_attributes_by_number(int citizen) { return aw_citizen_attributes_by_number ( citizen );  }}

    builder.c %q{ int ruby_aw_citizen_add(){ return aw_citizen_add() ; }}
    builder.c %q{ int ruby_aw_citizen_change(){ return aw_citizen_change(); }}
    builder.c %q{ int ruby_aw_citizen_delete(int citizen){ return aw_citizen_delete(citizen); }}
    builder.c %q{ int ruby_aw_citizen_next(){ return aw_citizen_next(); }}
    builder.c %q{ int ruby_aw_citizen_previous(){ return aw_citizen_previous(); }}

    builder.c %q{ int ruby_aw_license_add(){return aw_license_add(); }}
    builder.c %q{ int ruby_aw_license_attributes( char * name ) {return aw_license_attributes( name ); }}
    builder.c %q{ int ruby_aw_license_change(){return aw_license_change(); }}
    builder.c %q{ int ruby_aw_license_delete( char * name ) { return aw_license_delete( name ); }}
    builder.c %q{ int ruby_aw_license_next(){return aw_license_next(); }}
    builder.c %q{ int ruby_aw_license_previous() {return aw_license_previous(); }}

    builder.c %q{ int ruby_aw_world_list(){return aw_world_list(); }}
    builder.c %q{ int ruby_aw_object_add(){return aw_object_add(); }}
    builder.c %q{ int ruby_aw_object_change(){ return aw_object_change(); }}
    builder.c %q{ int ruby_aw_object_delete(){ return aw_object_delete(); }}
    builder.c %q{ int ruby_aw_object_load(){ return aw_object_load(); }}

    builder.c %q{ VALUE ruby_aw_random() { return INT2FIX(aw_random()); } }
    builder.c %q{ int ruby_aw_world_attributes_change() {return aw_world_attributes_change(); }}
    builder.c %q{ int ruby_aw_universe_attributes_change() { return aw_universe_attributes_change(); }}
    builder.c %q{ VALUE ruby_aw_session() { return INT2FIX(aw_session()); } }

    # builder.c %q{ int ruby_aw_query (int x_sector, int z_sector, int sequence[3][3]) { return aw_query (int x_sector, int z_sector, int sequence[3][3]); }}
    # builder.c %q{ int ruby_aw_query_5x5 (int x_sector, int z_sector, int sequence[5][5]) { return aw_query_5x5 (int x_sector, int z_sector, int sequence[5][5]); }}

    builder.c %q{ int ruby_aw_sector_from_cell (int cell) { return aw_sector_from_cell ( cell); }}
    builder.c %q{ int ruby_aw_universe_ejection_add () { return aw_universe_ejection_add (); }}
    builder.c %q{ int ruby_aw_universe_ejection_delete (int address) { return aw_universe_ejection_delete ( address); }}
    builder.c %q{ int ruby_aw_universe_ejection_lookup () { return aw_universe_ejection_lookup (); }}
    builder.c %q{ int ruby_aw_universe_ejection_next () { return aw_universe_ejection_next (); }}
    builder.c %q{ int ruby_aw_universe_ejection_previous () { return aw_universe_ejection_previous (); }}

    builder.c %q{ int ruby_aw_world_eject () { return aw_world_eject (); }}
    builder.c %q{ int ruby_aw_world_ejection_add () { return aw_world_ejection_add (); }}
    builder.c %q{ int ruby_aw_world_ejection_delete () { return aw_world_ejection_delete (); }}
    builder.c %q{ int ruby_aw_world_ejection_lookup () { return aw_world_ejection_lookup (); }}
    builder.c %q{ int ruby_aw_world_ejection_next () { return aw_world_ejection_next (); }}
    builder.c %q{ int ruby_aw_world_ejection_previous () { return aw_world_ejection_previous (); }}
    builder.c %q{ int ruby_aw_world_attribute_set (int attribute, char* value) { return aw_world_attribute_set( attribute, value); }}
    builder.c %q{ int ruby_aw_world_attribute_get (int attribute) { 
      int read_only;
      char  string[AW_MAX_ATTRIBUTE_LENGTH + 1];
      int rc = aw_world_attribute_get ( attribute, &read_only, string); 
      VALUE h = rb_hash_new();
      rb_hash_aset(h, rb_str_new2("value"), rb_str_new2(string)); 
      rb_hash_aset(h, rb_str_new2("read_only"), read_only == 0 ? Qfalse : Qtrue);
      rb_hash_aset(h, rb_str_new2("rc"), INT2FIX(rc));
      return h;
    }}
    builder.c %q{ int ruby_aw_world_reload_registry () { return aw_world_reload_registry (); }}
    builder.c %q{ int ruby_aw_world_attributes_reset () { return aw_world_attributes_reset (); }}
    builder.c %q{ int ruby_aw_world_instance_set (int citizen, int world_instance) { return aw_world_instance_set ( citizen,  world_instance); }}
    builder.c %q{ int ruby_aw_world_instance_get (int citizen) { return aw_world_instance_get ( citizen); }}

    # builder.c %q{ int ruby_aw_server_admin (const char* domain, int port, char* password, void** instance) { return aw_server_admin ( domain,  port,  password, void** instance); }}
    builder.c %q{ int ruby_aw_server_world_add () { return aw_server_world_add (); }}
    builder.c %q{ int ruby_aw_server_world_delete (int id) { return aw_server_world_delete ( id); }}
    builder.c %q{ int ruby_aw_server_world_change (int id) { return aw_server_world_change ( id); }}
    builder.c %q{ int ruby_aw_server_world_list () { return aw_server_world_list (); }}
    builder.c %q{ int ruby_aw_server_world_start (int id) { return aw_server_world_start ( id); }}
    builder.c %q{ int ruby_aw_server_world_stop (int id) { return aw_server_world_stop ( id); }}
    builder.c %q{ int ruby_aw_server_world_set (int id) { return aw_server_world_set ( id); }}
    # builder.c %q{ int ruby_aw_server_world_instance_set (int id) { return aw_server_world_instance_set (int id); }}
    builder.c %q{ int ruby_aw_server_world_instance_add (int id, int instance_id) { return aw_server_world_instance_add ( id,  instance_id); }}
    builder.c %q{ int ruby_aw_server_world_instance_delete (int id, int instance_id) { return aw_server_world_instance_delete ( id,  instance_id); }}

    # builder.c %q{ int ruby_aw_terrain_set (int x, int z, int count, int texture, int* heights) { return aw_terrain_set ( x,  z,  count,  texture, int* heights); }}
    # builder.c %q{ int ruby_aw_terrain_query (int page_x, int page_z, unsigned long sequence) { return aw_terrain_query ( page_x,  page_z,  sequence); }}
    builder.c %q{ int ruby_aw_terrain_next () { return aw_terrain_next (); }}
    builder.c %q{ int ruby_aw_terrain_delete_all () { return aw_terrain_delete_all (); }}
    builder.c %q{ int ruby_aw_terrain_load_node () { return aw_terrain_load_node (); }}


    builder.c %q{ int ruby_aw_object_click () { return aw_object_click (); }}
    builder.c %q{ int ruby_aw_object_select () { return aw_object_select (); }}

    builder.c %q{ int ruby_aw_avatar_click (int session_id) { return aw_avatar_click ( session_id); }}

    builder.c %q{ int ruby_aw_address (int session_id) { return aw_address ( session_id); }}

    builder.c %q{ int ruby_aw_delete_all_objects () { return aw_delete_all_objects (); }}
    builder.c %q{ int ruby_aw_cell_next () { return aw_cell_next (); }}

    # builder.c %q{ int ruby_aw_user_data_set (void* data) { return aw_user_data_set (void* data); }}
    # builder.c %q{ void* ruby_aw_user_data (void) { return aw_user_data (void); }}

    builder.c %q{ int ruby_aw_avatar_set (int session_id) { return aw_avatar_set ( session_id); }}
    builder.c %q{ int ruby_aw_avatar_location (int citizen, int session_id, char* name) { return aw_avatar_location ( citizen,  session_id,  name); }}

    builder.c %q{ int ruby_aw_botgram_send () { return aw_botgram_send (); }}
    builder.c %q{ int ruby_aw_toolbar_click () { return aw_toolbar_click (); }}

    builder.c %q{ int ruby_aw_noise (int session_id) { return aw_noise ( session_id); }}
    builder.c %q{ int ruby_aw_world_attributes_send (int session_id) { return aw_world_attributes_send ( session_id); }}
    builder.c %q{ int ruby_aw_camera_set (int session_id) { return aw_camera_set ( session_id); }}
    builder.c %q{ int ruby_aw_botmenu_send () { return aw_botmenu_send (); }}
    builder.c %q{ int ruby_aw_object_bump () { return aw_object_bump (); }}
    # builder.c %q{ int ruby_aw_traffic_count (int* traffic_in, int* traffic_out) { return aw_traffic_count (int* traffic_in, int* traffic_out); }}
    builder.c_raw %q{ VALUE ruby_aw_tick () { return UINT2NUM(aw_tick()); }}
    builder.add_to_init %q{ }
    # builder.c %q{ uint64_t ruby_aw_tick () { return aw_tick (); }}

    builder.c %q{ int ruby_aw_check_right (int citizen, char* str) { return aw_check_right ( citizen, str); }}
    builder.c %q{ int ruby_aw_check_right_all (char* str) { return aw_check_right_all ( str); }}
    builder.c %q{ int ruby_aw_has_world_right (int citizen, int right) { return aw_has_world_right ( citizen,  (AW_ATTRIBUTE) right); }}
    builder.c %q{ int ruby_aw_has_world_right_all (int right) { return aw_has_world_right_all ( (AW_ATTRIBUTE) right); }}
    builder.c %q{ int ruby_aw_mover_set_state (int id, int state, int model_num) { return aw_mover_set_state ( id,  state,  model_num); }}
    builder.c %q{ int ruby_aw_mover_set_position (int id, int x, int y, int z, int yaw, int pitch, int roll) { return aw_mover_set_position ( id,  x,  y,  z,  yaw,  pitch,  roll); }}
    builder.c %q{ int ruby_aw_mover_rider_add (int id, int session, int dist, int angle, int y_delta, int yaw_delta, int pitch_delta) { return aw_mover_rider_add ( id,  session,  dist,  angle,  y_delta,  yaw_delta,  pitch_delta); }}
    builder.c %q{ int ruby_aw_mover_rider_change (int id, int session, int dist, int angle, int y_delta, int yaw_delta, int pitch_delta) { return aw_mover_rider_change ( id,  session,  dist,  angle,  y_delta,  yaw_delta,  pitch_delta); }}
    builder.c %q{ int ruby_aw_mover_rider_delete (int id, int session) { return aw_mover_rider_delete ( id,  session); }}
    builder.c %q{ int ruby_aw_mover_links (int id) { return aw_mover_links ( id); }}

    # builder.c %q{ aw_object_data_zone* ruby_aw_object_zone (int* len) { return aw_object_zone (int* len); }}
    # builder.c %q{ aw_object_data_particles* ruby_aw_object_particles (int* len) { return aw_object_particles (int* len); }}

    # builder.c %q{ int ruby_aw_object_camera_set (unsigned short flags, float zoom, char* name) { return aw_object_camera_set ( flags, zoom,  name); }}

    # builder.c %q{ aw_object_data_camera* ruby_aw_object_camera (int* len) { return aw_object_camera (int* len); }}
    # builder.c %q{ aw_object_data_mover* ruby_aw_object_mover (int* len) { return aw_object_mover (int* len); }}

    builder.c %q{ int ruby_aw_hud_create () { return aw_hud_create (); }}
    builder.c %q{ int ruby_aw_hud_click () { return aw_hud_click (); }}
    builder.c %q{ int ruby_aw_hud_destroy (int session, int id) { return aw_hud_destroy ( session, id); }}
    builder.c %q{ int ruby_aw_hud_clear (int session) { return aw_hud_clear ( session); }}

    # callbacks and handlers
    builder.generate_event_callback :AW_EVENT_AVATAR_ADD, :AW_AVATAR_SESSION, :AW_AVATAR_NAME,
      :AW_AVATAR_X, :AW_AVATAR_Y, :AW_AVATAR_Z, :AW_AVATAR_YAW, :AW_AVATAR_TYPE, :AW_AVATAR_GESTURE, :AW_AVATAR_VERSION,
      :AW_AVATAR_CITIZEN, :AW_AVATAR_PRIVILEGE, :AW_AVATAR_PITCH, :AW_AVATAR_STATE, :AW_PLUGIN_STRING

    builder.generate_event_callback :AW_EVENT_AVATAR_DELETE, :AW_AVATAR_SESSION, :AW_AVATAR_NAME,
      :AW_AVATAR_X, :AW_AVATAR_Y, :AW_AVATAR_Z, :AW_AVATAR_YAW, :AW_AVATAR_TYPE, :AW_AVATAR_GESTURE, :AW_AVATAR_VERSION,
      :AW_AVATAR_CITIZEN, :AW_AVATAR_PRIVILEGE, :AW_AVATAR_PITCH, :AW_AVATAR_STATE, :AW_PLUGIN_STRING

    builder.generate_event_callback :AW_EVENT_CHAT, :AW_AVATAR_NAME, :AW_CHAT_SESSION, :AW_CHAT_TYPE, :AW_CHAT_MESSAGE
    builder.generate_event_callback :AW_EVENT_AVATAR_CLICK, :AW_AVATAR_NAME, :AW_AVATAR_SESSION, :AW_CLICKED_NAME, :AW_CLICKED_SESSION

    builder.generate_event_callback :AW_EVENT_USER_INFO, :AW_USERLIST_ID, :AW_USERLIST_NAME, :AW_USERLIST_WORLD, 
      :AW_USERLIST_CITIZEN, :AW_USERLIST_STATE

    builder.generate_event_callback :AW_EVENT_OBJECT_ADD, :AW_OBJECT_SESSION, :AW_CELL_SEQUENCE, 
      :AW_CELL_X, :AW_CELL_Z, :AW_OBJECT_TYPE, :AW_OBJECT_ID, :AW_OBJECT_NUMBER, :AW_OBJECT_OWNER, 
      :AW_OBJECT_BUILD_TIMESTAMP, :AW_OBJECT_X, :AW_OBJECT_Y, :AW_OBJECT_Z, :AW_OBJECT_YAW, :AW_OBJECT_TILT, 
      :AW_OBJECT_ROLL, :AW_OBJECT_MODEL, :AW_OBJECT_DESCRIPTION, :AW_OBJECT_ACTION # leaving out :AW_OBJECT_DATA

    builder.generate_event_callback :AW_EVENT_OBJECT_DELETE, :AW_OBJECT_SESSION, :AW_CELL_SEQUENCE, 
      :AW_CELL_X, :AW_CELL_Z, :AW_OBJECT_ID, :AW_OBJECT_NUMBER

    builder.generate_event_callback :AW_EVENT_URL, :AW_AVATAR_SESSION, :AW_AVATAR_NAME, :AW_URL_NAME, :AW_URL_POST,
      :AW_URL_TARGET, :AW_URL_TARGET_3D

    builder.generate_event_callback :AW_EVENT_UNIVERSE_DISCONNECT, :AW_DISCONNECT_REASON  
    builder.generate_event_callback :AW_EVENT_WORLD_DISCONNECT, :AW_DISCONNECT_REASON

    # end callbacks and handlers    
  end
end
