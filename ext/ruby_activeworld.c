#include "ruby.h"
#include "Aw.h"

typedef struct { 
  void* c_self; 
  VALUE ruby_self; 
} RUBY_AW_APPLICATION; 

static VALUE cRubyActiveworld;
static VALUE sAWVector;      // ruby equivalent to aw_type_vector
static VALUE sAWVectorRange; // ruby equivalent to aw_type_vector_range
static VALUE sAWObjectDataZone; // ruby equivalent to aw_object_data_zone
static VALUE sAWObjectDataParticles; // ruby equivalent to aw_object_data_particles
static VALUE sAWObjectDataCamera; // ruby equivalent to aw_object_data_camera;

sAWVector = rb_struct_define("AWVector", "x", "y", "z", NULL);
sAWVectorRange = rb_struct_define("AWVectorRange", "min", "max", NULL);
sAWObjectDataZone = rb_struct_define("AWObjectDataZone", "size", "version",
  "shape", "priority", "gravity", "friction", "flags", "color", "fog_min",
  "fog_max", "footstep_len", "ambient_len", "camera_len", "target_cur_len",
  "str_data", NULL);
sAWObjectDataParticles = rb_struct_define("AWObjectDataParticles", 
  "volume", "version", "speed", "accel", "angle", "spin", "size",
  "release_min", "release_max", "release_size", "lifespan",
  "emitter_lifespan", "fade_in", "fade_out", "color_start", "color_end",
  "opacity", "render_style", "flags", "asset_list_len", "name_len",
  "str_data", NULL);
sAWObjectDataCamera = rb_struct_define("AWObjectDataCamera", 
  "version", "flags", "zoom", "name_len", "str_data", NULL );
sAWObjectDataMover = rb_struct_define();

void ruby_aw_bot_mark(void* p) { 
  rb_gc_mark(((RUBY_AW_APPLICATION*) p)->ruby_self); 
}

static VALUE ruby_aw_allocate(VALUE klass) {
  RUBY_AW_APPLICATION* ruby_aw_bot = 0;
  return Data_Make_Struct(klass, RUBY_AW_APPLICATION, ruby_aw_bot_mark, free, ruby_aw_bot);
}

/* This method creates a instance, and then calls aw_user_data_set to add a 
 * pointer to the ruby object to the AW instance's user_data container.
 *
 * Returns an instance of RubyActiveworld
 */
static VALUE ruby_activeworld_initialize(VALUE self, VALUE host, VALUE port) {
  int rc = 0; 
  RUBY_AW_APPLICATION* ruby_aw_bot = 0;
  Data_Get_Struct(self, RUBY_AW_APPLICATION, ruby_aw_bot);
  rc = aw_create( StringValuePtr(host), FIX2INT(port), &(ruby_aw_bot->c_self));
  if( rc != 0 /* RC_SUCCESS */ ) {
    rb_raise(rb_eRuntimeError,"Unable to create instance (reason %d)\n", rc);
  }
  ruby_aw_bot->ruby_self = self;
  aw_user_data_set(ruby_aw_bot);
  return self;
}
// Operates on the current bot instance
static VALUE ruby_aw_instance() { 
  return ((RUBY_AW_APPLICATION*) aw_user_data())->ruby_self;
}
// A

static VALUE ruby_aw_address(VALUE self, VALUE session_id) {
  return INT2FIX(aw_address ( FIX2INT(session_id)));
}

static VALUE ruby_aw_avatar_click(VALUE self, VALUE session_id) {
  return INT2FIX(aw_avatar_click ( FIX2INT(session_id)));
}

static VALUE ruby_aw_avatar_location(VALUE self, VALUE citizen, VALUE session_id, VALUE name) {
  return INT2FIX(aw_avatar_location ( FIX2INT(citizen),  FIX2INT(session_id),  StringValuePtr(name)));
}

static VALUE ruby_aw_avatar_reload(VALUE self, VALUE citizen, VALUE session) {
  return INT2FIX(aw_avatar_reload(FIX2INT(citizen), FIX2INT(session))); 
} 

static VALUE ruby_aw_avatar_set(VALUE self, VALUE session_id) {
  return INT2FIX(aw_avatar_set ( FIX2INT(session_id)));
}
// B

static VALUE ruby_aw_bool(VALUE self, VALUE attr) { 
  return aw_bool((AW_ATTRIBUTE) FIX2INT(attr)) == 0 ? Qfalse : Qtrue; 
}

static VALUE ruby_aw_bool_set(VALUE self, VALUE attr, VALUE val) {
  return INT2FIX(aw_bool_set((AW_ATTRIBUTE) FIX2INT(attr), val == Qtrue ? 1 : 0)); 
} 

static VALUE ruby_aw_botgram_send(VALUE self) {
  return INT2FIX(aw_botgram_send ());
}

static VALUE ruby_aw_botmenu_send(VALUE self) {
  return INT2FIX(aw_botmenu_send ());
}
// C
//aw_callback
//aw_callback_set
static VALUE ruby_aw_camera_set(VALUE self, VALUE session_id) {
  return INT2FIX(aw_camera_set ( FIX2INT(session_id)));
}
static VALUE ruby_aw_cell_next(VALUE self) {
  return INT2FIX(aw_cell_next ());
}
static VALUE ruby_aw_check_right(VALUE self, VALUE citizen, VALUE str) {
  return INT2FIX(aw_check_right ( FIX2INT(citizen), StringValuePtr(str)));
}
static VALUE ruby_aw_check_right_all(VALUE self, VALUE str) {
  return INT2FIX(aw_check_right_all ( StringValuePtr(str)));
}
static VALUE ruby_aw_citizen_add(VALUE self) {
  return INT2FIX(aw_citizen_add() ); 
}
static VALUE ruby_aw_citizen_attributes_by_name(VALUE self, VALUE name) {
  return INT2FIX(aw_citizen_attributes_by_name ( StringValuePtr(name) ));  
}
static VALUE ruby_aw_citizen_attributes_by_number(VALUE self, VALUE citizen) {
  return INT2FIX(aw_citizen_attributes_by_number ( FIX2INT(citizen) ));  
}
static VALUE ruby_aw_citizen_change(VALUE self) {
  return INT2FIX(aw_citizen_change()); 
}
static VALUE ruby_aw_citizen_delete(VALUE self, VALUE citizen) {
  return INT2FIX(aw_citizen_delete(FIX2INT(citizen))); 
}
static VALUE ruby_aw_citizen_next(VALUE self) {
  return INT2FIX(aw_citizen_next()); 
}
static VALUE ruby_aw_citizen_previous(VALUE self) {
  return INT2FIX(aw_citizen_previous()); 
}
static VALUE ruby_aw_console_message(VALUE self, VALUE session_id) {
  return INT2FIX(aw_console_message( FIX2INT(session_id) ));
}
// aw_create
// D
static VALUE ruby_aw_data(VALUE self, VALUE attr) { 
  unsigned int length = 0; 
  return rb_tainted_str_new2(aw_data((AW_ATTRIBUTE) FIX2INT(attr), &length)); 
}
static VALUE ruby_aw_data_set(VALUE self, VALUE attr, VALUE val) {
  return INT2FIX(aw_data_set((AW_ATTRIBUTE) FIX2INT(attr), StringValuePtr(val), (int) (RSTRING(val)->len)));
}
static VALUE ruby_aw_delete_all_objects(VALUE self) {
  return INT2FIX(aw_delete_all_objects ());
}
/* Calls aw_destroy on the calling instance. This means the instnace stops 
 * receiving events, and will be deallocated at the next aw_wait. Make sure
 * to release references to calling object after this.
 * 
 */
static VALUE ruby_aw_destroy(VALUE self) {
  RUBY_AW_APPLICATION* bot = 0;
  Data_Get_Struct(self, RUBY_AW_APPLICATION, bot);
  aw_instance_set(bot->c_self);
  return (INT2FIX(aw_destroy())); 
}
// E
static VALUE ruby_aw_enter(VALUE self, VALUE world_name) {
  return INT2FIX(aw_enter(StringValuePtr(world_name))); 
} 
static VALUE ruby_aw_exit(VALUE self) {
  return (INT2FIX(aw_exit())); 
}
// F

static VALUE ruby_aw_float(VALUE self, VALUE attr) {
  return rb_float_new(aw_float((AW_ATTRIBUTE) FIX2INT(attr))); 
}

static VALUE ruby_aw_float_set(VALUE self, VALUE attr, VALUE val) {
  return INT2FIX(aw_float_set((AW_ATTRIBUTE) FIX2INT(attr), (float) NUM2DBL(val)));
}
// H
static VALUE ruby_aw_has_world_right(VALUE self, VALUE citizen, VALUE right) {
  return INT2FIX(aw_has_world_right ( FIX2INT(citizen),  (AW_ATTRIBUTE) FIX2INT(right)));
}
static VALUE ruby_aw_has_world_right_all(VALUE self, VALUE right) {
  return INT2FIX(aw_has_world_right_all ( (AW_ATTRIBUTE) FIX2INT(right)));
}
static VALUE ruby_aw_hud_click(VALUE self) {
  return INT2FIX(aw_hud_click ());
}
static VALUE ruby_aw_hud_clear(VALUE self, VALUE session) {
  return INT2FIX(aw_hud_clear ( FIX2INT(session)));
}

static VALUE ruby_aw_hud_create(VALUE self) {
  return INT2FIX(aw_hud_create ());
}
static VALUE ruby_aw_hud_destroy(VALUE self, VALUE session, VALUE id) {
  return INT2FIX(aw_hud_destroy( FIX2INT(session), FIX2INT(id)));
}
// I 
static VALUE ruby_aw_init(VALUE self, VALUE build) {
  return INT2FIX(aw_init(FIX2INT(build)));
}
static VALUE ruby_aw_instance_set(VALUE self, VALUE target) {
  RUBY_AW_APPLICATION* bot = 0;
  Data_Get_Struct(target, RUBY_AW_APPLICATION, bot);
  return INT2FIX(aw_instance_set(bot->c_self));
}
static VALUE ruby_aw_int(VALUE self, VALUE attr) {
  return INT2NUM(aw_int((AW_ATTRIBUTE) FIX2INT(attr))); 
}
static VALUE ruby_aw_int_set(VALUE self, VALUE attr, VALUE val) {
  return INT2NUM(aw_int_set((AW_ATTRIBUTE) FIX2INT(attr), NUM2INT(val))); 
}
// L
static VALUE ruby_aw_login(VALUE self) {
  return INT2FIX(aw_login());
}
static VALUE ruby_aw_license_add(VALUE self) {
  return INT2FIX(aw_license_add()); 
}
static VALUE ruby_aw_license_attributes(VALUE self, VALUE name) {
  return INT2FIX(aw_license_attributes( StringValuePtr(name) )); 
}
static VALUE ruby_aw_license_change(VALUE self) {
  return INT2FIX(aw_license_change()); 
}
static VALUE ruby_aw_license_delete(VALUE self, VALUE name) {
  return INT2FIX(aw_license_delete( StringValuePtr(name) )); 
}
static VALUE ruby_aw_license_next(VALUE self) {
  return INT2FIX(aw_license_next()); 
}
static VALUE ruby_aw_license_previous(VALUE self) {
  return INT2FIX(aw_license_previous()); 
}
// M
static VALUE ruby_aw_mover_set_state(VALUE self, VALUE _id, VALUE _state, VALUE _model_num) {
  int id = FIX2INT(_id);
  int state = FIX2INT(_state);
  int model_num = FIX2INT(_model_num);
  return INT2FIX(aw_mover_set_state ( id,  state,  model_num));
}
static VALUE ruby_aw_mover_set_position(VALUE self, VALUE _id, VALUE _x, VALUE _y, VALUE _z, VALUE _yaw, VALUE _pitch, VALUE _roll) {
  int id = FIX2INT(_id);
  int x = FIX2INT(_x);
  int y = FIX2INT(_y);
  int z = FIX2INT(_z);
  int yaw = FIX2INT(_yaw);
  int pitch = FIX2INT(_pitch);
  int roll = FIX2INT(_roll);
  return INT2FIX(aw_mover_set_position ( id,  x,  y,  z,  yaw,  pitch,  roll));
}
static VALUE ruby_aw_mover_rider_add(VALUE self, VALUE _id, VALUE _session, VALUE _dist, VALUE _angle, VALUE _y_delta, VALUE _yaw_delta, VALUE _pitch_delta) {
  int id = FIX2INT(_id);
  int session = FIX2INT(_session);
  int dist = FIX2INT(_dist);
  int angle = FIX2INT(_angle);
  int y_delta = FIX2INT(_y_delta);
  int yaw_delta = FIX2INT(_yaw_delta);
  int pitch_delta = FIX2INT(_pitch_delta);
  return INT2FIX(aw_mover_rider_add ( id,  session,  dist,  angle,  y_delta,  yaw_delta,  pitch_delta));
}

static VALUE ruby_aw_mover_rider_change(VALUE self, VALUE _id, VALUE _session, VALUE _dist, VALUE _angle, VALUE _y_delta, VALUE _yaw_delta, VALUE _pitch_delta) {
  int id = FIX2INT(_id);
  int session = FIX2INT(_session);
  int dist = FIX2INT(_dist);
  int angle = FIX2INT(_angle);
  int y_delta = FIX2INT(_y_delta);
  int yaw_delta = FIX2INT(_yaw_delta);
  int pitch_delta = FIX2INT(_pitch_delta);
  return INT2FIX(aw_mover_rider_change ( id,  session,  dist,  angle,  y_delta,  yaw_delta,  pitch_delta));
}

static VALUE ruby_aw_mover_rider_delete(VALUE self, VALUE _id, VALUE _session) {
  int id = FIX2INT(_id);
  int session = FIX2INT(_session);
  return INT2FIX(aw_mover_rider_delete ( id,  session));
}

