#include "ruby_activeworld.h"

static VALUE cRubyActiveworldAdmin;

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
static VALUE ruby_activeworld_admin_initialize(VALUE self, VALUE host, VALUE port, VALUE password) {
  int rc = 0; 
  RUBY_AW_APPLICATION* ruby_aw_bot = 0;
  Data_Get_Struct(self, RUBY_AW_APPLICATION, ruby_aw_bot);
  rc = aw_server_admin( StringValuePtr(host), FIX2INT(port), StringValuePtr(password), &(ruby_aw_bot->c_self));
  if( rc != 0 /* RC_SUCCESS */ ) {
    rb_raise(rb_eRuntimeError,"Unable to create instance (reason %d)\n", rc);
  }
  ruby_aw_bot->ruby_self = self;
  aw_user_data_set(ruby_aw_bot);
  return self;
}

aw_cell_next
aw_delete_all_objects
aw_object_load
aw_query
aw_world_reload_registry
aw_world_attributes_change
aw_world_attributes_reset


#ifdef __cplusplus
extern "C" {
#endif
  
void Init_ruby_activeworld_admin() {
    cRubyActiveworldAdmin = rb_define_class("RubyActiveworldAdmin", rb_cObject);
    rb_define_alloc_func(cRubyActiveworldAdmin, ruby_aw_allocate);
    rb_define_method(cRubyActiveworldAdmin, "initialize", (VALUE(*)(ANYARGS))ruby_activeworld_admin_initialize, 2);

    rb_define_method(cRubyActiveworldAdmin, "ruby_aw_server_world_add", (VALUE(*)(ANYARGS))ruby_aw_server_world_add, 0);
    rb_define_method(cRubyActiveworldAdmin, "ruby_aw_server_world_change", (VALUE(*)(ANYARGS))ruby_aw_server_world_change, 1);
    rb_define_method(cRubyActiveworldAdmin, "ruby_aw_server_world_delete", (VALUE(*)(ANYARGS))ruby_aw_server_world_delete, 1);
    rb_define_method(cRubyActiveworldAdmin, "ruby_aw_server_world_instance_add", (VALUE(*)(ANYARGS))ruby_aw_server_world_instance_add, 2);
    rb_define_method(cRubyActiveworldAdmin, "ruby_aw_server_world_instance_delete", (VALUE(*)(ANYARGS))ruby_aw_server_world_instance_delete, 2);
    rb_define_method(cRubyActiveworldAdmin, "ruby_aw_server_world_instance_set", (VALUE(*)(ANYARGS))ruby_aw_server_world_instance_set, 1);
    rb_define_method(cRubyActiveworldAdmin, "ruby_aw_server_world_list", (VALUE(*)(ANYARGS))ruby_aw_server_world_list, 0);
    rb_define_method(cRubyActiveworldAdmin, "ruby_aw_server_world_set", (VALUE(*)(ANYARGS))ruby_aw_server_world_set, 1);
    rb_define_method(cRubyActiveworldAdmin, "ruby_aw_server_world_start", (VALUE(*)(ANYARGS))ruby_aw_server_world_start, 1);
    rb_define_method(cRubyActiveworldAdmin, "ruby_aw_server_world_stop", (VALUE(*)(ANYARGS))ruby_aw_server_world_stop, 1);

}

#ifdef __cplusplus
}
#endif
