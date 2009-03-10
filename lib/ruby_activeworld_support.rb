require 'ruby_activeworld_enums'

module RubyActiveworldSupport
  include RubyActiveworldEnums
  
  AW_BUILD                     = 65
  AW_MAX_AVCHANGE_PER_SECOND   = 10
  AW_MAX_MESSAGES_PER_SECOND   = 100
  AW_MAX_WHISPERS_PER_SECOND   = 100
  AW_MAX_BOTGRAMS_PER_SECOND   = 32
  AW_MAX_ATTRIBUTE_LENGTH      = 255
  AW_MAX_LONG_ATTRIBUTE_LENGTH = 1000
  AW_MAX_DATA_ATTRIBUTE_LENGTH = 4096
  AW_PERSONAL_AVATAR           = 65535
  AW_CUSTOM_AVATAR             = 65534
  AW_CUSTOM_WORLD_AVATAR       = 65533
  
  AW_OBJECT_VERSION_CAMERA     = 1
  AW_OBJECT_VERSION_PARTICLES  = 1
  AW_OBJECT_VERSION_ZONE       = 1
  AW_OBJECT_VERSION_MOVER      = 1
  
  # This class allows is for the generation of RubyActiveworld specific errors
  class RubyActiveworldError < RuntimeError; end
  
  # call-seq:
  #   rc_sym ruby_aw_init =>  :RC_SUCCESS
  #   
  # This returns the symbol corresponding to the return code name
  def rc_sym(rc_int)
    RETURN_CODE_MAP[rc_int][:error_symbol]
  end
  
  # call-seq:
  #   rc_msg ruby_aw_init => "Success: Return value from an asynchronous call..."
  #   rc_msg some_failing_call => "This call failed due to ..." 
  #
  # This looks up return code's corresponding explanation.
  def rc_msg(rc_int)
    RETURN_CODE_MAP[rc_int][:error_explanation]
  end
  
  def raise_on_error(rc_int)
    if :RC_SUCCESS != rc_sym(rc_int)
      throw RubyActiveworldError.new( "#{rc_int} : #{rc_msg(rc_int)}")
    end
  end
  
  ATTRIBUTE_TYPE_MAP = { 
    :AW_AVATAR_LOCK => :bool,
    :AW_CELL_COMBINE => :bool,
    :AW_CITIZEN_BETA => :bool,
    :AW_CITIZEN_CAV_ENABLED => :bool,
    :AW_CITIZEN_ENABLED => :bool,
    :AW_CITIZEN_PAV_ENABLED => :bool,
    :AW_CITIZEN_TRIAL => :bool,
    :AW_CONSOLE_BOLD => :bool,
    :AW_CONSOLE_ITALICS => :bool,
    :AW_ENTER_GLOBAL => :bool,
    :AW_LICENSE_ALLOW_TOURISTS => :bool,
    :AW_LICENSE_HIDDEN => :bool,
    :AW_LICENSE_PLUGINS => :bool,
    :AW_LICENSE_VOIP => :bool,
    :AW_QUERY_COMPLETE => :bool,
    :AW_SERVER_ENABLED => :bool,
    :AW_SERVER_MORE => :bool,
    :AW_TELEPORT_WARP => :bool,
    :AW_TERRAIN_COMPLETE => :bool,
    :AW_URL_TARGET_3D => :bool,
    :AW_USERLIST_MORE => :bool,
    :AW_WORLDLIST_MORE => :bool,
    :AW_CAV_DEFINITION => :data,
    :AW_OBJECT_DATA => :data,
    :AW_TERRAIN_NODE_HEIGHTS => :data,
    :AW_TERRAIN_NODE_TEXTURES => :data,
    :AW_HUD_ELEMENT_OPACITY => :float,
    :AW_ATTRIB_SENDER_SESSION => :int,
    :AW_AVATAR_ADDRESS => :int,
    :AW_AVATAR_ANGLE => :int,
    :AW_AVATAR_CITIZEN => :int,
    :AW_AVATAR_DISTANCE => :int,
    :AW_AVATAR_FLAGS => :int,
    :AW_AVATAR_GESTURE => :int,
    :AW_AVATAR_PITCH => :int,
    :AW_AVATAR_PITCH_DELTA => :int,
    :AW_AVATAR_PRIVILEGE => :int,
    :AW_AVATAR_SESSION => :int,
    :AW_AVATAR_STATE => :int,
    :AW_AVATAR_TYPE => :int,
    :AW_AVATAR_VERSION => :int,
    :AW_AVATAR_WORLD_INSTANCE => :int,
    :AW_AVATAR_X => :int,
    :AW_AVATAR_Y => :int,
    :AW_AVATAR_Y_DELTA => :int,
    :AW_AVATAR_YAW => :int,
    :AW_AVATAR_YAW_DELTA => :int,
    :AW_AVATAR_Z => :int,
    :AW_BOTGRAM_FROM => :int,
    :AW_BOTGRAM_TO => :int,
    :AW_BOTGRAM_TYPE => :int,
    :AW_BOTMENU_FROM_SESSION => :int,
    :AW_BOTMENU_TO_SESSION => :int,
    :AW_CAMERA_LOCATION_SESSION => :int,
    :AW_CAMERA_LOCATION_TYPE => :int,
    :AW_CAMERA_TARGET_SESSION => :int,
    :AW_CAMERA_TARGET_TYPE => :int,
    :AW_CAV_CITIZEN => :int,
    :AW_CAV_SESSION => :int,
    :AW_CELL_ITERATOR => :int,
    :AW_CELL_SEQUENCE => :int,
    :AW_CELL_SIZE => :int,
    :AW_CELL_X => :int,
    :AW_CELL_Z => :int,
    :AW_CHAT_SESSION => :int,
    :AW_CHAT_TYPE => :int,
    :AW_CITIZEN_BOT_LIMIT => :int,
    :AW_CITIZEN_EXPIRATION_TIME => :int,
    :AW_CITIZEN_IMMIGRATION_TIME => :int,
    :AW_CITIZEN_LAST_ADDRESS => :int,
    :AW_CITIZEN_LAST_LOGIN => :int,
    :AW_CITIZEN_NUMBER => :int,
    :AW_CITIZEN_PRIVACY => :int,
    :AW_CITIZEN_TIME_LEFT => :int,
    :AW_CITIZEN_TOTAL_TIME => :int,
    :AW_CLICKED_SESSION => :int,
    :AW_CONSOLE_BLUE => :int,
    :AW_CONSOLE_GREEN => :int,
    :AW_CONSOLE_RED => :int,
    :AW_DISCONNECT_REASON => :int,
    :AW_EJECT_DURATION => :int,
    :AW_EJECT_SESSION => :int,
    :AW_EJECTION_ADDRESS => :int,
    :AW_EJECTION_CREATION_TIME => :int,
    :AW_EJECTION_EXPIRATION_TIME => :int,
    :AW_EJECTION_TYPE => :int,
    :AW_ENTITY_FLAGS => :int,
    :AW_ENTITY_ID => :int,
    :AW_ENTITY_MODEL_NUM => :int,
    :AW_ENTITY_OWNER_CITIZEN => :int,
    :AW_ENTITY_OWNER_SESSION => :int,
    :AW_ENTITY_PITCH => :int,
    :AW_ENTITY_ROLL => :int,
    :AW_ENTITY_STATE => :int,
    :AW_ENTITY_TYPE => :int,
    :AW_ENTITY_X => :int,
    :AW_ENTITY_Y => :int,
    :AW_ENTITY_YAW => :int,
    :AW_ENTITY_Z => :int,
    :AW_HUD_ELEMENT_CLICK_X => :int,
    :AW_HUD_ELEMENT_CLICK_Y => :int,
    :AW_HUD_ELEMENT_CLICK_Z => :int,
    :AW_HUD_ELEMENT_COLOR => :int,
    :AW_HUD_ELEMENT_FLAGS => :int,
    :AW_HUD_ELEMENT_ID => :int,
    :AW_HUD_ELEMENT_ORIGIN => :int,
    :AW_HUD_ELEMENT_SESSION => :int,
    :AW_HUD_ELEMENT_SIZE_X => :int,
    :AW_HUD_ELEMENT_SIZE_Y => :int,
    :AW_HUD_ELEMENT_SIZE_Z => :int,
    :AW_HUD_ELEMENT_TEXTURE_OFFSET_X => :int,
    :AW_HUD_ELEMENT_TEXTURE_OFFSET_Y => :int,
    :AW_HUD_ELEMENT_TYPE => :int,
    :AW_HUD_ELEMENT_X => :int,
    :AW_HUD_ELEMENT_Y => :int,
    :AW_HUD_ELEMENT_Z => :int,
    :AW_LICENSE_CREATION_TIME => :int,
    :AW_LICENSE_EXPIRATION_TIME => :int,
    :AW_LICENSE_LAST_ADDRESS => :int,
    :AW_LICENSE_LAST_START => :int,
    :AW_LICENSE_RANGE => :int,
    :AW_LICENSE_USERS => :int,
    :AW_LOGIN_OWNER => :int,
    :AW_MY_GESTURE => :int,
    :AW_MY_PITCH => :int,
    :AW_MY_STATE => :int,
    :AW_MY_TYPE => :int,
    :AW_MY_X => :int,
    :AW_MY_Y => :int,
    :AW_MY_YAW => :int,
    :AW_MY_Z => :int,
    :AW_OBJECT_BUILD_TIMESTAMP => :int,
    :AW_OBJECT_CALLBACK_REFERENCE => :int,
    :AW_OBJECT_ID => :int,
    :AW_OBJECT_NUMBER => :int,
    :AW_OBJECT_OLD_NUMBER => :int,
    :AW_OBJECT_OLD_X => :int,
    :AW_OBJECT_OLD_Z => :int,
    :AW_OBJECT_OWNER => :int,
    :AW_OBJECT_ROLL => :int,
    :AW_OBJECT_SESSION => :int,
    :AW_OBJECT_SYNC => :int,
    :AW_OBJECT_TILT => :int,
    :AW_OBJECT_TYPE => :int,
    :AW_OBJECT_X => :int,
    :AW_OBJECT_Y => :int,
    :AW_OBJECT_YAW => :int,
    :AW_OBJECT_Z => :int,
    :AW_SERVER_BUILD => :int,
    :AW_SERVER_EXPIRATION => :int,
    :AW_SERVER_ID => :int,
    :AW_SERVER_INSTANCE => :int,
    :AW_SERVER_MAX_USERS => :int,
    :AW_SERVER_OBJECTS => :int,
    :AW_SERVER_SIZE => :int,
    :AW_SERVER_START_RC => :int,
    :AW_SERVER_STATE => :int,
    :AW_SERVER_TERRAIN_NODES => :int,
    :AW_SERVER_USERS => :int,
    :AW_TELEPORT_X => :int,
    :AW_TELEPORT_Y => :int,
    :AW_TELEPORT_YAW => :int,
    :AW_TELEPORT_Z => :int,
    :AW_TERRAIN_NODE_HEIGHT_COUNT => :int,
    :AW_TERRAIN_NODE_SIZE => :int,
    :AW_TERRAIN_NODE_TEXTURE_COUNT => :int,
    :AW_TERRAIN_NODE_X => :int,
    :AW_TERRAIN_NODE_Z => :int,
    :AW_TERRAIN_PAGE_X => :int,
    :AW_TERRAIN_PAGE_Z => :int,
    :AW_TERRAIN_SEQUENCE => :int,
    :AW_TERRAIN_VERSION_NEEDED => :int,
    :AW_TERRAIN_X => :int,
    :AW_TERRAIN_Z => :int,
    :AW_TOOLBAR_ID => :int,
    :AW_TOOLBAR_SESSION => :int,
    :AW_USERLIST_ADDRESS => :int,
    :AW_USERLIST_CITIZEN => :int,
    :AW_USERLIST_ID => :int,
    :AW_USERLIST_PRIVILEGE => :int,
    :AW_USERLIST_STATE => :int,
    :AW_WORLDLIST_RATING => :int,
    :AW_WORLDLIST_STATUS => :int,
    :AW_WORLDLIST_USERS => :int,
    :AW_AVATAR_NAME => :string,
    :AW_BOTGRAM_FROM_NAME => :string,
    :AW_BOTMENU_FROM_NAME => :string,
    :AW_CAMERA_LOCATION_OBJECT => :string,
    :AW_CAMERA_TARGET_OBJECT => :string,
    :AW_CHAT_MESSAGE => :string,
    :AW_CITIZEN_COMMENT => :string,
    :AW_CITIZEN_EMAIL => :string,
    :AW_CITIZEN_NAME => :string,
    :AW_CITIZEN_PASSWORD => :string,
    :AW_CITIZEN_PRIVILEGE_PASSWORD => :string,
    :AW_CITIZEN_URL => :string,
    :AW_CLICKED_NAME => :string,
    :AW_CONSOLE_MESSAGE => :string,
    :AW_EJECTION_COMMENT => :string,
    :AW_HUD_ELEMENT_TEXT => :string,
    :AW_LICENSE_COMMENT => :string,
    :AW_LICENSE_EMAIL => :string,
    :AW_LICENSE_NAME => :string,
    :AW_LICENSE_PASSWORD => :string,
    :AW_LOGIN_APPLICATION => :string,
    :AW_LOGIN_NAME => :string,
    :AW_LOGIN_PASSWORD => :string,
    :AW_LOGIN_PRIVILEGE_NAME => :string,
    :AW_LOGIN_PRIVILEGE_PASSWORD => :string,
    :AW_OBJECT_ACTION => :string,
    :AW_OBJECT_DESCRIPTION => :string,
    :AW_OBJECT_MODEL => :string,
    :AW_PLUGIN_STRING => :string,
    :AW_SERVER_CARETAKERS => :string,
    :AW_SERVER_NAME => :string,
    :AW_SERVER_PASSWORD => :string,
    :AW_SERVER_REGISTRY => :string,
    :AW_SOUND_NAME => :string,
    :AW_TELEPORT_WORLD => :string,
    :AW_URL_POST => :string,
    :AW_URL_TARGET => :string,
    :AW_USERLIST_EMAIL => :string,
    :AW_USERLIST_NAME => :string,
    :AW_USERLIST_WORLD => :string,
    :AW_WORLDLIST_NAME => :string,
    :AW_BOTGRAM_TEXT => :string,
    :AW_BOTMENU_ANSWER => :string,
    :AW_BOTMENU_QUESTION => :string,
    :AW_URL_NAME => :string,
    :AW_UNIVERSE_ALLOW_BOTS_CAV => :bool,
    :AW_UNIVERSE_ALLOW_TOURISTS => :bool,
    :AW_UNIVERSE_ALLOW_TOURISTS_CAV => :bool,
    :AW_UNIVERSE_CITIZEN_CHANGES_ALLOWED => :bool,
    :AW_UNIVERSE_REGISTRATION_REQUIRED => :bool,
    :AW_UNIVERSE_USER_LIST_ENABLED => :bool,
    :AW_UNIVERSE_OBJECT_PASSWORD => :data,
    :AW_UNIVERSE_BROWSER_BETA => :int,
    :AW_UNIVERSE_BROWSER_MINIMUM => :int,
    :AW_UNIVERSE_BROWSER_RELEASE => :int,
    :AW_UNIVERSE_BROWSER_RELEASE_22 => :int	 ,
    :AW_UNIVERSE_BUILD_NUMBER => :int,
    :AW_UNIVERSE_OBJECT_REFRESH => :int,
    :AW_UNIVERSE_REGISTER_METHOD => :int,
    :AW_UNIVERSE_TIME => :int,
    :AW_UNIVERSE_WORLD_BETA => :int,
    :AW_UNIVERSE_WORLD_MINIMUM => :int,
    :AW_UNIVERSE_WORLD_RELEASE => :int,
    :AW_UNIVERSE_ANNUAL_CHARGE => :string,
    :AW_UNIVERSE_CAV_PATH => :string,
    :AW_UNIVERSE_CAV_PATH2 => :string,
    :AW_UNIVERSE_MONTHLY_CHARGE => :string,
    :AW_UNIVERSE_NAME => :string,
    :AW_UNIVERSE_NOTEPAD_URL => :string,
    :AW_UNIVERSE_SEARCH_URL => :string,
    :AW_UNIVERSE_WELCOME_MESSAGE => :string,
    :AW_UNIVERSE_WORLD_START => :string,
    :AW_WORLD_ALLOW_3_AXIS_ROTATION => :bool,
    :AW_WORLD_ALLOW_AVATAR_COLLISION => :bool,
    :AW_WORLD_ALLOW_CITIZEN_WHISPER => :bool,
    :AW_WORLD_ALLOW_FLYING => :bool,
    :AW_WORLD_ALLOW_OBJECT_SELECT => :bool,
    :AW_WORLD_ALLOW_PASSTHRU => :bool,
    :AW_WORLD_ALLOW_TELEPORT => :bool,
    :AW_WORLD_ALLOW_TOURIST_BUILD => :bool,
    :AW_WORLD_ALLOW_TOURIST_WHISPER => :bool,
    :AW_WORLD_ALWAYS_SHOW_NAMES => :bool,
    :AW_WORLD_AMBIENT_LIGHT_BLUE => :int,
    :AW_WORLD_AMBIENT_LIGHT_GREEN => :int,
    :AW_WORLD_AMBIENT_LIGHT_RED => :int,
    :AW_WORLD_AVATAR_REFRESH_RATE => :int,
    :AW_WORLD_BACKDROP => :string,
    :AW_WORLD_BOTMENU_URL => :string,
    :AW_WORLD_BOTS_RIGHT => :string,
    :AW_WORLD_BUILD_CAPABILITY => :bool,
    :AW_WORLD_BUILD_NUMBER => :int,
    :AW_WORLD_BUILD_RIGHT => :string,
    :AW_WORLD_BUOYANCY => :float,
    :AW_WORLD_CAMERA_ZOOM => :float,
    :AW_WORLD_CARETAKER_CAPABILITY => :bool,
    :AW_WORLD_CAV_OBJECT_PASSWORD => :string,
    :AW_WORLD_CAV_OBJECT_PATH => :string,
    :AW_WORLD_CAV_OBJECT_REFRESH => :int,
    :AW_WORLD_CELL_LIMIT => :int,
    :AW_WORLD_CHAT_DISABLE_URL_CLICKS => :bool,
    :AW_WORLD_CLOUDS_LAYER1_MASK => :string,
    :AW_WORLD_CLOUDS_LAYER1_OPACITY => :int,
    :AW_WORLD_CLOUDS_LAYER1_SPEED_X => :float,
    :AW_WORLD_CLOUDS_LAYER1_SPEED_Z => :float,
    :AW_WORLD_CLOUDS_LAYER1_TEXTURE => :string,
    :AW_WORLD_CLOUDS_LAYER1_TILE => :float,
    :AW_WORLD_CLOUDS_LAYER2_MASK => :string,
    :AW_WORLD_CLOUDS_LAYER2_OPACITY => :int,
    :AW_WORLD_CLOUDS_LAYER2_SPEED_X => :float,
    :AW_WORLD_CLOUDS_LAYER2_SPEED_Z => :float,
    :AW_WORLD_CLOUDS_LAYER2_TEXTURE => :string,
    :AW_WORLD_CLOUDS_LAYER2_TILE => :float,
    :AW_WORLD_CLOUDS_LAYER3_MASK => :string,
    :AW_WORLD_CLOUDS_LAYER3_OPACITY => :int,
    :AW_WORLD_CLOUDS_LAYER3_SPEED_X => :float,
    :AW_WORLD_CLOUDS_LAYER3_SPEED_Z => :float,
    :AW_WORLD_CLOUDS_LAYER3_TEXTURE => :string,
    :AW_WORLD_CLOUDS_LAYER3_TILE => :float,
    :AW_WORLD_CREATION_TIMESTAMP => :int,
    :AW_WORLD_DISABLE_AVATAR_LIST => :bool,
    :AW_WORLD_DISABLE_CHAT => :bool,
    :AW_WORLD_DISABLE_CREATE_URL => :bool,
    :AW_WORLD_DISABLE_MULTIPLE_MEDIA => :bool,
    :AW_WORLD_DISABLE_SHADOWS => :bool,
    :AW_WORLD_EJECT_CAPABILITY => :bool,
    :AW_WORLD_EJECT_RIGHT => :string,
    :AW_WORLD_EMINENT_DOMAIN_CAPABILITY => :bool,
    :AW_WORLD_EMINENT_DOMAIN_RIGHT => :string,
    :AW_WORLD_ENABLE_BUMP_EVENT => :bool,
    :AW_WORLD_ENABLE_CAMERA_COLLISION => :bool,
    :AW_WORLD_ENABLE_CAV => :int,
    :AW_WORLD_ENABLE_PAV => :bool,
    :AW_WORLD_ENABLE_REFERER => :bool,
    :AW_WORLD_ENABLE_SYNC_EVENTS => :bool,
    :AW_WORLD_ENABLE_TERRAIN => :bool,
    :AW_WORLD_ENTER_RIGHT => :string,
    :AW_WORLD_ENTRY_POINT => :string,
    :AW_WORLD_EXPIRATION => :int,
    :AW_WORLD_FOG_BLUE => :int,
    :AW_WORLD_FOG_ENABLE => :bool,
    :AW_WORLD_FOG_GREEN => :int,
    :AW_WORLD_FOG_MAXIMUM => :int,
    :AW_WORLD_FOG_MINIMUM => :int,
    :AW_WORLD_FOG_RED => :int,
    :AW_WORLD_FOG_TINTED => :bool,
    :AW_WORLD_FRICTION => :float,
    :AW_WORLD_GRAVITY => :float,
    :AW_WORLD_GROUND => :string,
    :AW_WORLD_HOME_PAGE => :string,
    :AW_WORLD_KEYWORDS => :string,
    :AW_WORLD_LIGHT_BLUE => :int,
    :AW_WORLD_LIGHT_DRAW_BRIGHT => :bool,
    :AW_WORLD_LIGHT_DRAW_FRONT => :bool,
    :AW_WORLD_LIGHT_DRAW_SIZE => :int,
    :AW_WORLD_LIGHT_GREEN => :int,
    :AW_WORLD_LIGHT_MASK => :string,
    :AW_WORLD_LIGHT_RED => :int,
    :AW_WORLD_LIGHT_SOURCE_COLOR => :int,
    :AW_WORLD_LIGHT_SOURCE_USE_COLOR => :bool,
    :AW_WORLD_LIGHT_TEXTURE => :string,
    :AW_WORLD_LIGHT_X => :float,
    :AW_WORLD_LIGHT_Y => :float,
    :AW_WORLD_LIGHT_Z => :float,
    :AW_WORLD_MAX_LIGHT_RADIUS => :int,
    :AW_WORLD_MAX_USERS => :int,
    :AW_WORLD_MINIMUM_VISIBILITY => :int,
    :AW_WORLD_MOVER_EMPTY_RESET_TIMEOUT => :int,
    :AW_WORLD_MOVER_USED_RESET_TIMEOUT => :int,
    :AW_WORLD_NAME => :string,
    :AW_WORLD_OBJECT_COUNT => :int,
    :AW_WORLD_OBJECT_PASSWORD => :data,
    :AW_WORLD_OBJECT_PATH => :string,
    :AW_WORLD_OBJECT_REFRESH => :int,
    :AW_WORLD_PUBLIC_SPEAKER_CAPABILITY => :bool,
    :AW_WORLD_PUBLIC_SPEAKER_RIGHT => :string,
    :AW_WORLD_RATING => :int,
    :AW_WORLD_REPEATING_GROUND => :bool,
    :AW_WORLD_RESTRICTED_RADIUS => :int,
    :AW_WORLD_SIZE => :int,
    :AW_WORLD_SKY_BOTTOM_BLUE => :int,
    :AW_WORLD_SKY_BOTTOM_GREEN => :int,
    :AW_WORLD_SKY_BOTTOM_RED => :int,
    :AW_WORLD_SKY_EAST_BLUE => :int,
    :AW_WORLD_SKY_EAST_GREEN => :int,
    :AW_WORLD_SKY_EAST_RED => :int,
    :AW_WORLD_SKY_NORTH_BLUE => :int,
    :AW_WORLD_SKY_NORTH_GREEN => :int,
    :AW_WORLD_SKY_NORTH_RED => :int,
    :AW_WORLD_SKY_SOUTH_BLUE => :int,
    :AW_WORLD_SKY_SOUTH_GREEN => :int,
    :AW_WORLD_SKY_SOUTH_RED => :int,
    :AW_WORLD_SKY_TOP_BLUE => :int,
    :AW_WORLD_SKY_TOP_GREEN => :int,
    :AW_WORLD_SKY_TOP_RED => :int,
    :AW_WORLD_SKY_WEST_BLUE => :int,
    :AW_WORLD_SKY_WEST_GREEN => :int,
    :AW_WORLD_SKY_WEST_RED => :int,
    :AW_WORLD_SKYBOX => :string,
    :AW_WORLD_SLOPESLIDE_ENABLED => :bool,
    :AW_WORLD_SLOPESLIDE_MAX_ANGLE => :float,
    :AW_WORLD_SLOPESLIDE_MIN_ANGLE => :float,
    :AW_WORLD_SOUND_AMBIENT => :string,
    :AW_WORLD_SOUND_FOOTSTEP => :string,
    :AW_WORLD_SOUND_WATER_ENTER => :string,
    :AW_WORLD_SOUND_WATER_EXIT => :string,
    :AW_WORLD_SPEAK_CAPABILITY => :bool,
    :AW_WORLD_SPEAK_RIGHT => :string,
    :AW_WORLD_SPECIAL_COMMANDS => :string,
    :AW_WORLD_SPECIAL_COMMANDS_RIGHT => :string,
    :AW_WORLD_SPECIAL_OBJECTS_RIGHT => :string,
    :AW_WORLD_TERRAIN_AMBIENT => :float,
    :AW_WORLD_TERRAIN_DIFFUSE => :float,
    :AW_WORLD_TERRAIN_OFFSET => :float,
    :AW_WORLD_TERRAIN_RIGHT => :string,
    :AW_WORLD_TERRAIN_TIMESTAMP => :int,
    :AW_WORLD_TITLE => :string,
    :AW_WORLD_V4_OBJECTS_RIGHT => :string,
    :AW_WORLD_WAIT_LIMIT => :int,
    :AW_WORLD_WATER_BLUE => :int,
    :AW_WORLD_WATER_BOTTOM_MASK => :string,
    :AW_WORLD_WATER_BOTTOM_TEXTURE => :string,
    :AW_WORLD_WATER_ENABLED => :bool,
    :AW_WORLD_WATER_FRICTION => :float,
    :AW_WORLD_WATER_GREEN => :int,
    :AW_WORLD_WATER_LEVEL => :float,
    :AW_WORLD_WATER_MASK => :string,
    :AW_WORLD_WATER_OPACITY => :int,
    :AW_WORLD_WATER_RED => :int,
    :AW_WORLD_WATER_SPEED => :float,
    :AW_WORLD_WATER_SURFACE_MOVE => :float,
    :AW_WORLD_WATER_TEXTURE => :string,
    :AW_WORLD_WATER_UNDER_TERRAIN => :bool,
    :AW_WORLD_WATER_WAVE_MOVE => :float,
    :AW_WORLD_WATER_VISIBILITY => :int,
    :AW_WORLD_WELCOME_MESSAGE => :string,
    :AW_WORLD_VOIP_CONFERENCE_GLOBAL => :bool,
    :AW_WORLD_VOIP_MODERATE_GLOBAL => :bool,
    :AW_WORLD_VOIP_RIGHT => :string 
  }
    
  RETURN_CODE_MAP = {
    0 => {:error_symbol => :RC_SUCCESS, :error_explanation => "Success: Return value from an asynchronous call:	 	Request has been sent to the server.\nReturn value from a blocking call:	 	Operation has completed successfully.\nWhen passed to a callback:	 	Operation has completed successfully."},
    1 => {:error_symbol => :RC_CITIZENSHIP_EXPIRED, :error_explanation => "Citizenship has expired: Citizenship of the owner has expired."},
    2 => {:error_symbol => :RC_LAND_LIMIT_EXCEEDED, :error_explanation => "Land limit exceeded: Land limit of the universe would be exceeded if the world is started."},
    3 => {:error_symbol => :RC_NO_SUCH_CITIZEN, :error_explanation => "No such citizen: No citizenship with a matching citizen number was found."},
    5 => {:error_symbol => :RC_LICENSE_PASSWORD_CONTAINS_SPACE, :error_explanation => "License password contains space: Password cannot contain a space."},
    6 => {:error_symbol => :RC_LICENSE_PASSWORD_TOO_LONG, :error_explanation => "License password too long:  Password cannot be longer than 8 characters."},
    7 => {:error_symbol => :RC_LICENSE_PASSWORD_TOO_SHORT, :error_explanation => "License password too short: Password must be at least 2 characters."},
    8 => {:error_symbol => :RC_LICENSE_RANGE_TOO_LARGE, :error_explanation => "License range too large: Range must be smaller than 3275 hectometers. That is, at most 32750 coordinates N/S/W/E or 655000 meters across."},
    9 => {:error_symbol => :RC_LICENSE_RANGE_TOO_SMALL, :error_explanation => "License range too small: Range must be larger than 0 hectometers. That is, at least 10 coordinates N/S/W/E or 200 meters across."},
    10 => {:error_symbol => :RC_LICENSE_USERS_TOO_LARGE, :error_explanation => "License users too large: User limit cannot exceed 1024."},
    11 => {:error_symbol => :RC_LICENSE_USERS_TOO_SMALL, :error_explanation => "License users too small: User limit must be larger than 0."},
    13 => {:error_symbol => :RC_INVALID_PASSWORD, :error_explanation => "Invalid password: Unable to login due to invalid password."},
    15 => {:error_symbol => :RC_LICENSE_WORLD_TOO_SHORT, :error_explanation => "License world too short: Name must be at least 2 characters."},
    16 => {:error_symbol => :RC_LICENSE_WORLD_TOO_LONG, :error_explanation => "License world too long: Name cannot be longer than 8 characters."},
    20 => {:error_symbol => :RC_INVALID_WORLD, :error_explanation => "Invalid world: Unable to start the world due to invalid name or password."},
    21 => {:error_symbol => :RC_SERVER_OUTDATED, :error_explanation => "Server outdated: Server build either contains a serious flaw or is outdated and must be upgraded."},
    22 => {:error_symbol => :RC_WORLD_ALREADY_STARTED, :error_explanation => "World already started: World has already been started at a different location."},
    27 => {:error_symbol => :RC_NO_SUCH_WORLD, :error_explanation => "No such world: No world with a matching name has been started on the server."},
    32 => {:error_symbol => :RC_UNAUTHORIZED, :error_explanation => "Unauthorized: Not authorized to perform the operation."},
    33 => {:error_symbol => :RC_WORLD_ALREADY_EXISTS, :error_explanation => "World already exists: TODO: Might not be in use."},
    34 => {:error_symbol => :RC_NO_SUCH_LICENSE, :error_explanation => "No such license: No license with a matching world name was found."},
    57 => {:error_symbol => :RC_TOO_MANY_WORLDS, :error_explanation => "Too many worlds: Limit of started worlds in the universe would be exceeded if the world is started."},
    58 => {:error_symbol => :RC_MUST_UPGRADE, :error_explanation => "Must upgrade: SDK build either contains a serious flaw or is outdated and must be upgraded."},
    59 => {:error_symbol => :RC_BOT_LIMIT_EXCEEDED, :error_explanation => "Bot limit exceeded: Bot limit of the owner citizenship would be exceeded if the bot is logged in."},
    61 => {:error_symbol => :RC_WORLD_EXPIRED, :error_explanation => "World expired: Unable to start world due to its license having expired."},
    62 => {:error_symbol => :RC_CITIZEN_DOES_NOT_EXPIRE, :error_explanation => "Citizen does not expire: TODO: What is this used for?"},
    64 => {:error_symbol => :RC_LICENSE_STARTS_WITH_NUMBER, :error_explanation => "License starts with number: Name cannot start with a number."},
    66 => {:error_symbol => :RC_NO_SUCH_EJECTION, :error_explanation => "No such ejection: No ejection with a matching identifier was found."},
    67 => {:error_symbol => :RC_NO_SUCH_SESSION, :error_explanation => "No such session: No user with a matching session number has entered the world."},
    72 => {:error_symbol => :RC_WORLD_RUNNING, :error_explanation => "World running: World has already been started."},
    73 => {:error_symbol => :RC_WORLD_NOT_SET, :error_explanation => "World not set: World to perform the operation on has not been set."},
    74 => {:error_symbol => :RC_NO_SUCH_CELL, :error_explanation => "No such cell: No more cells left to enumerate."},
    75 => {:error_symbol => :RC_NO_REGISTRY, :error_explanation => "No registry: Unable to start world due to missing or invalid registry."},
    76 => {:error_symbol => :RC_CANT_OPEN_REGISTRY, :error_explanation => "Can't open registry"},
    77 => {:error_symbol => :RC_CITIZEN_DISABLED, :error_explanation => "Citizen disabled: Citizenship of the owner has been disabled."},
    78 => {:error_symbol => :RC_WORLD_DISABLED, :error_explanation => "World disabled: Unable to start world due to it having been disabled."},
    85 => {:error_symbol => :RC_TELEGRAM_BLOCKED, :error_explanation => "Telegram blocked"},
    88 => {:error_symbol => :RC_UNABLE_TO_UPDATE_TERRAIN, :error_explanation => "Unable to update terrain"},
    100 => {:error_symbol => :RC_EMAIL_CONTAINS_INVALID_CHAR, :error_explanation => "Email contains invalid char: Email address contains one or more invalid characters."},
    101 => {:error_symbol => :RC_EMAIL_ENDS_WITH_BLANK, :error_explanation => "Email ends with blank: Email address cannot end with a blank."},
    101 => {:error_symbol => :RC_NO_SUCH_OBJECT, :error_explanation => "No such object: Unable to find the object to delete."},
    102 => {:error_symbol => :RC_EMAIL_MISSING_DOT, :error_explanation => "Email missing dot: Email address must contain at least one '.'."},
    102 => {:error_symbol => :RC_NOT_DELETE_OWNER, :error_explanation => "Not delete owner"},
    103 => {:error_symbol => :RC_EMAIL_MISSING_AT, :error_explanation => "Email missing at: Email address must contain a '@'."},
    104 => {:error_symbol => :RC_EMAIL_STARTS_WITH_BLANK, :error_explanation => "Email starts with blank: Email address cannot start with a blank."},
    105 => {:error_symbol => :RC_EMAIL_TOO_LONG, :error_explanation => "Email too long: Email address cannot be longer than 50 characters."},
    106 => {:error_symbol => :RC_EMAIL_TOO_SHORT, :error_explanation => "Email too short: Email address must be at least 8 characters or longer."},
    107 => {:error_symbol => :RC_NAME_ALREADY_USED, :error_explanation => "Name already used: Citizenship with a matching name already exists."},
    108 => {:error_symbol => :RC_NAME_CONTAINS_NONALPHANUMERIC_CHAR, :error_explanation => "Name contains nonalphanumeric character: Name contains invalid character(s)."},
    109 => {:error_symbol => :RC_NAME_CONTAINS_INVALID_BLANK, :error_explanation => "Name contains invalid blank: Name contains invalid blank(s)."},
    111 => {:error_symbol => :RC_NAME_ENDS_WITH_BLANK, :error_explanation => "Name ends with blank: Name cannot end with a blank."},
    112 => {:error_symbol => :RC_NAME_TOO_LONG, :error_explanation => "Name too long: Name cannot be longer than 16 characters."},
    113 => {:error_symbol => :RC_NAME_TOO_SHORT, :error_explanation => "Name too short: Name must be at least 2 characters."},
    115 => {:error_symbol => :RC_PASSWORD_TOO_LONG, :error_explanation => "Password too long: Password cannot be longer than 12 characters."},
    116 => {:error_symbol => :RC_PASSWORD_TOO_SHORT, :error_explanation => "Password too short: Password must be at least 4 characters."},
    124 => {:error_symbol => :RC_UNABLE_TO_DELETE_CITIZEN, :error_explanation => "Unable to delete citizen: Unable to delete citizen due to a database problem."},
    126 => {:error_symbol => :RC_NUMBER_ALREADY_USED, :error_explanation => "Number already used: Citizenship with a matching citizen number already exists."},
    127 => {:error_symbol => :RC_NUMBER_OUT_OF_RANGE, :error_explanation => "Number out of range: Citizen number is larger than the auto-incremented field in the database."},
    128 => {:error_symbol => :RC_PRIVILEGE_PASSWORD_IS_TOO_SHORT, :error_explanation => "Privilege password is too short: Privilege password must be either empty or at least 4 characters."},
    129 => {:error_symbol => :RC_PRIVILEGE_PASSWORD_IS_TOO_LONG, :error_explanation => "Privilege password is too long: Password cannot be longer than 12 characters."},
    203 => {:error_symbol => :RC_NOT_CHANGE_OWNER, :error_explanation => "Not change owner: Not permitted to change the owner of an object. It requires eminent domain or caretaker capability."},
    204 => {:error_symbol => :RC_CANT_FIND_OLD_ELEMENT, :error_explanation => "Can't find old element: Unable to find the object to change."},
    212 => {:error_symbol => :RC_IMPOSTER, :error_explanation => "Imposter: Unable to enter world due to masquerading as someone else."},
    300 => {:error_symbol => :RC_ENCROACHES, :error_explanation => "Encroaches: Not allowed to encroach into another's property."},
    301 => {:error_symbol => :RC_OBJECT_TYPE_INVALID, :error_explanation => "Object type invalid"},
    303 => {:error_symbol => :RC_TOO_MANY_BYTES, :error_explanation => "Too many bytes: Cell limit would be exceeded."},
    306 => {:error_symbol => :RC_UNREGISTERED_OBJECT, :error_explanation => "Unregistered object: Model name does not exist in the registry."},
    308 => {:error_symbol => :RC_ELEMENT_ALREADY_EXISTS, :error_explanation => "Element already exists"},
    309 => {:error_symbol => :RC_RESTRICTED_COMMAND, :error_explanation => "Restricted command"},
    311 => {:error_symbol => :RC_OUT_OF_BOUNDS, :error_explanation => "Out of bounds"},
    313 => {:error_symbol => :RC_RESTRICTED_OBJECT, :error_explanation => "Restricted object: Not allowed to build with 'z' objects in this world."},
    314 => {:error_symbol => :RC_RESTRICTED_AREA, :error_explanation => "Restricted area: Not allowed to build within the restricted area of this world."},
    401 => {:error_symbol => :RC_NOT_YET, :error_explanation => "Not yet: Would exceed the maximum number of operations per second."},
    402 => {:error_symbol => :RC_TIMEOUT, :error_explanation => "Timeout: Synchronous operation timed out."},
    404 => {:error_symbol => :RC_UNABLE_TO_CONTACT_UNIVERSE, :error_explanation => "Unable to contact universe: Unable to establish a connection to the universe server."},
    439 => {:error_symbol => :RC_NO_CONNECTION, :error_explanation => "No connection: Connection to the server is down."},
    444 => {:error_symbol => :RC_NOT_INITIALIZED, :error_explanation => "Not initialized: SDK API has not been initialized (by calling aw_init)."},
    445 => {:error_symbol => :RC_NO_INSTANCE, :error_explanation => "No instance"},
    448 => {:error_symbol => :RC_INVALID_ATTRIBUTE, :error_explanation => "Invalid attribute"},
    449 => {:error_symbol => :RC_TYPE_MISMATCH, :error_explanation => "Type mismatch"},
    450 => {:error_symbol => :RC_STRING_TOO_LONG, :error_explanation => "String too long"},
    451 => {:error_symbol => :RC_READ_ONLY, :error_explanation => "Read only: Unable to set attribute due to it being read-only."},
    453 => {:error_symbol => :RC_INVALID_INSTANCE, :error_explanation => "Invalid instance"},
    454 => {:error_symbol => :RC_VERSION_MISMATCH, :error_explanation => "Version mismatch: Aw.h and Aw.dll (or libaw_sdk.so for Linux) are from different builds of the SDK."},
    464 => {:error_symbol => :RC_QUERY_IN_PROGRESS, :error_explanation => "Query in progress: A property query is already in progress."},
    466 => {:error_symbol => :RC_EJECTED, :error_explanation => "Ejected: Disconnected from world due to ejection."},
    467 => {:error_symbol => :RC_NOT_WELCOME, :error_explanation => "Not welcome: Citizenship of the owner does not have bot rights in the world."},
    471 => {:error_symbol => :RC_CONNECTION_LOST, :error_explanation => "Connection lost"},
    474 => {:error_symbol => :RC_NOT_AVAILABLE, :error_explanation => "Not available"},
    500 => {:error_symbol => :RC_CANT_RESOLVE_UNIVERSE_HOST, :error_explanation => "Can't resolve universe host"},
    505 => {:error_symbol => :RC_INVALID_ARGUMENT, :error_explanation => "Invalid argument"},
    514 => {:error_symbol => :RC_UNABLE_TO_UPDATE_CAV, :error_explanation => "Unable to update custom avatar"},
    515 => {:error_symbol => :RC_UNABLE_TO_DELETE_CAV, :error_explanation => "Unable to delete custom avatar"},
    516 => {:error_symbol => :RC_NO_SUCH_CAV, :error_explanation => "No such custom avatar"},
    521 => {:error_symbol => :RC_WORLD_INSTANCE_ALREADY_EXISTS, :error_explanation => "World instance already exists"},
    522 => {:error_symbol => :RC_WORLD_INSTANCE_INVALID, :error_explanation => "World instance invalid"},
    523 => {:error_symbol => :RC_PLUGIN_NOT_AVAILABLE, :error_explanation => "Plugin not available"},
    600 => {:error_symbol => :RC_DATABASE_ERROR, :error_explanation => "Database error"},
    4995 => {:error_symbol => :RC_Z_BUF_ERROR, :error_explanation => "Buffer error (zlib)	Not enough room in the output buffer."},
    4996 => {:error_symbol => :RC_Z_MEM_ERROR, :error_explanation => "Memory error (zlib): Memory could not be allocated for processing."},
    4997 => {:error_symbol => :RC_Z_DATA_ERROR, :error_explanation => "Data error (zlib): Input data was corrupted."}
  }
  
  RETURN_CODE_SYMBOL_MAP = begin
    h = {}
    RETURN_CODE_MAP.each_pair do |rc_int,hsh|
      h.merge!({hsh[:error_symbol] => {:rc => rc_int, :error_explanation => hsh[:error_explanation]}})
    end
    h
  end
  
end