static VALUE ruby_aw_mover_links(VALUE self, VALUE _id) {
  int id = FIX2INT(_id);
  return INT2FIX(aw_mover_links ( id));
}
// N
static VALUE ruby_aw_noise(VALUE self, VALUE session_id) {
  return INT2FIX(aw_noise ( FIX2INT(session_id)));
}
// Q
#define QUERY_3x3 3
#define QUERY_5x5 5
static VALUE ruby_aw_query(VALUE self, VALUE x_sector, VALUE y_sector, VALUE sequence) {
  int x = 0, y = 0, rc = 0;
  int seq[QUERY_3x3][QUERY_3x3];
  VALUE t;
  for(x = 0; x < QUERY_3x3; ++x ) {
    t = rb_ary_entry(sequence, x);
    for(y = 0; y < QUERY_3x3; ++y) {
      seq[x][y] = FIX2INT(rb_ary_entry(t,y));
    }
  }
  rc = aw_query(FIX2INT(x_sector), FIX2INT(y_sector), seq);
  for(x = 0; x < QUERY_3x3; ++x ) {
    t = rb_ary_entry(sequence, x);
    for(y = 0; y < QUERY_3x3; ++y) {
      rb_ary_store(t, y, INT2FIX(seq[x][y]));
    }
  }
  return INT2FIX(rc);
}
static VALUE ruby_aw_query_5x5(VALUE self, VALUE x_sector, VALUE y_sector, VALUE sequence) {
  int x = 0, y = 0, rc = 0;
  int seq[QUERY_5x5][QUERY_5x5];
  VALUE t;
  for(x = 0; x < QUERY_5x5; ++x ) {
    t = rb_ary_entry(sequence, x);
    for(y = 0; y < QUERY_5x5; ++y) {
      seq[x][y] = FIX2INT(rb_ary_entry(t,y));
    }
  }
  rc = aw_query_5x5(FIX2INT(x_sector), FIX2INT(y_sector), seq);
  for(x = 0; x < QUERY_5x5; ++x ) {
    t = rb_ary_entry(sequence, x);
    for(y = 0; y < QUERY_5x5; ++y) {
      rb_ary_store(t, y, INT2FIX(seq[x][y]));
    }
  }
  return INT2FIX(rc);
}
// R
static VALUE ruby_aw_random(VALUE self) {
  return INT2FIX(aw_random()); 
}
// S
static VALUE ruby_aw_say(VALUE self, VALUE message) {
  return INT2FIX(aw_say( StringValuePtr(message) )); 
} 
static VALUE ruby_aw_sector_from_cell(VALUE self, VALUE cell) {
  return INT2FIX(aw_sector_from_cell( FIX2INT(cell))); 
}
static VALUE ruby_aw_server_world_add(VALUE self) {
  return INT2FIX(aw_server_world_add ());
}
static VALUE ruby_aw_server_world_change(VALUE self, VALUE id) {
  return INT2FIX(aw_server_world_change( FIX2INT(id)));
}
static VALUE ruby_aw_server_world_delete(VALUE self, VALUE id) {
  return INT2FIX(aw_server_world_delete( FIX2INT(id)));
}
static VALUE ruby_aw_server_world_list(VALUE self) {
  return INT2FIX(aw_server_world_list());
}
static VALUE ruby_aw_server_world_start(VALUE self, VALUE id) {
  return INT2FIX(aw_server_world_start( FIX2INT(id)));
}
static VALUE ruby_aw_server_world_stop(VALUE self, VALUE id) {
  return INT2FIX(aw_server_world_stop( FIX2INT(id)));
}
static VALUE ruby_aw_server_world_set(VALUE self, VALUE id) {
  return INT2FIX(aw_server_world_set( FIX2INT(id)));
}
static VALUE ruby_aw_server_world_instance_add(VALUE self, VALUE id, VALUE instance_id) {
  return INT2FIX(aw_server_world_instance_add( FIX2INT(id), FIX2INT(instance_id)));
}
static VALUE ruby_aw_server_world_instance_delete(VALUE self, VALUE id, VALUE instance_id) {
  return INT2FIX(aw_server_world_instance_delete( FIX2INT(id), FIX2INT(instance_id)));
}
static VALUE ruby_aw_server_world_instance_set(VALUE self, VALUE id) {
  return INT2FIX(aw_server_world_instance_set( FIX2INT(id)));
}
static VALUE ruby_aw_session(VALUE self) {
  return INT2FIX(aw_session()); 
}
static VALUE ruby_aw_state_change(VALUE self) {
  return INT2FIX(aw_state_change()); 
}
static VALUE ruby_aw_string(VALUE self, VALUE attr) {
  return rb_tainted_str_new2(aw_string((AW_ATTRIBUTE) FIX2INT(attr))); 
}
static VALUE ruby_aw_string_set(VALUE self, VALUE attr, VALUE val) {
  return INT2FIX(aw_string_set((AW_ATTRIBUTE) FIX2INT(attr), StringValuePtr(val)));
}
// T
/* call-seq:
 *   bot.ruby_aw_term
 *
 * This deallocates resources that have been used by the AW SDK. Use with
 * caution, and make sure to deallocate the ruby resources used as well.
 */
static VALUE ruby_aw_term(VALUE self) {
  aw_term(); 
  return (Qnil); 
}
static VALUE ruby_aw_teleport(VALUE self, VALUE session_id) {
  return INT2FIX(aw_teleport(FIX2INT(session_id)));
}
static VALUE ruby_aw_terrain_next(VALUE self) {
  return INT2FIX(aw_terrain_next ());
}
static VALUE ruby_aw_terrain_delete_all(VALUE self) {
  return INT2FIX(aw_terrain_delete_all ());
}
static VALUE ruby_aw_terrain_load_node(VALUE self) {
  return INT2FIX(aw_terrain_load_node ());
}
// missing 2 terrain functions
static VALUE ruby_aw_tick(VALUE self) {
  return UINT2NUM(aw_tick());
}
// U
static VALUE ruby_aw_universe_ejection_add(VALUE self) {
  return INT2FIX(aw_universe_ejection_add()); 
}
static VALUE ruby_aw_universe_attributes_change(VALUE self) {
  return INT2FIX(aw_universe_attributes_change()); 
}
static VALUE ruby_aw_universe_ejection_delete(VALUE self, VALUE address) {
  return INT2FIX(aw_universe_ejection_delete(FIX2INT(address)));
}
static VALUE ruby_aw_universe_ejection_lookup(VALUE self) {
  return INT2FIX(aw_universe_ejection_lookup());
}
static VALUE ruby_aw_universe_ejection_next(VALUE self) {
  return INT2FIX(aw_universe_ejection_next());
}
static VALUE ruby_aw_universe_ejection_previous(VALUE self) {
  return INT2FIX(aw_universe_ejection_previous());
}
static VALUE ruby_aw_user_list(VALUE self) {
  return (INT2FIX(aw_user_list())); 
}
static VALUE ruby_aw_url_click(VALUE self, VALUE url) {
  return FIX2INT(aw_url_click(StringValuePtr(url)));
}
static VALUE ruby_aw_url_send(VALUE self, VALUE session_id, VALUE url, VALUE target) {
  return INT2FIX(aw_url_send( FIX2INT(session_id), StringValuePtr(url), NIL_P(target) ?  0 : StringValuePtr(target))); 
}
// O
static VALUE ruby_aw_object_add(VALUE self) {
  return INT2FIX(aw_object_add()); 
}
static VALUE ruby_aw_object_bump(VALUE self) {
  return INT2FIX(aw_object_bump ());
}
static VALUE ruby_aw_object_change(VALUE self) {
  return INT2FIX(aw_object_change()); 
}  
static VALUE ruby_aw_object_click(VALUE self) {
  return INT2FIX(aw_object_click ());
}
static VALUE ruby_aw_object_delete(VALUE self) {
  return INT2FIX(aw_object_delete()); 
}
static VALUE ruby_aw_object_load(VALUE self) {
  return INT2FIX(aw_object_load()); 
}
static VALUE ruby_aw_object_select(VALUE self) {
  return INT2FIX(aw_object_select ());
}
// W
static VALUE ruby_aw_wait(VALUE self, VALUE milliseconds) {
  return INT2FIX(aw_wait(FIX2INT(milliseconds))); 
}
static VALUE ruby_aw_whisper(VALUE self, VALUE session, VALUE message) {
  return INT2FIX(aw_whisper( FIX2INT(session), StringValuePtr(message) )); 
} 
static VALUE ruby_aw_world_attribute_get(VALUE self, VALUE attribute) {
  int read_only;
  char  val[AW_MAX_ATTRIBUTE_LENGTH + 1];
  int rc = aw_world_attribute_get( FIX2INT(attribute), &read_only, val);
  VALUE h = rb_hash_new();
  rb_hash_aset(h, rb_str_new2("rc"), INT2FIX(rc));
  rb_hash_aset(h, rb_str_new2("value"), rb_tainted_str_new2(val));
  rb_hash_aset(h, rb_str_new2("read_only"), rc == 0 ? Qfalse : Qtrue );
  return h;
}
static VALUE ruby_aw_world_attribute_set(VALUE self, VALUE attribute, VALUE value) {
  return INT2FIX(aw_world_attribute_set ( FIX2INT(attribute), StringValuePtr(value)));
}  
static VALUE ruby_aw_world_attributes_change(VALUE self) {
  return INT2FIX(aw_world_attributes_change()); 
}
static VALUE ruby_aw_world_attributes_send(VALUE self, VALUE session_id) {
  return INT2FIX(aw_world_attributes_send ( FIX2INT(session_id)));
}
static VALUE ruby_aw_world_attributes_reset(VALUE self) {
  return INT2FIX(aw_world_attributes_reset ());
}
static VALUE ruby_aw_world_eject(VALUE self) {
  return INT2FIX(aw_world_eject ());
}
static VALUE ruby_aw_world_ejection_add(VALUE self) {
  return INT2FIX(aw_world_ejection_add ());
}
static VALUE ruby_aw_world_ejection_delete(VALUE self) {
  return INT2FIX(aw_world_ejection_delete ());
}
static VALUE ruby_aw_world_ejection_lookup(VALUE self) {
  return INT2FIX(aw_world_ejection_lookup ());
}
static VALUE ruby_aw_world_ejection_next(VALUE self) {
  return INT2FIX(aw_world_ejection_next ());
}
static VALUE ruby_aw_world_ejection_previous(VALUE self) {
  return INT2FIX(aw_world_ejection_previous ());
}
static VALUE ruby_aw_world_instance_get(VALUE self, VALUE citizen) {
  return INT2FIX(aw_world_instance_get ( FIX2INT(citizen) ));
}
static VALUE ruby_aw_world_instance_set(VALUE self, VALUE citizen, VALUE world_instance) {
  return INT2FIX(aw_world_instance_set ( FIX2INT(citizen),  FIX2INT(world_instance)));
}
static VALUE ruby_aw_world_list(VALUE self) {
  return INT2FIX(aw_world_list()); 
}
static VALUE ruby_aw_world_reload_registry(VALUE self) {
  return INT2FIX(aw_world_reload_registry ());
}

// CALLBACKS
VALUE admin_world_delete_event_callback(VALUE self) {
  return Qnil;
}
void admin_world_delete_event_callback_hook() {
  rb_funcall(ruby_aw_instance(), rb_intern("admin_world_delete_event_callback"), 0);
}
static VALUE receive_aw_event_admin_world_delete(VALUE self) {
  return INT2NUM(aw_instance_event_set(AW_EVENT_ADMIN_WORLD_DELETE,admin_world_delete_event_callback_hook));
}


VALUE admin_world_info_event_callback(VALUE self) {
  return Qnil;
}
void admin_world_info_event_callback_hook() {
  rb_funcall(ruby_aw_instance(), rb_intern("admin_world_info_event_callback"), 0);
}
static VALUE receive_aw_event_admin_world_info(VALUE self) {
  return INT2NUM(aw_instance_event_set(AW_EVENT_ADMIN_WORLD_INFO,admin_world_info_event_callback_hook));
}


VALUE avatar_add_event_callback(VALUE self) {
  return Qnil;
}
void avatar_add_event_callback_hook() {
  rb_funcall(ruby_aw_instance(), rb_intern("avatar_add_event_callback"), 0);
}
static VALUE receive_aw_event_avatar_add(VALUE self) {
  return INT2NUM(aw_instance_event_set(AW_EVENT_AVATAR_ADD,avatar_add_event_callback_hook));
}


VALUE avatar_change_event_callback(VALUE self) {
  return Qnil;
}
void avatar_change_event_callback_hook() {
  rb_funcall(ruby_aw_instance(), rb_intern("avatar_change_event_callback"), 0);
}
static VALUE receive_aw_event_avatar_change(VALUE self) {
  return INT2NUM(aw_instance_event_set(AW_EVENT_AVATAR_CHANGE,avatar_change_event_callback_hook));
}


VALUE avatar_click_event_callback(VALUE self) {
  return Qnil;
}
void avatar_click_event_callback_hook() {
  rb_funcall(ruby_aw_instance(), rb_intern("avatar_click_event_callback"), 0);
}
static VALUE receive_aw_event_avatar_click(VALUE self) {
  return INT2NUM(aw_instance_event_set(AW_EVENT_AVATAR_CLICK,avatar_click_event_callback_hook));
}


VALUE avatar_delete_event_callback(VALUE self) {
  return Qnil;
}
void avatar_delete_event_callback_hook() {
  rb_funcall(ruby_aw_instance(), rb_intern("avatar_delete_event_callback"), 0);
}
static VALUE receive_aw_event_avatar_delete(VALUE self) {
  return INT2NUM(aw_instance_event_set(AW_EVENT_AVATAR_DELETE,avatar_delete_event_callback_hook));
}


VALUE avatar_reload_event_callback(VALUE self) {
  return Qnil;
}
void avatar_reload_event_callback_hook() {
  rb_funcall(ruby_aw_instance(), rb_intern("avatar_reload_event_callback"), 0);
}
static VALUE receive_aw_event_avatar_reload(VALUE self) {
  return INT2NUM(aw_instance_event_set(AW_EVENT_AVATAR_RELOAD,avatar_reload_event_callback_hook));
}


