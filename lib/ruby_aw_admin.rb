require 'ruby_activeworld'
require 'ruby_aw_support'

class RubyAwAdmin < RubyActiveworldAdmin
  include RubyAwdSupport
  
  aw_server_admin
  aw_server_world_add
  aw_server_world_change
  aw_server_world_delete
  aw_server_world_list
  aw_server_world_set
  aw_server_world_start
  aw_server_world_stop
  
  aw_cell_next
  aw_delete_all_objects
  aw_object_load
  aw_query
  aw_world_reload_registry
  aw_world_attributes_change
  aw_world_attributes_reset
  
  attributes_available_to :AW_EVENT_ADMIN_WORLD_DELETE, :AW_SERVER_ID
  
  attributes_available_to :AW_EVENT_ADMIN_WORLD_INFO, :AW_SERVER_ID, :AW_SERVER_INSTANCE,
    :AW_SERVER_CARETAKERS, :AW_SERVER_ENABLED, :AW_SERVER_EXPIRATION, :AW_SERVER_MAX_USERS,
    :AW_SERVER_NAME,   :AW_SERVER_OBJECTS,   :AW_SERVER_PASSWORD, :AW_SERVER_REGISTRY,
    :AW_SERVER_SIZE, :AW_SERVER_START_RC, :AW_SERVER_STATE, :AW_SERVER_TERRAIN_NODES, :AW_SERVER_USERS
    
end