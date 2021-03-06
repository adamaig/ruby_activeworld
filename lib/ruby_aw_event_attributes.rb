# This module defines the collections of attributes available for event
# callbacks.
# 
module RubyAwEventAttributes
  
  def self.event_attributes_for(event, *attributes)
    @@attrs_available_to ||= {}
    @@attrs_available_to[event] = attributes
  end
  
  def self.event_attribute_hash
    @@attrs_available_to
  end

  event_attributes_for :AW_EVENT_AVATAR_ADD, :AW_AVATAR_SESSION, :AW_AVATAR_NAME,
    :AW_AVATAR_X, :AW_AVATAR_Y, :AW_AVATAR_Z, :AW_AVATAR_YAW, :AW_AVATAR_TYPE, 
    :AW_AVATAR_GESTURE, :AW_AVATAR_VERSION, :AW_AVATAR_CITIZEN, :AW_AVATAR_PRIVILEGE, 
    :AW_AVATAR_PITCH, :AW_AVATAR_STATE, :AW_PLUGIN_STRING
  event_attributes_for :AW_EVENT_AVATAR_CHANGE, :AW_AVATAR_SESSION, :AW_AVATAR_NAME,
    :AW_AVATAR_X, :AW_AVATAR_Y, :AW_AVATAR_Z, :AW_AVATAR_YAW, :AW_AVATAR_TYPE, 
    :AW_AVATAR_GESTURE, :AW_AVATAR_PITCH, :AW_AVATAR_STATE, :AW_AVATAR_FLAGS, 
    :AW_AVATAR_LOCK, :AW_PLUGIN_STRING
  event_attributes_for :AW_EVENT_AVATAR_CLICK, :AW_AVATAR_NAME, 
    :AW_AVATAR_SESSION, :AW_CLICKED_NAME, :AW_CLICKED_SESSION
  event_attributes_for :AW_EVENT_AVATAR_DELETE, :AW_AVATAR_SESSION, :AW_AVATAR_NAME
  event_attributes_for :AW_EVENT_AVATAR_RELOAD, :AW_AVATAR_CITIZEN, :AW_AVATAR_SESSION
  
  event_attributes_for :AW_EVENT_BOTMENU, :AW_BOTMENU_FROM_NAME, 
    :AW_BOTMENU_FROM_SESSION, :AW_BOTMENU_QUESTION, :AW_BOTMENU_ANSWER
  event_attributes_for :AW_EVENT_BOTGRAM, :AW_BOTGRAM_FROM_NAME, 
    :AW_BOTGRAM_FROM, :AW_BOTGRAM_TEXT
  
  event_attributes_for :AW_EVENT_CHAT, :AW_AVATAR_NAME, :AW_CHAT_SESSION, 
    :AW_CHAT_TYPE, :AW_CHAT_MESSAGE
  event_attributes_for :AW_EVENT_CELL_BEGIN, :AW_CELL_X, :AW_CELL_Z, 
    :AW_CELL_SEQUENCE, :AW_CELL_SIZE
  event_attributes_for :AW_EVENT_CELL_END, []
  event_attributes_for :AW_EVENT_CELL_OBJECT, :AW_OBJECT_TYPE, 
    :AW_OBJECT_ID, :AW_OBJECT_NUMBER, :AW_OBJECT_OWNER, 
    :AW_OBJECT_BUILD_TIMESTAMP, :AW_OBJECT_X, :AW_OBJECT_Y, :AW_OBJECT_Z, 
    :AW_OBJECT_YAW, :AW_OBJECT_TILT, :AW_OBJECT_ROLL, :AW_OBJECT_MODEL, 
    :AW_OBJECT_DESCRIPTION, :AW_OBJECT_ACTION, :AW_OBJECT_DATA
  event_attributes_for :AW_EVENT_CONSOLE_MESSAGE, :AW_CONSOLE_RED, 
    :AW_CONSOLE_GREEN, :AW_CONSOLE_BLUE, :AW_CONSOLE_MESSAGE, :AW_CONSOLE_BOLD, 
    :AW_CONSOLE_ITALICS
  
  event_attributes_for :AW_EVENT_ENTITY_ADD, :AW_ENTITY_TYPE, :AW_ENTITY_ID,
    :AW_ENTITY_STATE, :AW_ENTITY_FLAGS, :AW_ENTITY_NUMBER, 
    :AW_ENTITY_OWNER_SESSION, :AW_ENTITY_X, :AW_ENTITY_Y, :AW_ENTITY_Z, 
    :AW_ENTITY_YAW, :AW_ENTITY_TILT, :AW_ENTITY_ROLL, :AW_ENTITY_MODE_NUM,
    :AW_ENTITY_OWNER_CITIZEN,
    :AW_OBJECT_SESSION, :AW_CELL_SEQUENCE, 
    :AW_CELL_X, :AW_CELL_Z, :AW_OBJECT_TYPE, :AW_OBJECT_ID, :AW_OBJECT_NUMBER, 
    :AW_OBJECT_OWNER, :AW_OBJECT_BUILD_TIMESTAMP, :AW_OBJECT_X, :AW_OBJECT_Y, 
    :AW_OBJECT_Z, :AW_OBJECT_YAW, :AW_OBJECT_TILT, :AW_OBJECT_ROLL, :AW_OBJECT_MODEL, 
    :AW_OBJECT_DESCRIPTION, :AW_OBJECT_ACTION, :AW_OBJECT_DATA
  event_attributes_for :AW_EVENT_ENTITY_CHANGE, :AW_ENTITY_TYPE, :AW_ENTITY_ID,
    :AW_ENTITY_STATE, :AW_ENTITY_FLAGS,
    :AW_ENTITY_OWNER_SESSION, :AW_ENTITY_X, :AW_ENTITY_Y, :AW_ENTITY_Z, 
    :AW_ENTITY_YAW, :AW_ENTITY_TILT, :AW_ENTITY_ROLL, :AW_ENTITY_MODE_NUM
  event_attributes_for :AW_EVENT_ENTITY_DELETE, :AW_ENTITY_TYPE, :AW_ENTITY_ID
  event_attributes_for :AW_EVENT_ENTITY_LINKS, :AW_ENTITY_TYPE, :AW_ENTITY_ID,
    :AW_OBJECT_SESSION, :AW_CELL_SEQUENCE, 
    :AW_CELL_X, :AW_CELL_Z, :AW_OBJECT_TYPE, :AW_OBJECT_ID, :AW_OBJECT_NUMBER, 
    :AW_OBJECT_OWNER, :AW_OBJECT_BUILD_TIMESTAMP, :AW_OBJECT_X, :AW_OBJECT_Y, 
    :AW_OBJECT_Z, :AW_OBJECT_YAW, :AW_OBJECT_TILT, :AW_OBJECT_ROLL, :AW_OBJECT_MODEL, 
    :AW_OBJECT_DESCRIPTION, :AW_OBJECT_ACTION, :AW_OBJECT_DATA
    
  event_attributes_for :AW_EVENT_ENTITY_RIDER_ADD, :AW_ENTITY_TYPE, :AW_ENTITY_ID,
    :AW_AVATAR_SESSION, :AW_AVATAR_DISTANCE, :AW_AVATAR_Y_DELTA, :AW_AVATAR_ANGLE, 
    :AW_AVATAR_YAW_DELTA, :AW_AVATAR_PITCH_DELTA
  event_attributes_for :AW_EVENT_ENTITY_RIDER_CHANGE, :AW_ENTITY_TYPE, :AW_ENTITY_ID,
    :AW_AVATAR_SESSION, :AW_AVATAR_DISTANCE, :AW_AVATAR_Y_DELTA, :AW_AVATAR_ANGLE, 
    :AW_AVATAR_YAW_DELTA, :AW_AVATAR_PITCH_DELTA
  event_attributes_for :AW_EVENT_ENTITY_RIDER_DELETE, :AW_ENTITY_TYPE, :AW_OBJECT_ID, :AW_AVATAR_SESSION

  event_attributes_for :AW_EVENT_HUD_CLICK, :AW_HUD_ELEMENT_SESSION, 
    :AW_HUD_ELEMENT_ID, :AW_HUD_ELEMENT_CLICK_X, :AW_HUD_ELEMENT_CLICK_Y
  
  event_attributes_for :AW_EVENT_NOISE, :AW_SOUND_NAME
  
  event_attributes_for :AW_EVENT_OBJECT_ADD, :AW_OBJECT_SESSION, :AW_CELL_SEQUENCE, 
      :AW_CELL_X, :AW_CELL_Z, :AW_OBJECT_TYPE, :AW_OBJECT_ID, :AW_OBJECT_NUMBER, 
      :AW_OBJECT_OWNER, :AW_OBJECT_BUILD_TIMESTAMP, :AW_OBJECT_X, :AW_OBJECT_Y, 
      :AW_OBJECT_Z, :AW_OBJECT_YAW, :AW_OBJECT_TILT, :AW_OBJECT_ROLL, :AW_OBJECT_MODEL, 
      :AW_OBJECT_DESCRIPTION, :AW_OBJECT_ACTION, :AW_OBJECT_DATA
  event_attributes_for :AW_EVENT_OBJECT_BUMP, :AW_AVATAR_SESSION, :AW_AVATAR_NAME,
    :AW_OBJECT_SYNC, :AW_OBJECT_TYPE, :AW_OBJECT_ID, 
    :AW_OBJECT_X, :AW_OBJECT_Y, :AW_OBJECT_Z,
    :AW_OBJECT_YAW, :AW_OBJECT_TILT, :AW_OBJECT_ROLL, :AW_OBJECT_MODEL, 
    :AW_OBJECT_OWNER, :AW_OBJECT_BUILD_TIMESTAMP,  
    :AW_OBJECT_DESCRIPTION, :AW_OBJECT_ACTION, :AW_OBJECT_DATA
        
  event_attributes_for :AW_EVENT_OBJECT_CLICK, :AW_AVATAR_SESSION, :AW_AVATAR_NAME,
    :AW_OBJECT_SYNC, :AW_CELL_X, :AW_CELL_Z,
    :AW_OBJECT_TYPE, :AW_OBJECT_ID, :AW_OBJECT_NUMBER, 
    :AW_OBJECT_OWNER, :AW_OBJECT_BUILD_TIMESTAMP, :AW_OBJECT_X, :AW_OBJECT_Y, 
    :AW_OBJECT_Z, :AW_OBJECT_YAW, :AW_OBJECT_TILT, :AW_OBJECT_ROLL, :AW_OBJECT_MODEL, 
    :AW_OBJECT_DESCRIPTION, :AW_OBJECT_ACTION, :AW_OBJECT_DATA
  
  event_attributes_for :AW_EVENT_OBJECT_DELETE, :AW_OBJECT_SESSION, :AW_CELL_SEQUENCE, 
      :AW_CELL_X, :AW_CELL_Z, :AW_OBJECT_ID, :AW_OBJECT_NUMBER
  event_attributes_for :AW_EVENT_OBJECT_SELECT, :AW_AVATAR_SESSION, :AW_AVATAR_NAME,
    :AW_OBJECT_SYNC, :AW_CELL_X, :AW_CELL_Z, :AW_OBJECT_ID, :AW_OBJECT_NUMBER
  
  event_attributes_for :AW_EVENT_TELEPORT, :AW_TELEPORT_WORLD,
    :AW_TELEPORT_X, :AW_TELEPORT_Y, :AW_TELEPORT_Z, :AW_TELEPORT_YAW, :AW_TELEPORT_WARP

  event_attributes_for :AW_EVENT_TERRAIN_BEGIN, :AW_TERRAIN_PAGE_X, :AW_TERRAIN_PAGE_Z
  event_attributes_for :AW_EVENT_TERRAIN_CHANGE, :AW_TERRAIN_PAGE_X, :AW_TERRAIN_PAGE_Z
  event_attributes_for :AW_EVENT_TERRAIN_DATA, :AW_TERRAIN_NODE_X, 
    :AW_TERRAIN_NODE_Z, :AW_TERRAIN_NODE_SIZE, :AW_TERRAIN_NODE_TEXTURES, :AW_TERRAIN_NODE_HEIGHTS
  event_attributes_for :AW_EVENT_TERRAIN_END, :AW_TERRAIN_COMPLETE, :AW_TERRAIN_SEQUENCE
  event_attributes_for :AW_EVENT_TOOLBAR_CLICK, :AW_TOOLBAR_SESSION, :AW_TOOLBAR_ID

  event_attributes_for :AW_EVENT_URL, :AW_AVATAR_SESSION, :AW_AVATAR_NAME, 
    :AW_URL_NAME, :AW_URL_POST, :AW_URL_TARGET, :AW_URL_TARGET_3D
  event_attributes_for :AW_EVENT_URL_CLICK, :AW_AVATAR_SESSION, :AW_AVATAR_NAME, 
    :AW_URL_NAME
  event_attributes_for :AW_EVENT_USER_INFO, :AW_USERLIST_ID, 
    :AW_USERLIST_NAME, :AW_USERLIST_WORLD, :AW_USERLIST_CITIZEN, :AW_USERLIST_STATE

  event_attributes_for :AW_EVENT_UNIVERSE_ATTRIBUTES, :AW_UNIVERSE_ALLOW_TOURISTS,
    :AW_UNIVERSE_ANNUAL_CHARGE, :AW_UNIVERSE_BROWSER_BETA, :AW_UNIVERSE_BROWSER_MINIMUM,
    :AW_UNIVERSE_BROWSER_RELEASE, :AW_UNIVERSE_BUILD_NUMBER, :AW_UNIVERSE_CITIZEN_CHANGES_ALLOWED,
    :AW_UNIVERSE_MONTHLY_CHARGE, :AW_UNIVERSE_REGISTER_METHOD, :AW_UNIVERSE_REGISTRATION_REQUIRED,
    :AW_UNIVERSE_SEARCH_URL, :AW_UNIVERSE_TIME, :AW_UNIVERSE_WELCOME_MESSAGE,
    :AW_UNIVERSE_WORLD_BETA, :AW_UNIVERSE_WORLD_MINIMUM, :AW_UNIVERSE_WORLD_RELEASE,
    :AW_UNIVERSE_WORLD_START, :AW_UNIVERSE_USER_LIST_ENABLED, :AW_UNIVERSE_NOTEPAD_URL,
    :AW_UNIVERSE_CAV_PATH, :AW_UNIVERSE_CAV_PATH2
    
  event_attributes_for :AW_EVENT_UNIVERSE_DISCONNECT, :AW_DISCONNECT_REASON  
  
  event_attributes_for :AW_EVENT_WORLD_ATTRIBUTES, :AW_ATTRIB_SENDER_SESSION,
    :AW_WORLD_NAME, :AW_WORLD_TITLE, :AW_WORLD_BACKDROP, :AW_WORLD_GROUND,
    :AW_WORLD_OBJECT_PATH, :AW_WORLD_OBJECT_REFRESH, :AW_WORLD_BUILD_RIGHT,
    :AW_WORLD_EMINENT_DOMAIN_RIGHT, :AW_WORLD_ENTER_RIGHT,
    :AW_WORLD_SPECIAL_OBJECTS_RIGHT, :AW_WORLD_FOG_RED, :AW_WORLD_FOG_GREEN,
    :AW_WORLD_FOG_BLUE, :AW_WORLD_CARETAKER_CAPABILITY,
    :AW_WORLD_RESTRICTED_RADIUS, :AW_WORLD_PUBLIC_SPEAKER_CAPABILITY,
    :AW_WORLD_PUBLIC_SPEAKER_RIGHT, :AW_WORLD_CREATION_TIMESTAMP,
    :AW_WORLD_HOME_PAGE, :AW_WORLD_BUILD_NUMBER, :AW_WORLD_OBJECT_PASSWORD,
    :AW_WORLD_DISABLE_CREATE_URL, :AW_WORLD_RATING, :AW_WORLD_WELCOME_MESSAGE,
    :AW_WORLD_EJECT_RIGHT, :AW_WORLD_EJECT_CAPABILITY, :AW_WORLD_CELL_LIMIT,
    :AW_WORLD_BUILD_CAPABILITY, :AW_WORLD_ALLOW_PASSTHRU, :AW_WORLD_ALLOW_FLYING,
    :AW_WORLD_ALLOW_TELEPORT, :AW_WORLD_ALLOW_OBJECT_SELECT, :AW_WORLD_BOTS_RIGHT,
    :AW_WORLD_SPEAK_CAPABILITY, :AW_WORLD_SPEAK_RIGHT,
    :AW_WORLD_ALLOW_TOURIST_WHISPER, :AW_WORLD_LIGHT_X, :AW_WORLD_LIGHT_Y,
    :AW_WORLD_LIGHT_Z, :AW_WORLD_LIGHT_RED, :AW_WORLD_LIGHT_GREEN,
    :AW_WORLD_LIGHT_BLUE, :AW_WORLD_AMBIENT_LIGHT_RED,
    :AW_WORLD_AMBIENT_LIGHT_GREEN, :AW_WORLD_AMBIENT_LIGHT_BLUE,
    :AW_WORLD_ALLOW_AVATAR_COLLISION, :AW_WORLD_FOG_ENABLE, :AW_WORLD_FOG_MINIMUM,
    :AW_WORLD_FOG_MAXIMUM, :AW_WORLD_FOG_TINTED, :AW_WORLD_MAX_USERS,
    :AW_WORLD_SIZE, :AW_WORLD_OBJECT_COUNT, :AW_WORLD_EXPIRATION,
    :AW_WORLD_SPECIAL_COMMANDS_RIGHT, :AW_WORLD_MAX_LIGHT_RADIUS,
    :AW_WORLD_SKYBOX, :AW_WORLD_MINIMUM_VISIBILITY, :AW_WORLD_REPEATING_GROUND,
    :AW_WORLD_KEYWORDS, :AW_WORLD_ENABLE_TERRAIN, :AW_WORLD_ALLOW_3_AXIS_ROTATION,
    :AW_WORLD_TERRAIN_TIMESTAMP, :AW_WORLD_ENTRY_POINT, :AW_WORLD_SKY_NORTH_RED,
    :AW_WORLD_SKY_NORTH_GREEN, :AW_WORLD_SKY_NORTH_BLUE, :AW_WORLD_SKY_SOUTH_RED,
    :AW_WORLD_SKY_SOUTH_GREEN, :AW_WORLD_SKY_SOUTH_BLUE, :AW_WORLD_SKY_EAST_RED,
    :AW_WORLD_SKY_EAST_GREEN, :AW_WORLD_SKY_EAST_BLUE, :AW_WORLD_SKY_WEST_RED,
    :AW_WORLD_SKY_WEST_GREEN, :AW_WORLD_SKY_WEST_BLUE, :AW_WORLD_SKY_TOP_RED,
    :AW_WORLD_SKY_TOP_GREEN, :AW_WORLD_SKY_TOP_BLUE, :AW_WORLD_SKY_BOTTOM_RED,
    :AW_WORLD_SKY_BOTTOM_GREEN, :AW_WORLD_SKY_BOTTOM_BLUE,
    :AW_WORLD_CLOUDS_LAYER1_TEXTURE, :AW_WORLD_CLOUDS_LAYER1_MASK,
    :AW_WORLD_CLOUDS_LAYER1_TILE, :AW_WORLD_CLOUDS_LAYER1_SPEED_X,
    :AW_WORLD_CLOUDS_LAYER1_SPEED_Z, :AW_WORLD_CLOUDS_LAYER1_OPACITY,
    :AW_WORLD_CLOUDS_LAYER2_TEXTURE, :AW_WORLD_CLOUDS_LAYER2_MASK,
    :AW_WORLD_CLOUDS_LAYER2_TILE, :AW_WORLD_CLOUDS_LAYER2_SPEED_X,
    :AW_WORLD_CLOUDS_LAYER2_SPEED_Z, :AW_WORLD_CLOUDS_LAYER2_OPACITY,
    :AW_WORLD_CLOUDS_LAYER3_TEXTURE, :AW_WORLD_CLOUDS_LAYER3_MASK,
    :AW_WORLD_CLOUDS_LAYER3_TILE, :AW_WORLD_CLOUDS_LAYER3_SPEED_X,
    :AW_WORLD_CLOUDS_LAYER3_SPEED_Z, :AW_WORLD_CLOUDS_LAYER3_OPACITY,
    :AW_WORLD_DISABLE_CHAT, :AW_WORLD_ALLOW_CITIZEN_WHISPER,
    :AW_WORLD_ALWAYS_SHOW_NAMES, :AW_WORLD_DISABLE_AVATAR_LIST,
    :AW_WORLD_AVATAR_REFRESH_RATE, :AW_WORLD_WATER_TEXTURE, :AW_WORLD_WATER_MASK,
    :AW_WORLD_WATER_BOTTOM_TEXTURE, :AW_WORLD_WATER_BOTTOM_MASK,
    :AW_WORLD_WATER_OPACITY, :AW_WORLD_WATER_RED, :AW_WORLD_WATER_GREEN,
    :AW_WORLD_WATER_BLUE, :AW_WORLD_WATER_LEVEL, :AW_WORLD_WATER_SURFACE_MOVE,
    :AW_WORLD_WATER_WAVE_MOVE, :AW_WORLD_WATER_SPEED, :AW_WORLD_WATER_ENABLED,
    :AW_WORLD_EMINENT_DOMAIN_CAPABILITY, :AW_WORLD_LIGHT_TEXTURE,
    :AW_WORLD_LIGHT_MASK, :AW_WORLD_LIGHT_DRAW_SIZE, :AW_WORLD_LIGHT_DRAW_FRONT,
    :AW_WORLD_LIGHT_DRAW_BRIGHT, :AW_WORLD_LIGHT_SOURCE_USE_COLOR,
    :AW_WORLD_LIGHT_SOURCE_COLOR, :AW_WORLD_TERRAIN_AMBIENT,
    :AW_WORLD_TERRAIN_DIFFUSE, :AW_WORLD_WATER_VISIBILITY,
    :AW_WORLD_SOUND_FOOTSTEP, :AW_WORLD_SOUND_WATER_ENTER,
    :AW_WORLD_SOUND_WATER_EXIT, :AW_WORLD_SOUND_AMBIENT, :AW_WORLD_GRAVITY,
    :AW_WORLD_BUOYANCY, :AW_WORLD_FRICTION, :AW_WORLD_WATER_FRICTION,
    :AW_WORLD_SLOPESLIDE_ENABLED, :AW_WORLD_SLOPESLIDE_MIN_ANGLE,
    :AW_WORLD_SLOPESLIDE_MAX_ANGLE, :AW_WORLD_ALLOW_TOURIST_BUILD,
    :AW_WORLD_ENABLE_REFERER, :AW_WORLD_WATER_UNDER_TERRAIN,
    :AW_WORLD_TERRAIN_OFFSET, :AW_WORLD_VOIP_RIGHT,
    :AW_WORLD_DISABLE_MULTIPLE_MEDIA, :AW_WORLD_BOTMENU_URL,
    :AW_WORLD_ENABLE_BUMP_EVENT, :AW_WORLD_ENABLE_SYNC_EVENTS,
    :AW_WORLD_ENABLE_CAV, :AW_WORLD_ENABLE_PAV, :AW_WORLD_CHAT_DISABLE_URL_CLICKS,
    :AW_WORLD_MOVER_EMPTY_RESET_TIMEOUT, :AW_WORLD_MOVER_USED_RESET_TIMEOUT
  
  event_attributes_for :AW_EVENT_WORLD_DISCONNECT, :AW_DISCONNECT_REASON
  event_attributes_for :AW_EVENT_WORLD_INFO, :AW_WORLDLIST_NAME,
    :AW_WORLDLIST_USERS, :AW_WORLDLIST_STATUS, :AW_WORLDLIST_RATING
    
end