VALUE botgram_event_callback(VALUE self) {
  return Qnil;
}
void botgram_event_callback_hook() {
  rb_funcall(ruby_aw_instance(), rb_intern("botgram_event_callback"), 0);
}
static VALUE receive_aw_event_botgram(VALUE self) {
  return INT2NUM(aw_instance_event_set(AW_EVENT_BOTGRAM,botgram_event_callback_hook));
}


VALUE botmenu_event_callback(VALUE self) {
  return Qnil;
}
void botmenu_event_callback_hook() {
  rb_funcall(ruby_aw_instance(), rb_intern("botmenu_event_callback"), 0);
}
static VALUE receive_aw_event_botmenu(VALUE self) {
  return INT2NUM(aw_instance_event_set(AW_EVENT_BOTMENU,botmenu_event_callback_hook));
}


VALUE camera_event_callback(VALUE self) {
  return Qnil;
}
void camera_event_callback_hook() {
  rb_funcall(ruby_aw_instance(), rb_intern("camera_event_callback"), 0);
}
static VALUE receive_aw_event_camera(VALUE self) {
  return INT2NUM(aw_instance_event_set(AW_EVENT_CAMERA,camera_event_callback_hook));
}


VALUE cell_begin_event_callback(VALUE self) {
  return Qnil;
}
void cell_begin_event_callback_hook() {
  rb_funcall(ruby_aw_instance(), rb_intern("cell_begin_event_callback"), 0);
}
static VALUE receive_aw_event_cell_begin(VALUE self) {
  return INT2NUM(aw_instance_event_set(AW_EVENT_CELL_BEGIN,cell_begin_event_callback_hook));
}


VALUE cell_end_event_callback(VALUE self) {
  return Qnil;
}
void cell_end_event_callback_hook() {
  rb_funcall(ruby_aw_instance(), rb_intern("cell_end_event_callback"), 0);
}
static VALUE receive_aw_event_cell_end(VALUE self) {
  return INT2NUM(aw_instance_event_set(AW_EVENT_CELL_END,cell_end_event_callback_hook));
}


VALUE cell_object_event_callback(VALUE self) {
  return Qnil;
}
void cell_object_event_callback_hook() {
  rb_funcall(ruby_aw_instance(), rb_intern("cell_object_event_callback"), 0);
}
static VALUE receive_aw_event_cell_object(VALUE self) {
  return INT2NUM(aw_instance_event_set(AW_EVENT_CELL_OBJECT,cell_object_event_callback_hook));
}


VALUE chat_event_callback(VALUE self) {
  return Qnil;
}
void chat_event_callback_hook() {
  rb_funcall(ruby_aw_instance(), rb_intern("chat_event_callback"), 0);
}
static VALUE receive_aw_event_chat(VALUE self) {
  return INT2NUM(aw_instance_event_set(AW_EVENT_CHAT,chat_event_callback_hook));
}


VALUE console_message_event_callback(VALUE self) {
  return Qnil;
}
void console_message_event_callback_hook() {
  rb_funcall(ruby_aw_instance(), rb_intern("console_message_event_callback"), 0);
}
static VALUE receive_aw_event_console_message(VALUE self) {
  return INT2NUM(aw_instance_event_set(AW_EVENT_CONSOLE_MESSAGE,console_message_event_callback_hook));
}


VALUE contact_state_event_callback(VALUE self) {
  return Qnil;
}
void contact_state_event_callback_hook() {
  rb_funcall(ruby_aw_instance(), rb_intern("contact_state_event_callback"), 0);
}
static VALUE receive_aw_event_contact_state(VALUE self) {
  return INT2NUM(aw_instance_event_set(AW_EVENT_CONTACT_STATE,contact_state_event_callback_hook));
}


VALUE entity_add_event_callback(VALUE self) {
  return Qnil;
}
void entity_add_event_callback_hook() {
  rb_funcall(ruby_aw_instance(), rb_intern("entity_add_event_callback"), 0);
}
static VALUE receive_aw_event_entity_add(VALUE self) {
  return INT2NUM(aw_instance_event_set(AW_EVENT_ENTITY_ADD,entity_add_event_callback_hook));
}


VALUE entity_change_event_callback(VALUE self) {
  return Qnil;
}
void entity_change_event_callback_hook() {
  rb_funcall(ruby_aw_instance(), rb_intern("entity_change_event_callback"), 0);
}
static VALUE receive_aw_event_entity_change(VALUE self) {
  return INT2NUM(aw_instance_event_set(AW_EVENT_ENTITY_CHANGE,entity_change_event_callback_hook));
}


VALUE entity_delete_event_callback(VALUE self) {
  return Qnil;
}
void entity_delete_event_callback_hook() {
  rb_funcall(ruby_aw_instance(), rb_intern("entity_delete_event_callback"), 0);
}
static VALUE receive_aw_event_entity_delete(VALUE self) {
  return INT2NUM(aw_instance_event_set(AW_EVENT_ENTITY_DELETE,entity_delete_event_callback_hook));
}


VALUE entity_links_event_callback(VALUE self) {
  return Qnil;
}
void entity_links_event_callback_hook() {
  rb_funcall(ruby_aw_instance(), rb_intern("entity_links_event_callback"), 0);
}
static VALUE receive_aw_event_entity_links(VALUE self) {
  return INT2NUM(aw_instance_event_set(AW_EVENT_ENTITY_LINKS,entity_links_event_callback_hook));
}


VALUE entity_rider_add_event_callback(VALUE self) {
  return Qnil;
}
void entity_rider_add_event_callback_hook() {
  rb_funcall(ruby_aw_instance(), rb_intern("entity_rider_add_event_callback"), 0);
}
static VALUE receive_aw_event_entity_rider_add(VALUE self) {
  return INT2NUM(aw_instance_event_set(AW_EVENT_ENTITY_RIDER_ADD,entity_rider_add_event_callback_hook));
}


VALUE entity_rider_change_event_callback(VALUE self) {
  return Qnil;
}
void entity_rider_change_event_callback_hook() {
  rb_funcall(ruby_aw_instance(), rb_intern("entity_rider_change_event_callback"), 0);
}
static VALUE receive_aw_event_entity_rider_change(VALUE self) {
  return INT2NUM(aw_instance_event_set(AW_EVENT_ENTITY_RIDER_CHANGE,entity_rider_change_event_callback_hook));
}


VALUE entity_rider_delete_event_callback(VALUE self) {
  return Qnil;
}
void entity_rider_delete_event_callback_hook() {
  rb_funcall(ruby_aw_instance(), rb_intern("entity_rider_delete_event_callback"), 0);
}
static VALUE receive_aw_event_entity_rider_delete(VALUE self) {
  return INT2NUM(aw_instance_event_set(AW_EVENT_ENTITY_RIDER_DELETE,entity_rider_delete_event_callback_hook));
}


VALUE hud_clear_event_callback(VALUE self) {
  return Qnil;
}
void hud_clear_event_callback_hook() {
  rb_funcall(ruby_aw_instance(), rb_intern("hud_clear_event_callback"), 0);
}
static VALUE receive_aw_event_hud_clear(VALUE self) {
  return INT2NUM(aw_instance_event_set(AW_EVENT_HUD_CLEAR,hud_clear_event_callback_hook));
}


VALUE hud_click_event_callback(VALUE self) {
  return Qnil;
}
void hud_click_event_callback_hook() {
  rb_funcall(ruby_aw_instance(), rb_intern("hud_click_event_callback"), 0);
}
static VALUE receive_aw_event_hud_click(VALUE self) {
  return INT2NUM(aw_instance_event_set(AW_EVENT_HUD_CLICK,hud_click_event_callback_hook));
}


VALUE hud_create_event_callback(VALUE self) {
  return Qnil;
}
void hud_create_event_callback_hook() {
  rb_funcall(ruby_aw_instance(), rb_intern("hud_create_event_callback"), 0);
}
static VALUE receive_aw_event_hud_create(VALUE self) {
  return INT2NUM(aw_instance_event_set(AW_EVENT_HUD_CREATE,hud_create_event_callback_hook));
}


VALUE hud_destroy_event_callback(VALUE self) {
  return Qnil;
}
void hud_destroy_event_callback_hook() {
  rb_funcall(ruby_aw_instance(), rb_intern("hud_destroy_event_callback"), 0);
}
static VALUE receive_aw_event_hud_destroy(VALUE self) {
  return INT2NUM(aw_instance_event_set(AW_EVENT_HUD_DESTROY,hud_destroy_event_callback_hook));
}


VALUE join_event_callback(VALUE self) {
  return Qnil;
}
void join_event_callback_hook() {
  rb_funcall(ruby_aw_instance(), rb_intern("join_event_callback"), 0);
}
static VALUE receive_aw_event_join(VALUE self) {
  return INT2NUM(aw_instance_event_set(AW_EVENT_JOIN,join_event_callback_hook));
}


VALUE noise_event_callback(VALUE self) {
  return Qnil;
}
void noise_event_callback_hook() {
  rb_funcall(ruby_aw_instance(), rb_intern("noise_event_callback"), 0);
}
static VALUE receive_aw_event_noise(VALUE self) {
  return INT2NUM(aw_instance_event_set(AW_EVENT_NOISE,noise_event_callback_hook));
}


VALUE object_add_event_callback(VALUE self) {
  return Qnil;
}
void object_add_event_callback_hook() {
  rb_funcall(ruby_aw_instance(), rb_intern("object_add_event_callback"), 0);
}
static VALUE receive_aw_event_object_add(VALUE self) {
  return INT2NUM(aw_instance_event_set(AW_EVENT_OBJECT_ADD,object_add_event_callback_hook));
}


VALUE object_bump_event_callback(VALUE self) {
  return Qnil;
}
void object_bump_event_callback_hook() {
  rb_funcall(ruby_aw_instance(), rb_intern("object_bump_event_callback"), 0);
}
static VALUE receive_aw_event_object_bump(VALUE self) {
  return INT2NUM(aw_instance_event_set(AW_EVENT_OBJECT_BUMP,object_bump_event_callback_hook));
}


VALUE object_click_event_callback(VALUE self) {
  return Qnil;
}
void object_click_event_callback_hook() {
  rb_funcall(ruby_aw_instance(), rb_intern("object_click_event_callback"), 0);
}
static VALUE receive_aw_event_object_click(VALUE self) {
  return INT2NUM(aw_instance_event_set(AW_EVENT_OBJECT_CLICK,object_click_event_callback_hook));
}


VALUE object_delete_event_callback(VALUE self) {
  return Qnil;
}
void object_delete_event_callback_hook() {
  rb_funcall(ruby_aw_instance(), rb_intern("object_delete_event_callback"), 0);
}
static VALUE receive_aw_event_object_delete(VALUE self) {
  return INT2NUM(aw_instance_event_set(AW_EVENT_OBJECT_DELETE,object_delete_event_callback_hook));
}


VALUE object_select_event_callback(VALUE self) {
  return Qnil;
}
void object_select_event_callback_hook() {
  rb_funcall(ruby_aw_instance(), rb_intern("object_select_event_callback"), 0);
}
static VALUE receive_aw_event_object_select(VALUE self) {
  return INT2NUM(aw_instance_event_set(AW_EVENT_OBJECT_SELECT,object_select_event_callback_hook));
}


VALUE send_file_event_callback(VALUE self) {
  return Qnil;
}
void send_file_event_callback_hook() {
  rb_funcall(ruby_aw_instance(), rb_intern("send_file_event_callback"), 0);
}
static VALUE receive_aw_event_send_file(VALUE self) {
  return INT2NUM(aw_instance_event_set(AW_EVENT_SEND_FILE,send_file_event_callback_hook));
}


VALUE telegram_event_callback(VALUE self) {
  return Qnil;
}
void telegram_event_callback_hook() {
  rb_funcall(ruby_aw_instance(), rb_intern("telegram_event_callback"), 0);
}
static VALUE receive_aw_event_telegram(VALUE self) {
  return INT2NUM(aw_instance_event_set(AW_EVENT_TELEGRAM,telegram_event_callback_hook));
}


VALUE teleport_event_callback(VALUE self) {
  return Qnil;
}
void teleport_event_callback_hook() {
  rb_funcall(ruby_aw_instance(), rb_intern("teleport_event_callback"), 0);
}
static VALUE receive_aw_event_teleport(VALUE self) {
  return INT2NUM(aw_instance_event_set(AW_EVENT_TELEPORT,teleport_event_callback_hook));
}


VALUE terrain_begin_event_callback(VALUE self) {
  return Qnil;
}
void terrain_begin_event_callback_hook() {
  rb_funcall(ruby_aw_instance(), rb_intern("terrain_begin_event_callback"), 0);
}
static VALUE receive_aw_event_terrain_begin(VALUE self) {
  return INT2NUM(aw_instance_event_set(AW_EVENT_TERRAIN_BEGIN,terrain_begin_event_callback_hook));
}


VALUE terrain_changed_event_callback(VALUE self) {
  return Qnil;
}
void terrain_changed_event_callback_hook() {
  rb_funcall(ruby_aw_instance(), rb_intern("terrain_changed_event_callback"), 0);
}
static VALUE receive_aw_event_terrain_changed(VALUE self) {
  return INT2NUM(aw_instance_event_set(AW_EVENT_TERRAIN_CHANGED,terrain_changed_event_callback_hook));
}


VALUE terrain_data_event_callback(VALUE self) {
  return Qnil;
}
void terrain_data_event_callback_hook() {
  rb_funcall(ruby_aw_instance(), rb_intern("terrain_data_event_callback"), 0);
}
static VALUE receive_aw_event_terrain_data(VALUE self) {
  return INT2NUM(aw_instance_event_set(AW_EVENT_TERRAIN_DATA,terrain_data_event_callback_hook));
}


VALUE terrain_end_event_callback(VALUE self) {
  return Qnil;
}
void terrain_end_event_callback_hook() {
  rb_funcall(ruby_aw_instance(), rb_intern("terrain_end_event_callback"), 0);
}
static VALUE receive_aw_event_terrain_end(VALUE self) {
  return INT2NUM(aw_instance_event_set(AW_EVENT_TERRAIN_END,terrain_end_event_callback_hook));
}


VALUE toolbar_click_event_callback(VALUE self) {
  return Qnil;
}
void toolbar_click_event_callback_hook() {
  rb_funcall(ruby_aw_instance(), rb_intern("toolbar_click_event_callback"), 0);
}
static VALUE receive_aw_event_toolbar_click(VALUE self) {
  return INT2NUM(aw_instance_event_set(AW_EVENT_TOOLBAR_CLICK,toolbar_click_event_callback_hook));
}


VALUE universe_attributes_event_callback(VALUE self) {
  return Qnil;
}
void universe_attributes_event_callback_hook() {
  rb_funcall(ruby_aw_instance(), rb_intern("universe_attributes_event_callback"), 0);
}
static VALUE receive_aw_event_universe_attributes(VALUE self) {
  return INT2NUM(aw_instance_event_set(AW_EVENT_UNIVERSE_ATTRIBUTES,universe_attributes_event_callback_hook));
}


VALUE universe_disconnect_event_callback(VALUE self) {
  return Qnil;
}
void universe_disconnect_event_callback_hook() {
  rb_funcall(ruby_aw_instance(), rb_intern("universe_disconnect_event_callback"), 0);
}
static VALUE receive_aw_event_universe_disconnect(VALUE self) {
  return INT2NUM(aw_instance_event_set(AW_EVENT_UNIVERSE_DISCONNECT,universe_disconnect_event_callback_hook));
}


VALUE url_event_callback(VALUE self) {
  return Qnil;
}
void url_event_callback_hook() {
  rb_funcall(ruby_aw_instance(), rb_intern("url_event_callback"), 0);
}
static VALUE receive_aw_event_url(VALUE self) {
  return INT2NUM(aw_instance_event_set(AW_EVENT_URL,url_event_callback_hook));
}


VALUE url_click_event_callback(VALUE self) {
  return Qnil;
}
void url_click_event_callback_hook() {
  rb_funcall(ruby_aw_instance(), rb_intern("url_click_event_callback"), 0);
}
static VALUE receive_aw_event_url_click(VALUE self) {
  return INT2NUM(aw_instance_event_set(AW_EVENT_URL_CLICK,url_click_event_callback_hook));
}


VALUE user_info_event_callback(VALUE self) {
  return Qnil;
}
void user_info_event_callback_hook() {
  rb_funcall(ruby_aw_instance(), rb_intern("user_info_event_callback"), 0);
}
static VALUE receive_aw_event_user_info(VALUE self) {
  return INT2NUM(aw_instance_event_set(AW_EVENT_USER_INFO,user_info_event_callback_hook));
}


VALUE voip_data_event_callback(VALUE self) {
  return Qnil;
}
void voip_data_event_callback_hook() {
  rb_funcall(ruby_aw_instance(), rb_intern("voip_data_event_callback"), 0);
}
static VALUE receive_aw_event_voip_data(VALUE self) {
  return INT2NUM(aw_instance_event_set(AW_EVENT_VOIP_DATA,voip_data_event_callback_hook));
}


VALUE world_attributes_event_callback(VALUE self) {
  return Qnil;
}
void world_attributes_event_callback_hook() {
  rb_funcall(ruby_aw_instance(), rb_intern("world_attributes_event_callback"), 0);
}
static VALUE receive_aw_event_world_attributes(VALUE self) {
  return INT2NUM(aw_instance_event_set(AW_EVENT_WORLD_ATTRIBUTES,world_attributes_event_callback_hook));
}


VALUE world_disconnect_event_callback(VALUE self) {
  return Qnil;
}
void world_disconnect_event_callback_hook() {
  rb_funcall(ruby_aw_instance(), rb_intern("world_disconnect_event_callback"), 0);
}
static VALUE receive_aw_event_world_disconnect(VALUE self) {
  return INT2NUM(aw_instance_event_set(AW_EVENT_WORLD_DISCONNECT,world_disconnect_event_callback_hook));
}


VALUE world_info_event_callback(VALUE self) {
  return Qnil;
}
void world_info_event_callback_hook() {
  rb_funcall(ruby_aw_instance(), rb_intern("world_info_event_callback"), 0);
}
static VALUE receive_aw_event_world_info(VALUE self) {
  return INT2NUM(aw_instance_event_set(AW_EVENT_WORLD_INFO,world_info_event_callback_hook));
}


VALUE address_callback(VALUE self, VALUE rc) {
  return Qnil;
}
void address_callback_hook(int rc) {
  rb_funcall(ruby_aw_instance(), rb_intern("address_callback"), 1, INT2FIX(rc));
}
static VALUE receive_aw_callback_address(VALUE self) {
  return INT2NUM(aw_instance_callback_set(AW_CALLBACK_ADDRESS,address_callback_hook));
}


VALUE admin_callback(VALUE self, VALUE rc) {
  return Qnil;
}
void admin_callback_hook(int rc) {
  rb_funcall(ruby_aw_instance(), rb_intern("admin_callback"), 1, INT2FIX(rc));
}
static VALUE receive_aw_callback_admin(VALUE self) {
  return INT2NUM(aw_instance_callback_set(AW_CALLBACK_ADMIN,admin_callback_hook));
}


VALUE admin_world_list_callback(VALUE self, VALUE rc) {
  return Qnil;
}
void admin_world_list_callback_hook(int rc) {
  rb_funcall(ruby_aw_instance(), rb_intern("admin_world_list_callback"), 1, INT2FIX(rc));
}
static VALUE receive_aw_callback_admin_world_list(VALUE self) {
  return INT2NUM(aw_instance_callback_set(AW_CALLBACK_ADMIN_WORLD_LIST,admin_world_list_callback_hook));
}


VALUE admin_world_result_callback(VALUE self, VALUE rc) {
  return Qnil;
}
void admin_world_result_callback_hook(int rc) {
  rb_funcall(ruby_aw_instance(), rb_intern("admin_world_result_callback"), 1, INT2FIX(rc));
}
static VALUE receive_aw_callback_admin_world_result(VALUE self) {
  return INT2NUM(aw_instance_callback_set(AW_CALLBACK_ADMIN_WORLD_RESULT,admin_world_result_callback_hook));
}


VALUE attributes_reset_result_callback(VALUE self, VALUE rc) {
  return Qnil;
}
void attributes_reset_result_callback_hook(int rc) {
  rb_funcall(ruby_aw_instance(), rb_intern("attributes_reset_result_callback"), 1, INT2FIX(rc));
}
static VALUE receive_aw_callback_attributes_reset_result(VALUE self) {
  return INT2NUM(aw_instance_callback_set(AW_CALLBACK_ATTRIBUTES_RESET_RESULT,attributes_reset_result_callback_hook));
}


VALUE avatar_location_callback(VALUE self, VALUE rc) {
  return Qnil;
}
void avatar_location_callback_hook(int rc) {
  rb_funcall(ruby_aw_instance(), rb_intern("avatar_location_callback"), 1, INT2FIX(rc));
}
static VALUE receive_aw_callback_avatar_location(VALUE self) {
  return INT2NUM(aw_instance_callback_set(AW_CALLBACK_AVATAR_LOCATION,avatar_location_callback_hook));
}


VALUE botgram_result_callback(VALUE self, VALUE rc) {
  return Qnil;
}
void botgram_result_callback_hook(int rc) {
  rb_funcall(ruby_aw_instance(), rb_intern("botgram_result_callback"), 1, INT2FIX(rc));
}
static VALUE receive_aw_callback_botgram_result(VALUE self) {
  return INT2NUM(aw_instance_callback_set(AW_CALLBACK_BOTGRAM_RESULT,botgram_result_callback_hook));
}


VALUE botmenu_result_callback(VALUE self, VALUE rc) {
  return Qnil;
}
void botmenu_result_callback_hook(int rc) {
  rb_funcall(ruby_aw_instance(), rb_intern("botmenu_result_callback"), 1, INT2FIX(rc));
}
static VALUE receive_aw_callback_botmenu_result(VALUE self) {
  return INT2NUM(aw_instance_callback_set(AW_CALLBACK_BOTMENU_RESULT,botmenu_result_callback_hook));
}


VALUE cav_callback(VALUE self, VALUE rc) {
  return Qnil;
}
void cav_callback_hook(int rc) {
  rb_funcall(ruby_aw_instance(), rb_intern("cav_callback"), 1, INT2FIX(rc));
}
static VALUE receive_aw_callback_cav(VALUE self) {
  return INT2NUM(aw_instance_callback_set(AW_CALLBACK_CAV,cav_callback_hook));
}


VALUE cav_result_callback(VALUE self, VALUE rc) {
  return Qnil;
}
void cav_result_callback_hook(int rc) {
  rb_funcall(ruby_aw_instance(), rb_intern("cav_result_callback"), 1, INT2FIX(rc));
}
static VALUE receive_aw_callback_cav_result(VALUE self) {
  return INT2NUM(aw_instance_callback_set(AW_CALLBACK_CAV_RESULT,cav_result_callback_hook));
}


VALUE cav_template_callback(VALUE self, VALUE rc) {
  return Qnil;
}
void cav_template_callback_hook(int rc) {
  rb_funcall(ruby_aw_instance(), rb_intern("cav_template_callback"), 1, INT2FIX(rc));
}
static VALUE receive_aw_callback_cav_template(VALUE self) {
  return INT2NUM(aw_instance_callback_set(AW_CALLBACK_CAV_TEMPLATE,cav_template_callback_hook));
}


VALUE cav_template_result_callback(VALUE self, VALUE rc) {
  return Qnil;
}
void cav_template_result_callback_hook(int rc) {
  rb_funcall(ruby_aw_instance(), rb_intern("cav_template_result_callback"), 1, INT2FIX(rc));
}
static VALUE receive_aw_callback_cav_template_result(VALUE self) {
  return INT2NUM(aw_instance_callback_set(AW_CALLBACK_CAV_TEMPLATE_RESULT,cav_template_result_callback_hook));
}


VALUE cell_result_callback(VALUE self, VALUE rc) {
  return Qnil;
}
void cell_result_callback_hook(int rc) {
  rb_funcall(ruby_aw_instance(), rb_intern("cell_result_callback"), 1, INT2FIX(rc));
}
static VALUE receive_aw_callback_cell_result(VALUE self) {
  return INT2NUM(aw_instance_callback_set(AW_CALLBACK_CELL_RESULT,cell_result_callback_hook));
}


VALUE citizen_attributes_callback(VALUE self, VALUE rc) {
  return Qnil;
}
void citizen_attributes_callback_hook(int rc) {
  rb_funcall(ruby_aw_instance(), rb_intern("citizen_attributes_callback"), 1, INT2FIX(rc));
}
static VALUE receive_aw_callback_citizen_attributes(VALUE self) {
  return INT2NUM(aw_instance_callback_set(AW_CALLBACK_CITIZEN_ATTRIBUTES,citizen_attributes_callback_hook));
}


VALUE citizen_result_callback(VALUE self, VALUE rc) {
  return Qnil;
}
void citizen_result_callback_hook(int rc) {
  rb_funcall(ruby_aw_instance(), rb_intern("citizen_result_callback"), 1, INT2FIX(rc));
}
static VALUE receive_aw_callback_citizen_result(VALUE self) {
  return INT2NUM(aw_instance_callback_set(AW_CALLBACK_CITIZEN_RESULT,citizen_result_callback_hook));
}


VALUE contact_add_callback(VALUE self, VALUE rc) {
  return Qnil;
}
void contact_add_callback_hook(int rc) {
  rb_funcall(ruby_aw_instance(), rb_intern("contact_add_callback"), 1, INT2FIX(rc));
}
static VALUE receive_aw_callback_contact_add(VALUE self) {
  return INT2NUM(aw_instance_callback_set(AW_CALLBACK_CONTACT_ADD,contact_add_callback_hook));
}


VALUE create_callback(VALUE self, VALUE rc) {
  return Qnil;
}
void create_callback_hook(int rc) {
  rb_funcall(ruby_aw_instance(), rb_intern("create_callback"), 1, INT2FIX(rc));
}
static VALUE receive_aw_callback_create(VALUE self) {
  return INT2NUM(aw_instance_callback_set(AW_CALLBACK_CREATE,create_callback_hook));
}


VALUE delete_all_objects_result_callback(VALUE self, VALUE rc) {
  return Qnil;
}
void delete_all_objects_result_callback_hook(int rc) {
  rb_funcall(ruby_aw_instance(), rb_intern("delete_all_objects_result_callback"), 1, INT2FIX(rc));
}
static VALUE receive_aw_callback_delete_all_objects_result(VALUE self) {
  return INT2NUM(aw_instance_callback_set(AW_CALLBACK_DELETE_ALL_OBJECTS_RESULT,delete_all_objects_result_callback_hook));
}


VALUE enter_callback(VALUE self, VALUE rc) {
  return Qnil;
}
void enter_callback_hook(int rc) {
  rb_funcall(ruby_aw_instance(), rb_intern("enter_callback"), 1, INT2FIX(rc));
}
static VALUE receive_aw_callback_enter(VALUE self) {
  return INT2NUM(aw_instance_callback_set(AW_CALLBACK_ENTER,enter_callback_hook));
}


VALUE hud_result_callback(VALUE self, VALUE rc) {
  return Qnil;
}
void hud_result_callback_hook(int rc) {
  rb_funcall(ruby_aw_instance(), rb_intern("hud_result_callback"), 1, INT2FIX(rc));
}
static VALUE receive_aw_callback_hud_result(VALUE self) {
  return INT2NUM(aw_instance_callback_set(AW_CALLBACK_HUD_RESULT,hud_result_callback_hook));
}


VALUE immigrate_callback(VALUE self, VALUE rc) {
  return Qnil;
}
void immigrate_callback_hook(int rc) {
  rb_funcall(ruby_aw_instance(), rb_intern("immigrate_callback"), 1, INT2FIX(rc));
}
static VALUE receive_aw_callback_immigrate(VALUE self) {
  return INT2NUM(aw_instance_callback_set(AW_CALLBACK_IMMIGRATE,immigrate_callback_hook));
}


VALUE join_callback(VALUE self, VALUE rc) {
  return Qnil;
}
void join_callback_hook(int rc) {
  rb_funcall(ruby_aw_instance(), rb_intern("join_callback"), 1, INT2FIX(rc));
}
static VALUE receive_aw_callback_join(VALUE self) {
  return INT2NUM(aw_instance_callback_set(AW_CALLBACK_JOIN,join_callback_hook));
}


VALUE license_attributes_callback(VALUE self, VALUE rc) {
  return Qnil;
}
void license_attributes_callback_hook(int rc) {
  rb_funcall(ruby_aw_instance(), rb_intern("license_attributes_callback"), 1, INT2FIX(rc));
}
static VALUE receive_aw_callback_license_attributes(VALUE self) {
  return INT2NUM(aw_instance_callback_set(AW_CALLBACK_LICENSE_ATTRIBUTES,license_attributes_callback_hook));
}


VALUE license_result_callback(VALUE self, VALUE rc) {
  return Qnil;
}
void license_result_callback_hook(int rc) {
  rb_funcall(ruby_aw_instance(), rb_intern("license_result_callback"), 1, INT2FIX(rc));
}
static VALUE receive_aw_callback_license_result(VALUE self) {
  return INT2NUM(aw_instance_callback_set(AW_CALLBACK_LICENSE_RESULT,license_result_callback_hook));
}


VALUE login_callback(VALUE self, VALUE rc) {
  return Qnil;
}
void login_callback_hook(int rc) {
  rb_funcall(ruby_aw_instance(), rb_intern("login_callback"), 1, INT2FIX(rc));
}
static VALUE receive_aw_callback_login(VALUE self) {
  return INT2NUM(aw_instance_callback_set(AW_CALLBACK_LOGIN,login_callback_hook));
}


VALUE object_result_callback(VALUE self, VALUE rc) {
  return Qnil;
}
void object_result_callback_hook(int rc) {
  rb_funcall(ruby_aw_instance(), rb_intern("object_result_callback"), 1, INT2FIX(rc));
}
static VALUE receive_aw_callback_object_result(VALUE self) {
  return INT2NUM(aw_instance_callback_set(AW_CALLBACK_OBJECT_RESULT,object_result_callback_hook));
}


VALUE password_send_callback(VALUE self, VALUE rc) {
  return Qnil;
}
void password_send_callback_hook(int rc) {
  rb_funcall(ruby_aw_instance(), rb_intern("password_send_callback"), 1, INT2FIX(rc));
}
static VALUE receive_aw_callback_password_send(VALUE self) {
  return INT2NUM(aw_instance_callback_set(AW_CALLBACK_PASSWORD_SEND,password_send_callback_hook));
}


VALUE query_callback(VALUE self, VALUE rc) {
  return Qnil;
}
void query_callback_hook(int rc) {
  rb_funcall(ruby_aw_instance(), rb_intern("query_callback"), 1, INT2FIX(rc));
}
static VALUE receive_aw_callback_query(VALUE self) {
  return INT2NUM(aw_instance_callback_set(AW_CALLBACK_QUERY,query_callback_hook));
}


VALUE register_callback(VALUE self, VALUE rc) {
  return Qnil;
}
void register_callback_hook(int rc) {
  rb_funcall(ruby_aw_instance(), rb_intern("register_callback"), 1, INT2FIX(rc));
}
static VALUE receive_aw_callback_register(VALUE self) {
  return INT2NUM(aw_instance_callback_set(AW_CALLBACK_REGISTER,register_callback_hook));
}


VALUE reload_registry_callback(VALUE self, VALUE rc) {
  return Qnil;
}
void reload_registry_callback_hook(int rc) {
  rb_funcall(ruby_aw_instance(), rb_intern("reload_registry_callback"), 1, INT2FIX(rc));
}
static VALUE receive_aw_callback_reload_registry(VALUE self) {
  return INT2NUM(aw_instance_callback_set(AW_CALLBACK_RELOAD_REGISTRY,reload_registry_callback_hook));
}


VALUE send_file_callback(VALUE self, VALUE rc) {
  return Qnil;
}
void send_file_callback_hook(int rc) {
  rb_funcall(ruby_aw_instance(), rb_intern("send_file_callback"), 1, INT2FIX(rc));
}
static VALUE receive_aw_callback_send_file(VALUE self) {
  return INT2NUM(aw_instance_callback_set(AW_CALLBACK_SEND_FILE,send_file_callback_hook));
}


VALUE telegram_result_callback(VALUE self, VALUE rc) {
  return Qnil;
}
void telegram_result_callback_hook(int rc) {
  rb_funcall(ruby_aw_instance(), rb_intern("telegram_result_callback"), 1, INT2FIX(rc));
}
static VALUE receive_aw_callback_telegram_result(VALUE self) {
  return INT2NUM(aw_instance_callback_set(AW_CALLBACK_TELEGRAM_RESULT,telegram_result_callback_hook));
}


VALUE terrain_delete_all_result_callback(VALUE self, VALUE rc) {
  return Qnil;
}
void terrain_delete_all_result_callback_hook(int rc) {
  rb_funcall(ruby_aw_instance(), rb_intern("terrain_delete_all_result_callback"), 1, INT2FIX(rc));
}
static VALUE receive_aw_callback_terrain_delete_all_result(VALUE self) {
  return INT2NUM(aw_instance_callback_set(AW_CALLBACK_TERRAIN_DELETE_ALL_RESULT,terrain_delete_all_result_callback_hook));
}


VALUE terrain_load_node_result_callback(VALUE self, VALUE rc) {
  return Qnil;
}
void terrain_load_node_result_callback_hook(int rc) {
  rb_funcall(ruby_aw_instance(), rb_intern("terrain_load_node_result_callback"), 1, INT2FIX(rc));
}
static VALUE receive_aw_callback_terrain_load_node_result(VALUE self) {
  return INT2NUM(aw_instance_callback_set(AW_CALLBACK_TERRAIN_LOAD_NODE_RESULT,terrain_load_node_result_callback_hook));
}


VALUE terrain_next_result_callback(VALUE self, VALUE rc) {
  return Qnil;
}
void terrain_next_result_callback_hook(int rc) {
  rb_funcall(ruby_aw_instance(), rb_intern("terrain_next_result_callback"), 1, INT2FIX(rc));
}
static VALUE receive_aw_callback_terrain_next_result(VALUE self) {
  return INT2NUM(aw_instance_callback_set(AW_CALLBACK_TERRAIN_NEXT_RESULT,terrain_next_result_callback_hook));
}


VALUE terrain_set_result_callback(VALUE self, VALUE rc) {
  return Qnil;
}
void terrain_set_result_callback_hook(int rc) {
  rb_funcall(ruby_aw_instance(), rb_intern("terrain_set_result_callback"), 1, INT2FIX(rc));
}
static VALUE receive_aw_callback_terrain_set_result(VALUE self) {
  return INT2NUM(aw_instance_callback_set(AW_CALLBACK_TERRAIN_SET_RESULT,terrain_set_result_callback_hook));
}


VALUE universe_ejection_callback(VALUE self, VALUE rc) {
  return Qnil;
}
void universe_ejection_callback_hook(int rc) {
  rb_funcall(ruby_aw_instance(), rb_intern("universe_ejection_callback"), 1, INT2FIX(rc));
}
static VALUE receive_aw_callback_universe_ejection(VALUE self) {
  return INT2NUM(aw_instance_callback_set(AW_CALLBACK_UNIVERSE_EJECTION,universe_ejection_callback_hook));
}


VALUE universe_ejection_result_callback(VALUE self, VALUE rc) {
  return Qnil;
}
void universe_ejection_result_callback_hook(int rc) {
  rb_funcall(ruby_aw_instance(), rb_intern("universe_ejection_result_callback"), 1, INT2FIX(rc));
}
static VALUE receive_aw_callback_universe_ejection_result(VALUE self) {
  return INT2NUM(aw_instance_callback_set(AW_CALLBACK_UNIVERSE_EJECTION_RESULT,universe_ejection_result_callback_hook));
}


VALUE user_list_callback(VALUE self, VALUE rc) {
  return Qnil;
}
void user_list_callback_hook(int rc) {
  rb_funcall(ruby_aw_instance(), rb_intern("user_list_callback"), 1, INT2FIX(rc));
}
static VALUE receive_aw_callback_user_list(VALUE self) {
  return INT2NUM(aw_instance_callback_set(AW_CALLBACK_USER_LIST,user_list_callback_hook));
}


VALUE world_ejection_callback(VALUE self, VALUE rc) {
  return Qnil;
}
void world_ejection_callback_hook(int rc) {
  rb_funcall(ruby_aw_instance(), rb_intern("world_ejection_callback"), 1, INT2FIX(rc));
}
static VALUE receive_aw_callback_world_ejection(VALUE self) {
  return INT2NUM(aw_instance_callback_set(AW_CALLBACK_WORLD_EJECTION,world_ejection_callback_hook));
}


VALUE world_ejection_result_callback(VALUE self, VALUE rc) {
  return Qnil;
}
void world_ejection_result_callback_hook(int rc) {
  rb_funcall(ruby_aw_instance(), rb_intern("world_ejection_result_callback"), 1, INT2FIX(rc));
}
static VALUE receive_aw_callback_world_ejection_result(VALUE self) {
  return INT2NUM(aw_instance_callback_set(AW_CALLBACK_WORLD_EJECTION_RESULT,world_ejection_result_callback_hook));
}


VALUE world_instance_callback(VALUE self, VALUE rc) {
  return Qnil;
}
void world_instance_callback_hook(int rc) {
  rb_funcall(ruby_aw_instance(), rb_intern("world_instance_callback"), 1, INT2FIX(rc));
}
static VALUE receive_aw_callback_world_instance(VALUE self) {
  return INT2NUM(aw_instance_callback_set(AW_CALLBACK_WORLD_INSTANCE,world_instance_callback_hook));
}


VALUE world_list_callback(VALUE self, VALUE rc) {
  return Qnil;
}
void world_list_callback_hook(int rc) {
  rb_funcall(ruby_aw_instance(), rb_intern("world_list_callback"), 1, INT2FIX(rc));
}
static VALUE receive_aw_callback_world_list(VALUE self) {
  return INT2NUM(aw_instance_callback_set(AW_CALLBACK_WORLD_LIST,world_list_callback_hook));
}
// END CALLBACKS
#ifdef __cplusplus
extern "C" {
#endif
  void Init_ruby_activeworld() {
    cRubyActiveworld = rb_define_class("RubyActiveworld", rb_cObject);
    rb_define_alloc_func(cRubyActiveworld, ruby_aw_allocate);
    rb_define_method(cRubyActiveworld, "initialize", (VALUE(*)(ANYARGS))ruby_activeworld_initialize, 2);
    // A
    rb_define_method(cRubyActiveworld, "ruby_aw_address", (VALUE(*)(ANYARGS))ruby_aw_address, 1);
    rb_define_method(cRubyActiveworld, "ruby_aw_avatar_click", (VALUE(*)(ANYARGS))ruby_aw_avatar_click, 1);
    rb_define_method(cRubyActiveworld, "ruby_aw_avatar_location", (VALUE(*)(ANYARGS))ruby_aw_avatar_location, 3);
    rb_define_method(cRubyActiveworld, "ruby_aw_avatar_reload", (VALUE(*)(ANYARGS))ruby_aw_avatar_reload, 2);
    rb_define_method(cRubyActiveworld, "ruby_aw_avatar_set", (VALUE(*)(ANYARGS))ruby_aw_avatar_set, 1);
    // B
    rb_define_method(cRubyActiveworld, "ruby_aw_bool", (VALUE(*)(ANYARGS))ruby_aw_bool, 1);
    rb_define_method(cRubyActiveworld, "ruby_aw_bool_set", (VALUE(*)(ANYARGS))ruby_aw_bool_set, 2);
    rb_define_method(cRubyActiveworld, "ruby_aw_botgram_send", (VALUE(*)(ANYARGS))ruby_aw_botgram_send, 0);
    rb_define_method(cRubyActiveworld, "ruby_aw_botmenu_send", (VALUE(*)(ANYARGS))ruby_aw_botmenu_send, 0);
    // C
    // callbacks not implemented this way
    rb_define_method(cRubyActiveworld, "ruby_aw_camera_set", (VALUE(*)(ANYARGS))ruby_aw_camera_set, 1);
    rb_define_method(cRubyActiveworld, "ruby_aw_cell_next", (VALUE(*)(ANYARGS))ruby_aw_cell_next, 0);
    rb_define_method(cRubyActiveworld, "ruby_aw_check_right", (VALUE(*)(ANYARGS))ruby_aw_check_right, 2);
    rb_define_method(cRubyActiveworld, "ruby_aw_check_right_all", (VALUE(*)(ANYARGS))ruby_aw_check_right_all, 1);
    rb_define_method(cRubyActiveworld, "ruby_aw_citizen_attributes_by_name", (VALUE(*)(ANYARGS))ruby_aw_citizen_attributes_by_name, 1);
    rb_define_method(cRubyActiveworld, "ruby_aw_citizen_attributes_by_number", (VALUE(*)(ANYARGS))ruby_aw_citizen_attributes_by_number, 1);
    rb_define_method(cRubyActiveworld, "ruby_aw_citizen_add", (VALUE(*)(ANYARGS))ruby_aw_citizen_add, 0);
    rb_define_method(cRubyActiveworld, "ruby_aw_citizen_change", (VALUE(*)(ANYARGS))ruby_aw_citizen_change, 0);
    rb_define_method(cRubyActiveworld, "ruby_aw_citizen_delete", (VALUE(*)(ANYARGS))ruby_aw_citizen_delete, 1);
    rb_define_method(cRubyActiveworld, "ruby_aw_citizen_next", (VALUE(*)(ANYARGS))ruby_aw_citizen_next, 0);
    rb_define_method(cRubyActiveworld, "ruby_aw_citizen_previous", (VALUE(*)(ANYARGS))ruby_aw_citizen_previous, 0);
    rb_define_method(cRubyActiveworld, "ruby_aw_console_message", (VALUE(*)(ANYARGS))ruby_aw_console_message, 1);

    // D
    rb_define_method(cRubyActiveworld, "ruby_aw_data", (VALUE(*)(ANYARGS))ruby_aw_data, 1);
    rb_define_method(cRubyActiveworld, "ruby_aw_data_set", (VALUE(*)(ANYARGS))ruby_aw_data, 2);  
    rb_define_method(cRubyActiveworld, "ruby_aw_delete_all_objects", (VALUE(*)(ANYARGS))ruby_aw_delete_all_objects, 0);
    rb_define_method(cRubyActiveworld, "ruby_aw_destroy", (VALUE(*)(ANYARGS))ruby_aw_destroy, 0);
    // E
    rb_define_method(cRubyActiveworld, "ruby_aw_enter", (VALUE(*)(ANYARGS))ruby_aw_enter, 1);
    rb_define_method(cRubyActiveworld, "ruby_aw_exit", (VALUE(*)(ANYARGS))ruby_aw_exit, 0);
    // F
    rb_define_method(cRubyActiveworld, "ruby_aw_float", (VALUE(*)(ANYARGS))ruby_aw_float, 1);
    rb_define_method(cRubyActiveworld, "ruby_aw_float_set", (VALUE(*)(ANYARGS))ruby_aw_float_set, 2);
    // I
    rb_define_singleton_method(cRubyActiveworld, "ruby_aw_init", (VALUE(*)(ANYARGS))ruby_aw_init, 1);
    rb_define_method(cRubyActiveworld, "ruby_aw_instance_set", (VALUE(*)(ANYARGS))ruby_aw_instance_set, 1);
    rb_define_method(cRubyActiveworld, "ruby_aw_int", (VALUE(*)(ANYARGS))ruby_aw_int, 1);
    rb_define_method(cRubyActiveworld, "ruby_aw_int_set", (VALUE(*)(ANYARGS))ruby_aw_int_set, 2);
    // H
    rb_define_method(cRubyActiveworld, "ruby_aw_has_world_right", (VALUE(*)(ANYARGS))ruby_aw_has_world_right, 2);
    rb_define_method(cRubyActiveworld, "ruby_aw_has_world_right_all", (VALUE(*)(ANYARGS))ruby_aw_has_world_right_all, 1);
    rb_define_method(cRubyActiveworld, "ruby_aw_hud_clear", (VALUE(*)(ANYARGS))ruby_aw_hud_clear, 1);
    rb_define_method(cRubyActiveworld, "ruby_aw_hud_click", (VALUE(*)(ANYARGS))ruby_aw_hud_click, 0);
    rb_define_method(cRubyActiveworld, "ruby_aw_hud_create", (VALUE(*)(ANYARGS))ruby_aw_hud_create, 0);
    rb_define_method(cRubyActiveworld, "ruby_aw_hud_destroy", (VALUE(*)(ANYARGS))ruby_aw_hud_destroy, 2);
    // L
    rb_define_method(cRubyActiveworld, "ruby_aw_login", (VALUE(*)(ANYARGS))ruby_aw_login, 0);
    rb_define_method(cRubyActiveworld, "ruby_aw_license_add", (VALUE(*)(ANYARGS))ruby_aw_license_add, 0);
    rb_define_method(cRubyActiveworld, "ruby_aw_license_attributes", (VALUE(*)(ANYARGS))ruby_aw_license_attributes, 1);
    rb_define_method(cRubyActiveworld, "ruby_aw_license_change", (VALUE(*)(ANYARGS))ruby_aw_license_change, 0);
    rb_define_method(cRubyActiveworld, "ruby_aw_license_delete", (VALUE(*)(ANYARGS))ruby_aw_license_delete, 1);
    rb_define_method(cRubyActiveworld, "ruby_aw_license_next", (VALUE(*)(ANYARGS))ruby_aw_license_next, 0);
    rb_define_method(cRubyActiveworld, "ruby_aw_license_previous", (VALUE(*)(ANYARGS))ruby_aw_license_previous, 0);
    // M
    rb_define_method(cRubyActiveworld, "ruby_aw_mover_links", (VALUE(*)(ANYARGS))ruby_aw_mover_links, 1);
    rb_define_method(cRubyActiveworld, "ruby_aw_mover_rider_add", (VALUE(*)(ANYARGS))ruby_aw_mover_rider_add, 7);
    rb_define_method(cRubyActiveworld, "ruby_aw_mover_rider_change", (VALUE(*)(ANYARGS))ruby_aw_mover_rider_change, 7);
    rb_define_method(cRubyActiveworld, "ruby_aw_mover_rider_delete", (VALUE(*)(ANYARGS))ruby_aw_mover_rider_delete, 2);
    rb_define_method(cRubyActiveworld, "ruby_aw_mover_set_position", (VALUE(*)(ANYARGS))ruby_aw_mover_set_position, 7);
    rb_define_method(cRubyActiveworld, "ruby_aw_mover_set_state", (VALUE(*)(ANYARGS))ruby_aw_mover_set_state, 3);
    // N
    rb_define_method(cRubyActiveworld, "ruby_aw_noise", (VALUE(*)(ANYARGS))ruby_aw_noise, 1);
    // O
    rb_define_method(cRubyActiveworld, "ruby_aw_object_add", (VALUE(*)(ANYARGS))ruby_aw_object_add, 0);
    rb_define_method(cRubyActiveworld, "ruby_aw_object_bump", (VALUE(*)(ANYARGS))ruby_aw_object_bump, 0);
    rb_define_method(cRubyActiveworld, "ruby_aw_object_change", (VALUE(*)(ANYARGS))ruby_aw_object_change, 0);
    rb_define_method(cRubyActiveworld, "ruby_aw_object_click", (VALUE(*)(ANYARGS))ruby_aw_object_click, 0);
    rb_define_method(cRubyActiveworld, "ruby_aw_object_delete", (VALUE(*)(ANYARGS))ruby_aw_object_delete, 0);
    rb_define_method(cRubyActiveworld, "ruby_aw_object_load", (VALUE(*)(ANYARGS))ruby_aw_object_load, 0);
    rb_define_method(cRubyActiveworld, "ruby_aw_object_select", (VALUE(*)(ANYARGS))ruby_aw_object_select, 0);
    // R
    rb_define_method(cRubyActiveworld, "ruby_aw_random", (VALUE(*)(ANYARGS))ruby_aw_random, 0);
    // S
    rb_define_method(cRubyActiveworld, "ruby_aw_say", (VALUE(*)(ANYARGS))ruby_aw_say, 1);
    rb_define_method(cRubyActiveworld, "ruby_aw_sector_from_cell", (VALUE(*)(ANYARGS))ruby_aw_sector_from_cell, 1);
    rb_define_method(cRubyActiveworld, "ruby_aw_session", (VALUE(*)(ANYARGS))ruby_aw_session, 0);
    rb_define_method(cRubyActiveworld, "ruby_aw_state_change", (VALUE(*)(ANYARGS))ruby_aw_state_change, 0);
    rb_define_method(cRubyActiveworld, "ruby_aw_string", (VALUE(*)(ANYARGS))ruby_aw_string, 1);
    rb_define_method(cRubyActiveworld, "ruby_aw_string_set", (VALUE(*)(ANYARGS))ruby_aw_string_set, 2);
    // T
    rb_define_method(cRubyActiveworld, "ruby_aw_teleport", (VALUE(*)(ANYARGS))ruby_aw_teleport, 1);
    rb_define_singleton_method(cRubyActiveworld, "ruby_aw_term", (VALUE(*)(ANYARGS))ruby_aw_term, 0);
    rb_define_method(cRubyActiveworld, "ruby_aw_terrain_delete_all", (VALUE(*)(ANYARGS))ruby_aw_terrain_delete_all, 0);
    rb_define_method(cRubyActiveworld, "ruby_aw_terrain_load_node", (VALUE(*)(ANYARGS))ruby_aw_terrain_load_node, 0);
    rb_define_method(cRubyActiveworld, "ruby_aw_terrain_next", (VALUE(*)(ANYARGS))ruby_aw_terrain_next, 0);
    rb_define_method(cRubyActiveworld, "ruby_aw_tick", (VALUE(*)(ANYARGS))ruby_aw_tick, 0);
//    rb_define_method(cRubyActiveworld, "ruby_aw_toolbar_click", (VALUE(*)(ANYARGS))ruby_aw_toolbar_click, 0);
    // U
    rb_define_method(cRubyActiveworld, "ruby_aw_universe_attributes_change", (VALUE(*)(ANYARGS))ruby_aw_universe_attributes_change, 0);
    rb_define_method(cRubyActiveworld, "ruby_aw_universe_ejection_add", (VALUE(*)(ANYARGS))ruby_aw_universe_ejection_add, 0);
    rb_define_method(cRubyActiveworld, "ruby_aw_universe_ejection_delete", (VALUE(*)(ANYARGS))ruby_aw_universe_ejection_delete, 1);
    rb_define_method(cRubyActiveworld, "ruby_aw_universe_ejection_lookup", (VALUE(*)(ANYARGS))ruby_aw_universe_ejection_lookup, 0);
    rb_define_method(cRubyActiveworld, "ruby_aw_universe_ejection_next", (VALUE(*)(ANYARGS))ruby_aw_universe_ejection_next, 0);
    rb_define_method(cRubyActiveworld, "ruby_aw_universe_ejection_previous", (VALUE(*)(ANYARGS))ruby_aw_universe_ejection_previous, 0);
    rb_define_method(cRubyActiveworld, "ruby_aw_url_send", (VALUE(*)(ANYARGS))ruby_aw_url_send, 3);
    rb_define_method(cRubyActiveworld, "ruby_aw_user_list", (VALUE(*)(ANYARGS))ruby_aw_user_list, 0);
    // W
    rb_define_singleton_method(cRubyActiveworld, "ruby_aw_wait", (VALUE(*)(ANYARGS))ruby_aw_wait, 1);
    rb_define_method(cRubyActiveworld, "ruby_aw_whisper", (VALUE(*)(ANYARGS))ruby_aw_whisper, 2);
    rb_define_method(cRubyActiveworld, "ruby_aw_world_attribute_get", (VALUE(*)(ANYARGS))ruby_aw_world_attribute_get, 1);
    rb_define_method(cRubyActiveworld, "ruby_aw_world_attribute_set", (VALUE(*)(ANYARGS))ruby_aw_world_attribute_set, 2);
    rb_define_method(cRubyActiveworld, "ruby_aw_world_attributes_change", (VALUE(*)(ANYARGS))ruby_aw_world_attributes_change, 0);
    rb_define_method(cRubyActiveworld, "ruby_aw_world_attributes_reset", (VALUE(*)(ANYARGS))ruby_aw_world_attributes_reset, 0);
    rb_define_method(cRubyActiveworld, "ruby_aw_world_attributes_send", (VALUE(*)(ANYARGS))ruby_aw_world_attributes_send, 1);
    rb_define_method(cRubyActiveworld, "ruby_aw_world_eject", (VALUE(*)(ANYARGS))ruby_aw_world_eject, 0);
    rb_define_method(cRubyActiveworld, "ruby_aw_world_ejection_add", (VALUE(*)(ANYARGS))ruby_aw_world_ejection_add, 0);
    rb_define_method(cRubyActiveworld, "ruby_aw_world_ejection_delete", (VALUE(*)(ANYARGS))ruby_aw_world_ejection_delete, 0);
    rb_define_method(cRubyActiveworld, "ruby_aw_world_ejection_lookup", (VALUE(*)(ANYARGS))ruby_aw_world_ejection_lookup, 0);
    rb_define_method(cRubyActiveworld, "ruby_aw_world_ejection_next", (VALUE(*)(ANYARGS))ruby_aw_world_ejection_next, 0);
    rb_define_method(cRubyActiveworld, "ruby_aw_world_ejection_previous", (VALUE(*)(ANYARGS))ruby_aw_world_ejection_previous, 0);
    rb_define_method(cRubyActiveworld, "ruby_aw_world_instance_get", (VALUE(*)(ANYARGS))ruby_aw_world_instance_get, 1);
    rb_define_method(cRubyActiveworld, "ruby_aw_world_instance_set", (VALUE(*)(ANYARGS))ruby_aw_world_instance_set, 2);
    rb_define_method(cRubyActiveworld, "ruby_aw_world_list", (VALUE(*)(ANYARGS))ruby_aw_world_list, 0);
    rb_define_method(cRubyActiveworld, "ruby_aw_world_reload_registry", (VALUE(*)(ANYARGS))ruby_aw_world_reload_registry, 0);

    // NEW ONES
    rb_define_method(cRubyActiveworld, "admin_world_delete_event_callback",(VALUE(*)(ANYARGS))admin_world_delete_event_callback,0);
    rb_define_method(cRubyActiveworld, "receive_aw_event_admin_world_delete",(VALUE(*)(ANYARGS))receive_aw_event_admin_world_delete,0);
    rb_define_method(cRubyActiveworld, "admin_world_info_event_callback",(VALUE(*)(ANYARGS))admin_world_info_event_callback,0);
    rb_define_method(cRubyActiveworld, "receive_aw_event_admin_world_info",(VALUE(*)(ANYARGS))receive_aw_event_admin_world_info,0);
    rb_define_method(cRubyActiveworld, "avatar_add_event_callback",(VALUE(*)(ANYARGS))avatar_add_event_callback,0);
    rb_define_method(cRubyActiveworld, "receive_aw_event_avatar_add",(VALUE(*)(ANYARGS))receive_aw_event_avatar_add,0);
    rb_define_method(cRubyActiveworld, "avatar_change_event_callback",(VALUE(*)(ANYARGS))avatar_change_event_callback,0);
    rb_define_method(cRubyActiveworld, "receive_aw_event_avatar_change",(VALUE(*)(ANYARGS))receive_aw_event_avatar_change,0);
    rb_define_method(cRubyActiveworld, "avatar_click_event_callback",(VALUE(*)(ANYARGS))avatar_click_event_callback,0);
    rb_define_method(cRubyActiveworld, "receive_aw_event_avatar_click",(VALUE(*)(ANYARGS))receive_aw_event_avatar_click,0);
    rb_define_method(cRubyActiveworld, "avatar_delete_event_callback",(VALUE(*)(ANYARGS))avatar_delete_event_callback,0);
    rb_define_method(cRubyActiveworld, "receive_aw_event_avatar_delete",(VALUE(*)(ANYARGS))receive_aw_event_avatar_delete,0);
    rb_define_method(cRubyActiveworld, "avatar_reload_event_callback",(VALUE(*)(ANYARGS))avatar_reload_event_callback,0);
    rb_define_method(cRubyActiveworld, "receive_aw_event_avatar_reload",(VALUE(*)(ANYARGS))receive_aw_event_avatar_reload,0);
    rb_define_method(cRubyActiveworld, "botgram_event_callback",(VALUE(*)(ANYARGS))botgram_event_callback,0);
    rb_define_method(cRubyActiveworld, "receive_aw_event_botgram",(VALUE(*)(ANYARGS))receive_aw_event_botgram,0);
    rb_define_method(cRubyActiveworld, "botmenu_event_callback",(VALUE(*)(ANYARGS))botmenu_event_callback,0);
    rb_define_method(cRubyActiveworld, "receive_aw_event_botmenu",(VALUE(*)(ANYARGS))receive_aw_event_botmenu,0);
    rb_define_method(cRubyActiveworld, "camera_event_callback",(VALUE(*)(ANYARGS))camera_event_callback,0);
    rb_define_method(cRubyActiveworld, "receive_aw_event_camera",(VALUE(*)(ANYARGS))receive_aw_event_camera,0);
    rb_define_method(cRubyActiveworld, "cell_begin_event_callback",(VALUE(*)(ANYARGS))cell_begin_event_callback,0);
    rb_define_method(cRubyActiveworld, "receive_aw_event_cell_begin",(VALUE(*)(ANYARGS))receive_aw_event_cell_begin,0);
    rb_define_method(cRubyActiveworld, "cell_end_event_callback",(VALUE(*)(ANYARGS))cell_end_event_callback,0);
    rb_define_method(cRubyActiveworld, "receive_aw_event_cell_end",(VALUE(*)(ANYARGS))receive_aw_event_cell_end,0);
    rb_define_method(cRubyActiveworld, "cell_object_event_callback",(VALUE(*)(ANYARGS))cell_object_event_callback,0);
    rb_define_method(cRubyActiveworld, "receive_aw_event_cell_object",(VALUE(*)(ANYARGS))receive_aw_event_cell_object,0);
    rb_define_method(cRubyActiveworld, "chat_event_callback",(VALUE(*)(ANYARGS))chat_event_callback,0);
    rb_define_method(cRubyActiveworld, "receive_aw_event_chat",(VALUE(*)(ANYARGS))receive_aw_event_chat,0);
    rb_define_method(cRubyActiveworld, "console_message_event_callback",(VALUE(*)(ANYARGS))console_message_event_callback,0);
    rb_define_method(cRubyActiveworld, "receive_aw_event_console_message",(VALUE(*)(ANYARGS))receive_aw_event_console_message,0);
    rb_define_method(cRubyActiveworld, "contact_state_event_callback",(VALUE(*)(ANYARGS))contact_state_event_callback,0);
    rb_define_method(cRubyActiveworld, "receive_aw_event_contact_state",(VALUE(*)(ANYARGS))receive_aw_event_contact_state,0);
    rb_define_method(cRubyActiveworld, "entity_add_event_callback",(VALUE(*)(ANYARGS))entity_add_event_callback,0);
    rb_define_method(cRubyActiveworld, "receive_aw_event_entity_add",(VALUE(*)(ANYARGS))receive_aw_event_entity_add,0);
    rb_define_method(cRubyActiveworld, "entity_change_event_callback",(VALUE(*)(ANYARGS))entity_change_event_callback,0);
    rb_define_method(cRubyActiveworld, "receive_aw_event_entity_change",(VALUE(*)(ANYARGS))receive_aw_event_entity_change,0);
    rb_define_method(cRubyActiveworld, "entity_delete_event_callback",(VALUE(*)(ANYARGS))entity_delete_event_callback,0);
    rb_define_method(cRubyActiveworld, "receive_aw_event_entity_delete",(VALUE(*)(ANYARGS))receive_aw_event_entity_delete,0);
    rb_define_method(cRubyActiveworld, "entity_links_event_callback",(VALUE(*)(ANYARGS))entity_links_event_callback,0);
    rb_define_method(cRubyActiveworld, "receive_aw_event_entity_links",(VALUE(*)(ANYARGS))receive_aw_event_entity_links,0);
    rb_define_method(cRubyActiveworld, "entity_rider_add_event_callback",(VALUE(*)(ANYARGS))entity_rider_add_event_callback,0);
    rb_define_method(cRubyActiveworld, "receive_aw_event_entity_rider_add",(VALUE(*)(ANYARGS))receive_aw_event_entity_rider_add,0);
    rb_define_method(cRubyActiveworld, "entity_rider_change_event_callback",(VALUE(*)(ANYARGS))entity_rider_change_event_callback,0);
    rb_define_method(cRubyActiveworld, "receive_aw_event_entity_rider_change",(VALUE(*)(ANYARGS))receive_aw_event_entity_rider_change,0);
    rb_define_method(cRubyActiveworld, "entity_rider_delete_event_callback",(VALUE(*)(ANYARGS))entity_rider_delete_event_callback,0);
    rb_define_method(cRubyActiveworld, "receive_aw_event_entity_rider_delete",(VALUE(*)(ANYARGS))receive_aw_event_entity_rider_delete,0);
    rb_define_method(cRubyActiveworld, "hud_clear_event_callback",(VALUE(*)(ANYARGS))hud_clear_event_callback,0);
    rb_define_method(cRubyActiveworld, "receive_aw_event_hud_clear",(VALUE(*)(ANYARGS))receive_aw_event_hud_clear,0);
    rb_define_method(cRubyActiveworld, "hud_click_event_callback",(VALUE(*)(ANYARGS))hud_click_event_callback,0);
    rb_define_method(cRubyActiveworld, "receive_aw_event_hud_click",(VALUE(*)(ANYARGS))receive_aw_event_hud_click,0);
    rb_define_method(cRubyActiveworld, "hud_create_event_callback",(VALUE(*)(ANYARGS))hud_create_event_callback,0);
    rb_define_method(cRubyActiveworld, "receive_aw_event_hud_create",(VALUE(*)(ANYARGS))receive_aw_event_hud_create,0);
    rb_define_method(cRubyActiveworld, "hud_destroy_event_callback",(VALUE(*)(ANYARGS))hud_destroy_event_callback,0);
    rb_define_method(cRubyActiveworld, "receive_aw_event_hud_destroy",(VALUE(*)(ANYARGS))receive_aw_event_hud_destroy,0);
    rb_define_method(cRubyActiveworld, "join_event_callback",(VALUE(*)(ANYARGS))join_event_callback,0);
    rb_define_method(cRubyActiveworld, "receive_aw_event_join",(VALUE(*)(ANYARGS))receive_aw_event_join,0);
    rb_define_method(cRubyActiveworld, "noise_event_callback",(VALUE(*)(ANYARGS))noise_event_callback,0);
    rb_define_method(cRubyActiveworld, "receive_aw_event_noise",(VALUE(*)(ANYARGS))receive_aw_event_noise,0);
    rb_define_method(cRubyActiveworld, "object_add_event_callback",(VALUE(*)(ANYARGS))object_add_event_callback,0);
    rb_define_method(cRubyActiveworld, "receive_aw_event_object_add",(VALUE(*)(ANYARGS))receive_aw_event_object_add,0);
    rb_define_method(cRubyActiveworld, "object_bump_event_callback",(VALUE(*)(ANYARGS))object_bump_event_callback,0);
    rb_define_method(cRubyActiveworld, "receive_aw_event_object_bump",(VALUE(*)(ANYARGS))receive_aw_event_object_bump,0);
    rb_define_method(cRubyActiveworld, "object_click_event_callback",(VALUE(*)(ANYARGS))object_click_event_callback,0);
    rb_define_method(cRubyActiveworld, "receive_aw_event_object_click",(VALUE(*)(ANYARGS))receive_aw_event_object_click,0);
    rb_define_method(cRubyActiveworld, "object_delete_event_callback",(VALUE(*)(ANYARGS))object_delete_event_callback,0);
    rb_define_method(cRubyActiveworld, "receive_aw_event_object_delete",(VALUE(*)(ANYARGS))receive_aw_event_object_delete,0);
    rb_define_method(cRubyActiveworld, "object_select_event_callback",(VALUE(*)(ANYARGS))object_select_event_callback,0);
    rb_define_method(cRubyActiveworld, "receive_aw_event_object_select",(VALUE(*)(ANYARGS))receive_aw_event_object_select,0);
    rb_define_method(cRubyActiveworld, "send_file_event_callback",(VALUE(*)(ANYARGS))send_file_event_callback,0);
    rb_define_method(cRubyActiveworld, "receive_aw_event_send_file",(VALUE(*)(ANYARGS))receive_aw_event_send_file,0);
    rb_define_method(cRubyActiveworld, "telegram_event_callback",(VALUE(*)(ANYARGS))telegram_event_callback,0);
    rb_define_method(cRubyActiveworld, "receive_aw_event_telegram",(VALUE(*)(ANYARGS))receive_aw_event_telegram,0);
    rb_define_method(cRubyActiveworld, "teleport_event_callback",(VALUE(*)(ANYARGS))teleport_event_callback,0);
    rb_define_method(cRubyActiveworld, "receive_aw_event_teleport",(VALUE(*)(ANYARGS))receive_aw_event_teleport,0);
    rb_define_method(cRubyActiveworld, "terrain_begin_event_callback",(VALUE(*)(ANYARGS))terrain_begin_event_callback,0);
    rb_define_method(cRubyActiveworld, "receive_aw_event_terrain_begin",(VALUE(*)(ANYARGS))receive_aw_event_terrain_begin,0);
    rb_define_method(cRubyActiveworld, "terrain_changed_event_callback",(VALUE(*)(ANYARGS))terrain_changed_event_callback,0);
    rb_define_method(cRubyActiveworld, "receive_aw_event_terrain_changed",(VALUE(*)(ANYARGS))receive_aw_event_terrain_changed,0);
    rb_define_method(cRubyActiveworld, "terrain_data_event_callback",(VALUE(*)(ANYARGS))terrain_data_event_callback,0);
    rb_define_method(cRubyActiveworld, "receive_aw_event_terrain_data",(VALUE(*)(ANYARGS))receive_aw_event_terrain_data,0);
    rb_define_method(cRubyActiveworld, "terrain_end_event_callback",(VALUE(*)(ANYARGS))terrain_end_event_callback,0);
    rb_define_method(cRubyActiveworld, "receive_aw_event_terrain_end",(VALUE(*)(ANYARGS))receive_aw_event_terrain_end,0);
    rb_define_method(cRubyActiveworld, "toolbar_click_event_callback",(VALUE(*)(ANYARGS))toolbar_click_event_callback,0);
    rb_define_method(cRubyActiveworld, "receive_aw_event_toolbar_click",(VALUE(*)(ANYARGS))receive_aw_event_toolbar_click,0);
    rb_define_method(cRubyActiveworld, "universe_attributes_event_callback",(VALUE(*)(ANYARGS))universe_attributes_event_callback,0);
    rb_define_method(cRubyActiveworld, "receive_aw_event_universe_attributes",(VALUE(*)(ANYARGS))receive_aw_event_universe_attributes,0);
    rb_define_method(cRubyActiveworld, "universe_disconnect_event_callback",(VALUE(*)(ANYARGS))universe_disconnect_event_callback,0);
    rb_define_method(cRubyActiveworld, "receive_aw_event_universe_disconnect",(VALUE(*)(ANYARGS))receive_aw_event_universe_disconnect,0);
    rb_define_method(cRubyActiveworld, "url_event_callback",(VALUE(*)(ANYARGS))url_event_callback,0);
    rb_define_method(cRubyActiveworld, "receive_aw_event_url",(VALUE(*)(ANYARGS))receive_aw_event_url,0);
    rb_define_method(cRubyActiveworld, "url_click_event_callback",(VALUE(*)(ANYARGS))url_click_event_callback,0);
    rb_define_method(cRubyActiveworld, "receive_aw_event_url_click",(VALUE(*)(ANYARGS))receive_aw_event_url_click,0);
    rb_define_method(cRubyActiveworld, "user_info_event_callback",(VALUE(*)(ANYARGS))user_info_event_callback,0);
    rb_define_method(cRubyActiveworld, "receive_aw_event_user_info",(VALUE(*)(ANYARGS))receive_aw_event_user_info,0);
    rb_define_method(cRubyActiveworld, "voip_data_event_callback",(VALUE(*)(ANYARGS))voip_data_event_callback,0);
    rb_define_method(cRubyActiveworld, "receive_aw_event_voip_data",(VALUE(*)(ANYARGS))receive_aw_event_voip_data,0);
    rb_define_method(cRubyActiveworld, "world_attributes_event_callback",(VALUE(*)(ANYARGS))world_attributes_event_callback,0);
    rb_define_method(cRubyActiveworld, "receive_aw_event_world_attributes",(VALUE(*)(ANYARGS))receive_aw_event_world_attributes,0);
    rb_define_method(cRubyActiveworld, "world_disconnect_event_callback",(VALUE(*)(ANYARGS))world_disconnect_event_callback,0);
    rb_define_method(cRubyActiveworld, "receive_aw_event_world_disconnect",(VALUE(*)(ANYARGS))receive_aw_event_world_disconnect,0);
    rb_define_method(cRubyActiveworld, "world_info_event_callback",(VALUE(*)(ANYARGS))world_info_event_callback,0);
    rb_define_method(cRubyActiveworld, "receive_aw_event_world_info",(VALUE(*)(ANYARGS))receive_aw_event_world_info,0);
    rb_define_method(cRubyActiveworld, "address_callback",(VALUE(*)(ANYARGS))address_callback,1);
    rb_define_method(cRubyActiveworld, "receive_aw_callback_address",(VALUE(*)(ANYARGS))receive_aw_callback_address,1);
    rb_define_method(cRubyActiveworld, "admin_callback",(VALUE(*)(ANYARGS))admin_callback,1);
    rb_define_method(cRubyActiveworld, "receive_aw_callback_admin",(VALUE(*)(ANYARGS))receive_aw_callback_admin,1);
    rb_define_method(cRubyActiveworld, "admin_world_list_callback",(VALUE(*)(ANYARGS))admin_world_list_callback,1);
    rb_define_method(cRubyActiveworld, "receive_aw_callback_admin_world_list",(VALUE(*)(ANYARGS))receive_aw_callback_admin_world_list,1);
    rb_define_method(cRubyActiveworld, "admin_world_result_callback",(VALUE(*)(ANYARGS))admin_world_result_callback,1);
    rb_define_method(cRubyActiveworld, "receive_aw_callback_admin_world_result",(VALUE(*)(ANYARGS))receive_aw_callback_admin_world_result,1);
    rb_define_method(cRubyActiveworld, "attributes_reset_result_callback",(VALUE(*)(ANYARGS))attributes_reset_result_callback,1);
    rb_define_method(cRubyActiveworld, "receive_aw_callback_attributes_reset_result",(VALUE(*)(ANYARGS))receive_aw_callback_attributes_reset_result,1);
    rb_define_method(cRubyActiveworld, "avatar_location_callback",(VALUE(*)(ANYARGS))avatar_location_callback,1);
    rb_define_method(cRubyActiveworld, "receive_aw_callback_avatar_location",(VALUE(*)(ANYARGS))receive_aw_callback_avatar_location,1);
    rb_define_method(cRubyActiveworld, "botgram_result_callback",(VALUE(*)(ANYARGS))botgram_result_callback,1);
    rb_define_method(cRubyActiveworld, "receive_aw_callback_botgram_result",(VALUE(*)(ANYARGS))receive_aw_callback_botgram_result,1);
    rb_define_method(cRubyActiveworld, "botmenu_result_callback",(VALUE(*)(ANYARGS))botmenu_result_callback,1);
    rb_define_method(cRubyActiveworld, "receive_aw_callback_botmenu_result",(VALUE(*)(ANYARGS))receive_aw_callback_botmenu_result,1);
    rb_define_method(cRubyActiveworld, "cav_callback",(VALUE(*)(ANYARGS))cav_callback,1);
    rb_define_method(cRubyActiveworld, "receive_aw_callback_cav",(VALUE(*)(ANYARGS))receive_aw_callback_cav,1);
    rb_define_method(cRubyActiveworld, "cav_result_callback",(VALUE(*)(ANYARGS))cav_result_callback,1);
    rb_define_method(cRubyActiveworld, "receive_aw_callback_cav_result",(VALUE(*)(ANYARGS))receive_aw_callback_cav_result,1);
    rb_define_method(cRubyActiveworld, "cav_template_callback",(VALUE(*)(ANYARGS))cav_template_callback,1);
    rb_define_method(cRubyActiveworld, "receive_aw_callback_cav_template",(VALUE(*)(ANYARGS))receive_aw_callback_cav_template,1);
    rb_define_method(cRubyActiveworld, "cav_template_result_callback",(VALUE(*)(ANYARGS))cav_template_result_callback,1);
    rb_define_method(cRubyActiveworld, "receive_aw_callback_cav_template_result",(VALUE(*)(ANYARGS))receive_aw_callback_cav_template_result,1);
    rb_define_method(cRubyActiveworld, "cell_result_callback",(VALUE(*)(ANYARGS))cell_result_callback,1);
    rb_define_method(cRubyActiveworld, "receive_aw_callback_cell_result",(VALUE(*)(ANYARGS))receive_aw_callback_cell_result,1);
    rb_define_method(cRubyActiveworld, "citizen_attributes_callback",(VALUE(*)(ANYARGS))citizen_attributes_callback,1);
    rb_define_method(cRubyActiveworld, "receive_aw_callback_citizen_attributes",(VALUE(*)(ANYARGS))receive_aw_callback_citizen_attributes,1);
    rb_define_method(cRubyActiveworld, "citizen_result_callback",(VALUE(*)(ANYARGS))citizen_result_callback,1);
    rb_define_method(cRubyActiveworld, "receive_aw_callback_citizen_result",(VALUE(*)(ANYARGS))receive_aw_callback_citizen_result,1);
    rb_define_method(cRubyActiveworld, "contact_add_callback",(VALUE(*)(ANYARGS))contact_add_callback,1);
    rb_define_method(cRubyActiveworld, "receive_aw_callback_contact_add",(VALUE(*)(ANYARGS))receive_aw_callback_contact_add,1);
    rb_define_method(cRubyActiveworld, "create_callback",(VALUE(*)(ANYARGS))create_callback,1);
    rb_define_method(cRubyActiveworld, "receive_aw_callback_create",(VALUE(*)(ANYARGS))receive_aw_callback_create,1);
    rb_define_method(cRubyActiveworld, "delete_all_objects_result_callback",(VALUE(*)(ANYARGS))delete_all_objects_result_callback,1);
    rb_define_method(cRubyActiveworld, "receive_aw_callback_delete_all_objects_result",(VALUE(*)(ANYARGS))receive_aw_callback_delete_all_objects_result,1);
    rb_define_method(cRubyActiveworld, "enter_callback",(VALUE(*)(ANYARGS))enter_callback,1);
    rb_define_method(cRubyActiveworld, "receive_aw_callback_enter",(VALUE(*)(ANYARGS))receive_aw_callback_enter,1);
    rb_define_method(cRubyActiveworld, "hud_result_callback",(VALUE(*)(ANYARGS))hud_result_callback,1);
    rb_define_method(cRubyActiveworld, "receive_aw_callback_hud_result",(VALUE(*)(ANYARGS))receive_aw_callback_hud_result,1);
    rb_define_method(cRubyActiveworld, "immigrate_callback",(VALUE(*)(ANYARGS))immigrate_callback,1);
    rb_define_method(cRubyActiveworld, "receive_aw_callback_immigrate",(VALUE(*)(ANYARGS))receive_aw_callback_immigrate,1);
    rb_define_method(cRubyActiveworld, "join_callback",(VALUE(*)(ANYARGS))join_callback,1);
    rb_define_method(cRubyActiveworld, "receive_aw_callback_join",(VALUE(*)(ANYARGS))receive_aw_callback_join,1);
    rb_define_method(cRubyActiveworld, "license_attributes_callback",(VALUE(*)(ANYARGS))license_attributes_callback,1);
    rb_define_method(cRubyActiveworld, "receive_aw_callback_license_attributes",(VALUE(*)(ANYARGS))receive_aw_callback_license_attributes,1);
    rb_define_method(cRubyActiveworld, "license_result_callback",(VALUE(*)(ANYARGS))license_result_callback,1);
    rb_define_method(cRubyActiveworld, "receive_aw_callback_license_result",(VALUE(*)(ANYARGS))receive_aw_callback_license_result,1);
    rb_define_method(cRubyActiveworld, "login_callback",(VALUE(*)(ANYARGS))login_callback,1);
    rb_define_method(cRubyActiveworld, "receive_aw_callback_login",(VALUE(*)(ANYARGS))receive_aw_callback_login,1);
    rb_define_method(cRubyActiveworld, "object_result_callback",(VALUE(*)(ANYARGS))object_result_callback,1);
    rb_define_method(cRubyActiveworld, "receive_aw_callback_object_result",(VALUE(*)(ANYARGS))receive_aw_callback_object_result,1);
    rb_define_method(cRubyActiveworld, "password_send_callback",(VALUE(*)(ANYARGS))password_send_callback,1);
    rb_define_method(cRubyActiveworld, "receive_aw_callback_password_send",(VALUE(*)(ANYARGS))receive_aw_callback_password_send,1);
    rb_define_method(cRubyActiveworld, "query_callback",(VALUE(*)(ANYARGS))query_callback,1);
    rb_define_method(cRubyActiveworld, "receive_aw_callback_query",(VALUE(*)(ANYARGS))receive_aw_callback_query,1);
    rb_define_method(cRubyActiveworld, "register_callback",(VALUE(*)(ANYARGS))register_callback,1);
    rb_define_method(cRubyActiveworld, "receive_aw_callback_register",(VALUE(*)(ANYARGS))receive_aw_callback_register,1);
    rb_define_method(cRubyActiveworld, "reload_registry_callback",(VALUE(*)(ANYARGS))reload_registry_callback,1);
    rb_define_method(cRubyActiveworld, "receive_aw_callback_reload_registry",(VALUE(*)(ANYARGS))receive_aw_callback_reload_registry,1);
    rb_define_method(cRubyActiveworld, "send_file_callback",(VALUE(*)(ANYARGS))send_file_callback,1);
    rb_define_method(cRubyActiveworld, "receive_aw_callback_send_file",(VALUE(*)(ANYARGS))receive_aw_callback_send_file,1);
    rb_define_method(cRubyActiveworld, "telegram_result_callback",(VALUE(*)(ANYARGS))telegram_result_callback,1);
    rb_define_method(cRubyActiveworld, "receive_aw_callback_telegram_result",(VALUE(*)(ANYARGS))receive_aw_callback_telegram_result,1);
    rb_define_method(cRubyActiveworld, "terrain_delete_all_result_callback",(VALUE(*)(ANYARGS))terrain_delete_all_result_callback,1);
    rb_define_method(cRubyActiveworld, "receive_aw_callback_terrain_delete_all_result",(VALUE(*)(ANYARGS))receive_aw_callback_terrain_delete_all_result,1);
    rb_define_method(cRubyActiveworld, "terrain_load_node_result_callback",(VALUE(*)(ANYARGS))terrain_load_node_result_callback,1);
    rb_define_method(cRubyActiveworld, "receive_aw_callback_terrain_load_node_result",(VALUE(*)(ANYARGS))receive_aw_callback_terrain_load_node_result,1);
    rb_define_method(cRubyActiveworld, "terrain_next_result_callback",(VALUE(*)(ANYARGS))terrain_next_result_callback,1);
    rb_define_method(cRubyActiveworld, "receive_aw_callback_terrain_next_result",(VALUE(*)(ANYARGS))receive_aw_callback_terrain_next_result,1);
    rb_define_method(cRubyActiveworld, "terrain_set_result_callback",(VALUE(*)(ANYARGS))terrain_set_result_callback,1);
    rb_define_method(cRubyActiveworld, "receive_aw_callback_terrain_set_result",(VALUE(*)(ANYARGS))receive_aw_callback_terrain_set_result,1);
    rb_define_method(cRubyActiveworld, "universe_ejection_callback",(VALUE(*)(ANYARGS))universe_ejection_callback,1);
    rb_define_method(cRubyActiveworld, "receive_aw_callback_universe_ejection",(VALUE(*)(ANYARGS))receive_aw_callback_universe_ejection,1);
    rb_define_method(cRubyActiveworld, "universe_ejection_result_callback",(VALUE(*)(ANYARGS))universe_ejection_result_callback,1);
    rb_define_method(cRubyActiveworld, "receive_aw_callback_universe_ejection_result",(VALUE(*)(ANYARGS))receive_aw_callback_universe_ejection_result,1);
    rb_define_method(cRubyActiveworld, "user_list_callback",(VALUE(*)(ANYARGS))user_list_callback,1);
    rb_define_method(cRubyActiveworld, "receive_aw_callback_user_list",(VALUE(*)(ANYARGS))receive_aw_callback_user_list,1);
    rb_define_method(cRubyActiveworld, "world_ejection_callback",(VALUE(*)(ANYARGS))world_ejection_callback,1);
    rb_define_method(cRubyActiveworld, "receive_aw_callback_world_ejection",(VALUE(*)(ANYARGS))receive_aw_callback_world_ejection,1);
    rb_define_method(cRubyActiveworld, "world_ejection_result_callback",(VALUE(*)(ANYARGS))world_ejection_result_callback,1);
    rb_define_method(cRubyActiveworld, "receive_aw_callback_world_ejection_result",(VALUE(*)(ANYARGS))receive_aw_callback_world_ejection_result,1);
    rb_define_method(cRubyActiveworld, "world_instance_callback",(VALUE(*)(ANYARGS))world_instance_callback,1);
    rb_define_method(cRubyActiveworld, "receive_aw_callback_world_instance",(VALUE(*)(ANYARGS))receive_aw_callback_world_instance,1);
    rb_define_method(cRubyActiveworld, "world_list_callback",(VALUE(*)(ANYARGS))world_list_callback,1);
    rb_define_method(cRubyActiveworld, "receive_aw_callback_world_list",(VALUE(*)(ANYARGS))receive_aw_callback_world_list,1);

  }
  
#ifdef __cplusplus
}
#endif
