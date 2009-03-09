/*-----------------------------------------------------------------------------
                       A c t i v e   W o r l d s   A P I
-----------------------------------------------------------------------------*/

/*-----------------------------------------------------------------------------
                  Copyright 1998-2006 Activeworlds Inc.
        Licensed Material -- Program Property of Activeworlds Inc.
-----------------------------------------------------------------------------*/

#ifndef __AW_H__
#define __AW_H__

#ifdef WIN32
#if !defined (AW_SDK) && !defined (AW_BROWSER) && !defined (AW_STATIC)
#define AWAPI     __declspec (dllimport)
#else
#define AWAPI
#endif
#else
#define AWAPI
#endif

#ifdef LINUX
#include <stdint.h>
#include <stdio.h>
#endif

#define AW_BUILD                    65

// Limits
#define AW_MAX_AVCHANGE_PER_SECOND  10
#define AW_MAX_MESSAGES_PER_SECOND  100
#define AW_MAX_WHISPERS_PER_SECOND  100
#define AW_MAX_BOTGRAMS_PER_SECOND  32
#define AW_MAX_ATTRIBUTE_LENGTH     255
#define AW_CELL_MIN                 -32767  // provided for old applications only

#ifdef __cplusplus
extern "C" {
#endif

/*-----------------------------------------------------------------------------
                          o b j e c t  v e r s i o n s
-----------------------------------------------------------------------------*/

#define AW_OBJECT_VERSION_CAMERA      1
#define AW_OBJECT_VERSION_PARTICLES   1
#define AW_OBJECT_VERSION_ZONE        1
#define AW_OBJECT_VERSION_MOVER       1

/*-----------------------------------------------------------------------------
                             a t t r i b u t e s
-----------------------------------------------------------------------------*/

typedef enum {
  AW_LOGIN_NAME,
  AW_LOGIN_PASSWORD,
  AW_LOGIN_OWNER,
  AW_LOGIN_PRIVILEGE_PASSWORD,
  AW_LOGIN_PRIVILEGE_NUMBER,
  AW_LOGIN_PRIVILEGE_NAME,
  AW_LOGIN_APPLICATION,
  AW_LOGIN_EMAIL,
  AW_UNIVERSE_BROWSER_MINIMUM,
  AW_UNIVERSE_BROWSER_RELEASE,
  AW_UNIVERSE_BROWSER_BETA,
  AW_UNIVERSE_WORLD_MINIMUM,
  AW_UNIVERSE_WORLD_START,
  AW_UNIVERSE_REGISTRATION_REQUIRED,
  AW_UNIVERSE_BUILD_NUMBER,
  AW_UNIVERSE_MONTHLY_CHARGE,
  AW_UNIVERSE_ANNUAL_CHARGE,
  AW_UNIVERSE_REGISTER_METHOD,
  AW_UNIVERSE_TIME,
  AW_UNIVERSE_CITIZEN_CHANGES_ALLOWED,
  AW_UNIVERSE_BROWSER_RELEASE_22,
  AW_UNIVERSE_WELCOME_MESSAGE,
  AW_UNIVERSE_WORLD_RELEASE,
  AW_UNIVERSE_WORLD_BETA,
  AW_UNIVERSE_ALLOW_TOURISTS,
  AW_UNIVERSE_SEARCH_URL,
  AW_UNIVERSE_NOTEPAD_URL,
  AW_UNIVERSE_NAME,
  AW_UNIVERSE_USER_LIST_ENABLED,
  AW_CITIZEN_NUMBER,
  AW_CITIZEN_NAME,
  AW_CITIZEN_PASSWORD,
  AW_CITIZEN_EMAIL,
  AW_CITIZEN_TIME_LEFT,
  AW_CITIZEN_PRIVILEGE_PASSWORD,
  AW_CITIZEN_IMMIGRATION_TIME,
  AW_CITIZEN_EXPIRATION_TIME,
  AW_CITIZEN_BETA,
  AW_CITIZEN_LAST_LOGIN,
  AW_CITIZEN_BOT_LIMIT,
  AW_CITIZEN_TOTAL_TIME,
  AW_CITIZEN_ENABLED,
  AW_CITIZEN_COMMENT,
  AW_CITIZEN_URL,
  AW_WORLD_NAME,
  AW_WORLD_TITLE,
  AW_WORLD_BACKDROP,
  AW_WORLD_GROUND,
  AW_WORLD_OBJECT_PATH,
  AW_WORLD_OBJECT_REFRESH,
  AW_WORLD_BUILD_RIGHT,
  AW_WORLD_EMINENT_DOMAIN_RIGHT,
  AW_WORLD_ENTER_RIGHT,
  AW_WORLD_SPECIAL_OBJECTS_RIGHT,
  AW_WORLD_FOG_RED,
  AW_WORLD_FOG_GREEN,
  AW_WORLD_FOG_BLUE,
  AW_WORLD_CARETAKER_CAPABILITY,
  AW_WORLD_RESTRICTED_RADIUS,
  AW_WORLD_PUBLIC_SPEAKER_CAPABILITY,
  AW_WORLD_PUBLIC_SPEAKER_RIGHT,
  AW_WORLD_CREATION_TIMESTAMP,
  AW_WORLD_HOME_PAGE,
  AW_WORLD_BUILD_NUMBER,
  AW_WORLD_OBJECT_PASSWORD,
  AW_WORLD_DISABLE_CREATE_URL,
  AW_WORLD_RATING,
  AW_WORLD_WELCOME_MESSAGE,
  AW_WORLD_EJECT_RIGHT,
  AW_WORLD_EJECT_CAPABILITY,
  AW_WORLD_CELL_LIMIT,
  AW_WORLD_BUILD_CAPABILITY,
  AW_WORLD_ALLOW_PASSTHRU,
  AW_WORLD_ALLOW_FLYING,
  AW_WORLD_ALLOW_TELEPORT,
  AW_WORLD_ALLOW_OBJECT_SELECT,
  AW_WORLD_BOTS_RIGHT,
  AW_WORLD_SPEAK_CAPABILITY,
  AW_WORLD_SPEAK_RIGHT,
  AW_WORLD_ALLOW_TOURIST_WHISPER,
  AW_WORLD_LIGHT_X,
  AW_WORLD_LIGHT_Y,
  AW_WORLD_LIGHT_Z,
  AW_WORLD_LIGHT_RED,
  AW_WORLD_LIGHT_GREEN,
  AW_WORLD_LIGHT_BLUE,
  AW_WORLD_AMBIENT_LIGHT_RED,
  AW_WORLD_AMBIENT_LIGHT_GREEN,
  AW_WORLD_AMBIENT_LIGHT_BLUE,
  AW_WORLD_ALLOW_AVATAR_COLLISION,
  AW_WORLD_FOG_ENABLE,
  AW_WORLD_FOG_MINIMUM,
  AW_WORLD_FOG_MAXIMUM,
  AW_WORLD_FOG_TINTED,
  AW_WORLD_MAX_USERS,
  AW_WORLD_SIZE,
  AW_WORLD_OBJECT_COUNT,
  AW_WORLD_EXPIRATION,
  AW_WORLD_SPECIAL_COMMANDS_RIGHT,
  AW_WORLD_MAX_LIGHT_RADIUS,
  AW_WORLD_SKYBOX,
  AW_WORLD_MINIMUM_VISIBILITY,
  AW_WORLD_REPEATING_GROUND,
  AW_WORLD_KEYWORDS,
  AW_WORLD_ENABLE_TERRAIN,
  AW_WORLD_ALLOW_3_AXIS_ROTATION,
  AW_WORLD_TERRAIN_TIMESTAMP,
  AW_WORLD_ENTRY_POINT,
  AW_WORLD_SKY_NORTH_RED,
  AW_WORLD_SKY_NORTH_GREEN,
  AW_WORLD_SKY_NORTH_BLUE,
  AW_WORLD_SKY_SOUTH_RED,
  AW_WORLD_SKY_SOUTH_GREEN,
  AW_WORLD_SKY_SOUTH_BLUE,
  AW_WORLD_SKY_EAST_RED,
  AW_WORLD_SKY_EAST_GREEN,
  AW_WORLD_SKY_EAST_BLUE,
  AW_WORLD_SKY_WEST_RED,
  AW_WORLD_SKY_WEST_GREEN,
  AW_WORLD_SKY_WEST_BLUE,
  AW_WORLD_SKY_TOP_RED,
  AW_WORLD_SKY_TOP_GREEN,
  AW_WORLD_SKY_TOP_BLUE,
  AW_WORLD_SKY_BOTTOM_RED,
  AW_WORLD_SKY_BOTTOM_GREEN,
  AW_WORLD_SKY_BOTTOM_BLUE,
  AW_WORLD_CLOUDS_LAYER1_TEXTURE,
  AW_WORLD_CLOUDS_LAYER1_MASK,
  AW_WORLD_CLOUDS_LAYER1_TILE,
  AW_WORLD_CLOUDS_LAYER1_SPEED_X,
  AW_WORLD_CLOUDS_LAYER1_SPEED_Z,
  AW_WORLD_CLOUDS_LAYER1_OPACITY,
  AW_WORLD_CLOUDS_LAYER2_TEXTURE,
  AW_WORLD_CLOUDS_LAYER2_MASK,
  AW_WORLD_CLOUDS_LAYER2_TILE,
  AW_WORLD_CLOUDS_LAYER2_SPEED_X,
  AW_WORLD_CLOUDS_LAYER2_SPEED_Z,
  AW_WORLD_CLOUDS_LAYER2_OPACITY,
  AW_WORLD_CLOUDS_LAYER3_TEXTURE,
  AW_WORLD_CLOUDS_LAYER3_MASK,
  AW_WORLD_CLOUDS_LAYER3_TILE,
  AW_WORLD_CLOUDS_LAYER3_SPEED_X,
  AW_WORLD_CLOUDS_LAYER3_SPEED_Z,
  AW_WORLD_CLOUDS_LAYER3_OPACITY,
  AW_WORLD_DISABLE_CHAT,
  AW_WORLD_ALLOW_CITIZEN_WHISPER,
  AW_WORLD_ALWAYS_SHOW_NAMES,
  AW_WORLD_DISABLE_AVATAR_LIST,
  AW_WORLD_AVATAR_REFRESH_RATE,
  AW_WORLD_WATER_TEXTURE,
  AW_WORLD_WATER_MASK,
  AW_WORLD_WATER_BOTTOM_TEXTURE,
  AW_WORLD_WATER_BOTTOM_MASK,
  AW_WORLD_WATER_OPACITY,
  AW_WORLD_WATER_RED,
  AW_WORLD_WATER_GREEN,
  AW_WORLD_WATER_BLUE,
  AW_WORLD_WATER_LEVEL,
  AW_WORLD_WATER_SURFACE_MOVE,
  AW_WORLD_WATER_WAVE_MOVE,
  AW_WORLD_WATER_SPEED,
  AW_WORLD_WATER_ENABLED,
  AW_WORLD_EMINENT_DOMAIN_CAPABILITY,
  AW_WORLD_LIGHT_TEXTURE,
  AW_WORLD_LIGHT_MASK,
  AW_WORLD_LIGHT_DRAW_SIZE,
  AW_WORLD_LIGHT_DRAW_FRONT,
  AW_WORLD_LIGHT_DRAW_BRIGHT,
  AW_WORLD_LIGHT_SOURCE_USE_COLOR,
  AW_WORLD_LIGHT_SOURCE_COLOR,
  AW_WORLD_TERRAIN_AMBIENT,
  AW_WORLD_TERRAIN_DIFFUSE,
  AW_WORLD_WATER_VISIBILITY,
  AW_WORLD_SOUND_FOOTSTEP,
  AW_WORLD_SOUND_WATER_ENTER,
  AW_WORLD_SOUND_WATER_EXIT,
  AW_WORLD_SOUND_AMBIENT,
  AW_WORLD_GRAVITY,
  AW_WORLD_BUOYANCY,
  AW_WORLD_FRICTION,
  AW_WORLD_WATER_FRICTION,
  AW_WORLD_SLOPESLIDE_ENABLED,
  AW_WORLD_SLOPESLIDE_MIN_ANGLE,
  AW_WORLD_SLOPESLIDE_MAX_ANGLE,
  AW_WORLD_ALLOW_TOURIST_BUILD,
  AW_WORLD_ENABLE_REFERER,
  AW_WORLD_WATER_UNDER_TERRAIN,
  AW_WORLD_TERRAIN_OFFSET,
  AW_WORLD_VOIP_RIGHT,
  AW_WORLD_DISABLE_MULTIPLE_MEDIA,
  AW_WORLD_BOTMENU_URL,
  AW_WORLD_ENABLE_BUMP_EVENT,
  AW_WORLD_ENABLE_SYNC_EVENTS,
  AW_WORLD_ENABLE_CAV,
  AW_WORLD_ENABLE_PAV,
  AW_WORLD_CHAT_DISABLE_URL_CLICKS,
  AW_WORLD_MOVER_EMPTY_RESET_TIMEOUT,
  AW_WORLD_MOVER_USED_RESET_TIMEOUT,
  AW_MY_X,
  AW_MY_Y,
  AW_MY_Z,
  AW_MY_YAW,
  AW_MY_PITCH,
  AW_MY_TYPE,
  AW_MY_GESTURE,
  AW_MY_STATE,
  AW_AVATAR_SESSION,
  AW_AVATAR_NAME,
  AW_AVATAR_X,
  AW_AVATAR_Y,
  AW_AVATAR_Z,
  AW_AVATAR_YAW,
  AW_AVATAR_PITCH,
  AW_AVATAR_TYPE,
  AW_AVATAR_GESTURE,
  AW_AVATAR_STATE,
  AW_AVATAR_ADDRESS,
  AW_AVATAR_VERSION,
  AW_AVATAR_CITIZEN,
  AW_AVATAR_PRIVILEGE,
  AW_AVATAR_LOCK,
  AW_AVATAR_FLAGS,
  AW_CHAT_SESSION,
  AW_CHAT_MESSAGE,
  AW_CELL_X,
  AW_CELL_Z,
  AW_CELL_SEQUENCE,
  AW_CELL_SIZE,
  AW_CELL_ITERATOR,
  AW_CELL_COMBINE,
  AW_OBJECT_ID,
  AW_OBJECT_NUMBER,
  AW_OBJECT_X,
  AW_OBJECT_Y,
  AW_OBJECT_Z,
  AW_OBJECT_YAW,
  AW_OBJECT_TILT,
  AW_OBJECT_ROLL,
  AW_OBJECT_MODEL,
  AW_OBJECT_DESCRIPTION,
  AW_OBJECT_ACTION,
  AW_OBJECT_OLD_NUMBER,
  AW_OBJECT_OLD_X,
  AW_OBJECT_OLD_Z,
  AW_OBJECT_OWNER,
  AW_OBJECT_SESSION,
  AW_OBJECT_BUILD_TIMESTAMP,
  AW_OBJECT_SYNC,
  AW_OBJECT_TYPE,
  AW_OBJECT_DATA,
  AW_QUERY_COMPLETE,
  AW_CHAT_TYPE,
  AW_LICENSE_NAME,
  AW_LICENSE_PASSWORD,
  AW_LICENSE_USERS,
  AW_LICENSE_RANGE,
  AW_LICENSE_EMAIL,
  AW_LICENSE_COMMENT,
  AW_LICENSE_CREATION_TIME,
  AW_LICENSE_EXPIRATION_TIME,
  AW_LICENSE_LAST_START,
  AW_LICENSE_LAST_ADDRESS,
  AW_LICENSE_HIDDEN,
  AW_LICENSE_ALLOW_TOURISTS,
  AW_LICENSE_VOIP,
  AW_LICENSE_PLUGINS,
  AW_WORLDLIST_NAME,
  AW_WORLDLIST_STATUS,
  AW_WORLDLIST_USERS,
  AW_WORLDLIST_RATING,
  AW_WORLDLIST_MORE,
  AW_EJECT_SESSION,
  AW_EJECT_DURATION,
  AW_EJECTION_TYPE,
  AW_EJECTION_ADDRESS,
  AW_EJECTION_EXPIRATION_TIME,
  AW_EJECTION_CREATION_TIME,
  AW_EJECTION_COMMENT,
  AW_DISCONNECT_REASON,
  AW_FILE_RECIPIENT,
  AW_FILE_SENDER,
  AW_FILE_SENDER_NAME,
  AW_FILE_SESSION,
  AW_FILE_ADDRESS,
  AW_FILE_PORT,
  AW_CLICKED_SESSION,
  AW_CLICKED_NAME,
  AW_URL_NAME,
  AW_URL_POST,
  AW_URL_TARGET,
  AW_URL_TARGET_3D,
  AW_TELEPORT_WORLD,
  AW_TELEPORT_X,
  AW_TELEPORT_Y,
  AW_TELEPORT_Z,
  AW_TELEPORT_YAW,
  AW_TELEPORT_WARP,
  AW_SERVER_BUILD,
  AW_SERVER_NAME,
  AW_SERVER_PASSWORD,
  AW_SERVER_REGISTRY,
  AW_SERVER_CARETAKERS,
  AW_SERVER_ID,
  AW_SERVER_INSTANCE,
  AW_SERVER_ENABLED,
  AW_SERVER_STATE,
  AW_SERVER_USERS,
  AW_SERVER_MAX_USERS,
  AW_SERVER_OBJECTS,
  AW_SERVER_SIZE,
  AW_SERVER_EXPIRATION,
  AW_SERVER_START_RC,
  AW_SERVER_MORE,
  AW_SERVER_TERRAIN_NODES,
  AW_TERRAIN_X,
  AW_TERRAIN_Z,
  AW_TERRAIN_PAGE_X,
  AW_TERRAIN_PAGE_Z,
  AW_TERRAIN_NODE_X,
  AW_TERRAIN_NODE_Z,
  AW_TERRAIN_NODE_SIZE,
  AW_TERRAIN_NODE_TEXTURE_COUNT,
  AW_TERRAIN_NODE_HEIGHT_COUNT,
  AW_TERRAIN_NODE_TEXTURES,
  AW_TERRAIN_NODE_HEIGHTS,
  AW_TERRAIN_SEQUENCE,
  AW_TERRAIN_COMPLETE,
  AW_TERRAIN_VERSION_NEEDED,
  AW_ENTER_GLOBAL,
  AW_CONSOLE_RED,
  AW_CONSOLE_GREEN,
  AW_CONSOLE_BLUE,
  AW_CONSOLE_BOLD,
  AW_CONSOLE_ITALICS,
  AW_CONSOLE_MESSAGE,
  AW_BOTGRAM_TO,
  AW_BOTGRAM_FROM,
  AW_BOTGRAM_FROM_NAME,
  AW_BOTGRAM_TYPE,
  AW_BOTGRAM_TEXT,
  AW_TOOLBAR_ID,
  AW_TOOLBAR_SESSION,
  AW_USERLIST_MORE,
  AW_USERLIST_NAME,
  AW_USERLIST_WORLD,
  AW_USERLIST_EMAIL,
  AW_USERLIST_CITIZEN,
  AW_USERLIST_PRIVILEGE,
  AW_USERLIST_STATE,
  AW_USERLIST_ADDRESS,
  AW_USERLIST_ID,
  AW_SOUND_NAME,
  AW_CAMERA_LOCATION_TYPE,
  AW_CAMERA_LOCATION_OBJECT,
  AW_CAMERA_LOCATION_SESSION,
  AW_CAMERA_TARGET_TYPE,
  AW_CAMERA_TARGET_OBJECT,
  AW_CAMERA_TARGET_SESSION,
  AW_PLUGIN_STRING,
  AW_BOTMENU_TO_SESSION,
  AW_BOTMENU_FROM_NAME,
  AW_BOTMENU_FROM_SESSION,
  AW_BOTMENU_QUESTION,
  AW_BOTMENU_ANSWER,

  // attributes below are not used by the SDK

  AW_CONTACT_NUMBER,
  AW_CONTACT_STATUS,
  AW_CONTACT_NAME,
  AW_CONTACT_WORLD,
  AW_CONTACT_MORE,
  AW_CONTACT_OPTIONS,
  AW_TELEGRAM_TO,
  AW_TELEGRAM_FROM,
  AW_TELEGRAM_TEXT,
  AW_TELEGRAM_SENT,
  AW_TELEGRAM_MORE,
  AW_JOIN_NAME,
  AW_JOIN_CITIZEN,
  AW_JOIN_WORLD,
  AW_JOIN_X,
  AW_JOIN_Y,
  AW_JOIN_Z,
  AW_JOIN_YAW,
  AW_REGISTER_CC_NAME,
  AW_REGISTER_CC_NUMBER,
  AW_REGISTER_CC_MONTH,
  AW_REGISTER_CC_YEAR,
  AW_REGISTER_ADDRESS,
  AW_REGISTER_CITY,
  AW_REGISTER_STATE,
  AW_REGISTER_ZIP,
  AW_REGISTER_PHONE_NUMBER,
  AW_REGISTER_BUSINESS_NAME,
  AW_REGISTER_VENDOR,
  AW_REGISTER_RESULT,
  AW_REGISTER_METHOD,
  AW_VOIP_DATA,

  // attributes below are used by the SDK

  AW_UNIVERSE_CAV_PATH,
  AW_CITIZEN_CAV_ENABLED,
  AW_CITIZEN_CAV_TEMPLATE,
  AW_CAV_TEMPL_NUMBER,
  AW_CAV_TEMPL_TYPE,
  AW_CAV_TEMPL_RATING,
  AW_CAV_TEMPL_NAME,
  AW_CAV_TEMPL_MODEL,
  AW_CAV_CITIZEN,
  AW_CAV_TEMPLATE,
  AW_CAV_TYPE,
  AW_CAV_RATING,
  AW_CAV_NAME,
  AW_CAV_MODEL,
  AW_CAV_KEYFRAME1SCALE,
  AW_CAV_KEYFRAME2SCALE,
  AW_CAV_HEIGHT,
  AW_CAV_SKINCOLOR,
  AW_CAV_HAIRCOLOR,
  AW_ENTITY_TYPE,
  AW_ENTITY_ID,
  AW_ENTITY_STATE,
  AW_ENTITY_FLAGS,
  AW_ENTITY_X,
  AW_ENTITY_Y,
  AW_ENTITY_Z,
  AW_ENTITY_YAW,
  AW_ENTITY_PITCH,
  AW_ENTITY_ROLL,
  AW_ENTITY_OWNER_SESSION,
  AW_ENTITY_OWNER_CITIZEN,
  AW_AVATAR_DISTANCE,
  AW_AVATAR_ANGLE,
  AW_AVATAR_Y_DELTA,
  AW_AVATAR_YAW_DELTA,
  AW_AVATAR_PITCH_DELTA,
  AW_AVATAR_WORLD_INSTANCE,
  AW_ATTRIB_SENDER_SESSION,
  AW_ENTITY_MODEL_NUM,
  AW_WORLD_V4_OBJECTS_RIGHT,
  AW_CITIZEN_LAST_ADDRESS,
  AW_HUD_ELEMENT_TYPE,
  AW_HUD_ELEMENT_ID,
  AW_HUD_ELEMENT_SESSION,
  AW_HUD_ELEMENT_ORIGIN,
  AW_HUD_ELEMENT_X,
  AW_HUD_ELEMENT_Y,
  AW_HUD_ELEMENT_Z,
  AW_HUD_ELEMENT_FLAGS,
  AW_HUD_ELEMENT_TEXT,
  AW_HUD_ELEMENT_COLOR,
  AW_HUD_ELEMENT_OPACITY,
  AW_HUD_ELEMENT_SIZE_X,
  AW_HUD_ELEMENT_SIZE_Y,
  AW_HUD_ELEMENT_SIZE_Z,
  AW_HUD_ELEMENT_CLICK_X,
  AW_HUD_ELEMENT_CLICK_Y,
  AW_HUD_ELEMENT_CLICK_Z,
  AW_HUD_ELEMENT_TEXTURE_OFFSET_X,
  AW_HUD_ELEMENT_TEXTURE_OFFSET_Y,

  AW_CITIZEN_PRIVACY,
  AW_CITIZEN_TRIAL,
  AW_UNIVERSE_CAV_PATH2,

  AW_MAX_ATTRIBUTE
} AW_ATTRIBUTE;

typedef enum {
  AW_EVENT_AVATAR_ADD,
  AW_EVENT_AVATAR_CHANGE,
  AW_EVENT_AVATAR_DELETE,
  AW_EVENT_CELL_BEGIN,
  AW_EVENT_CELL_OBJECT,
  AW_EVENT_CELL_END,
  AW_EVENT_CHAT,
  AW_EVENT_OBJECT_ADD,
  AW_EVENT_OBJECT_DELETE,
  AW_EVENT_UNIVERSE_ATTRIBUTES,
  AW_EVENT_UNIVERSE_DISCONNECT,
  AW_EVENT_WORLD_ATTRIBUTES,
  AW_EVENT_WORLD_INFO,
  AW_EVENT_WORLD_DISCONNECT,
  AW_EVENT_SEND_FILE,
  AW_EVENT_CONTACT_STATE,
  AW_EVENT_TELEGRAM,
  AW_EVENT_JOIN,
  AW_EVENT_OBJECT_CLICK,
  AW_EVENT_OBJECT_SELECT,
  AW_EVENT_AVATAR_CLICK,
  AW_EVENT_URL,
  AW_EVENT_URL_CLICK,
  AW_EVENT_TELEPORT,
  AW_EVENT_ADMIN_WORLD_INFO,
  AW_EVENT_ADMIN_WORLD_DELETE,
  AW_EVENT_TERRAIN_BEGIN,
  AW_EVENT_TERRAIN_DATA,
  AW_EVENT_TERRAIN_END,
  AW_EVENT_CONSOLE_MESSAGE,
  AW_EVENT_TERRAIN_CHANGED,
  AW_EVENT_BOTGRAM,
  AW_EVENT_TOOLBAR_CLICK,
  AW_EVENT_USER_INFO,
  AW_EVENT_VOIP_DATA,
  AW_EVENT_NOISE,
  AW_EVENT_CAMERA,
  AW_EVENT_BOTMENU,
  AW_EVENT_OBJECT_BUMP,
  AW_EVENT_ENTITY_ADD,
  AW_EVENT_ENTITY_CHANGE,
  AW_EVENT_ENTITY_DELETE,
  AW_EVENT_ENTITY_RIDER_ADD,
  AW_EVENT_ENTITY_RIDER_DELETE,
  AW_EVENT_ENTITY_RIDER_CHANGE,
  AW_EVENT_AVATAR_RELOAD,
  AW_EVENT_ENTITY_LINKS,
  AW_EVENT_HUD_CLICK,
  AW_EVENT_HUD_CREATE,
  AW_EVENT_HUD_DESTROY,
  AW_EVENT_HUD_CLEAR,
  AW_MAX_EVENT
} AW_EVENT_ATTRIBUTE;

typedef enum {
  AW_CALLBACK_CREATE,
  AW_CALLBACK_LOGIN,
  AW_CALLBACK_ENTER,
  AW_CALLBACK_OBJECT_RESULT,
  AW_CALLBACK_LICENSE_ATTRIBUTES,
  AW_CALLBACK_LICENSE_RESULT,
  AW_CALLBACK_CITIZEN_ATTRIBUTES,
  AW_CALLBACK_CITIZEN_RESULT,
  AW_CALLBACK_QUERY,
  AW_CALLBACK_WORLD_LIST,
  AW_CALLBACK_SEND_FILE,
  AW_CALLBACK_JOIN,
  AW_CALLBACK_PASSWORD_SEND,
  AW_CALLBACK_IMMIGRATE,
  AW_CALLBACK_REGISTER,
  AW_CALLBACK_UNIVERSE_EJECTION,
  AW_CALLBACK_UNIVERSE_EJECTION_RESULT,
  AW_CALLBACK_ADDRESS,
  AW_CALLBACK_WORLD_EJECTION,
  AW_CALLBACK_WORLD_EJECTION_RESULT,
  AW_CALLBACK_ADMIN_WORLD_LIST,
  AW_CALLBACK_ADMIN_WORLD_RESULT,
  AW_CALLBACK_DELETE_ALL_OBJECTS_RESULT,
  AW_CALLBACK_CELL_RESULT,
  AW_CALLBACK_RELOAD_REGISTRY,
  AW_CALLBACK_ATTRIBUTES_RESET_RESULT,
  AW_CALLBACK_ADMIN,
  AW_CALLBACK_CONTACT_ADD,
  AW_CALLBACK_TELEGRAM_RESULT,
  AW_CALLBACK_TERRAIN_SET_RESULT,
  AW_CALLBACK_TERRAIN_NEXT_RESULT,
  AW_CALLBACK_TERRAIN_DELETE_ALL_RESULT,
  AW_CALLBACK_TERRAIN_LOAD_NODE_RESULT,
  AW_CALLBACK_BOTGRAM_RESULT,
  AW_CALLBACK_USER_LIST,
  AW_CALLBACK_BOTMENU_RESULT,
  AW_CALLBACK_CAV_TEMPLATE,
  AW_CALLBACK_CAV_TEMPLATE_RESULT,
  AW_CALLBACK_CAV,
  AW_CALLBACK_CAV_RESULT,
  AW_CALLBACK_WORLD_INSTANCE,
  AW_CALLBACK_HUD_RESULT,
  AW_CALLBACK_AVATAR_LOCATION,
  AW_MAX_CALLBACK
} AW_CALLBACK;

typedef enum {
  AW_CHAT_SAID,
  AW_CHAT_BROADCAST,
  AW_CHAT_WHISPER,
} AW_CHAT_TYPES;

typedef enum {
  AW_CONTACT_OFFLINE,
  AW_CONTACT_ONLINE,
  AW_CONTACT_NOT_A_CITIZEN,
  AW_CONTACT_AFK,
  AW_CONTACT_UNKNOWN,
  AW_CONTACT_DELETE,
} AW_CONTACT_STATES;

typedef enum {
  AW_WORLDSTATUS_UNKNOWN,
  AW_WORLDSTATUS_PUBLIC,
  AW_WORLDSTATUS_PRIVATE,
  AW_WORLDSTATUS_STOPPED
} AW_WORLD_STATES;

typedef enum {
  AW_SERVER_STOPPED,
  AW_SERVER_STARTING,
  AW_SERVER_START_WAIT,
  AW_SERVER_RUNNING
} AW_SERVER_STATES;

typedef enum {
  AW_CONNECTION_DIRECT,
  AW_CONNECTION_FIREWALL_NO_PROXY,
  AW_CONNECTION_PROXY_AUTO,
  AW_CONNECTION_PROXY_NO_AUTH,
  AW_CONNECTION_PROXY_BASIC,
  AW_CONNECTION_PROXY_AUTH_NTLM,
  AW_CONNECTION_MAX
} AW_CONNECTION_TYPES;

typedef enum {
  AW_CONNECTION_STATE_NOT_CONNECTED,
  AW_CONNECTION_STATE_CONNECTING_TO_PROXY,
  AW_CONNECTION_STATE_NEGOTIATING_WITH_PROXY,
  AW_CONNECTION_STATE_CONNECTING_TO_TUNNEL,
  AW_CONNECTION_STATE_CONNECTING_TO_UNIVERSE,
  AW_CONNECTION_STATE_CONNECTED,
  AW_CONNECTION_STATE_PASSWORD_REQUIRED,
} AW_CONNECTION_STATES;

typedef enum {
  AW_EJECT_BY_ADDRESS,
  AW_EJECT_BY_COMPUTER,
  AW_EJECT_BY_CITIZEN
} AW_EJECTION_TYPES;

typedef enum {
  AW_AVATAR_STATE_WALKING,
  AW_AVATAR_STATE_RUNNING,
  AW_AVATAR_STATE_FLYING,
  AW_AVATAR_STATE_SWIMMING,
  AW_AVATAR_STATE_FALLING,
  AW_AVATAR_STATE_JUMPING,
  AW_AVATAR_STATE_WARPING,
  AW_AVATAR_STATE_RIDING,
  AW_AVATAR_STATE_SLIDING1,
  AW_AVATAR_STATE_SLIDING2,
  AW_AVATAR_STATE_SLIDING3,
  AW_AVATAR_STATE_CLIMBING,
} AW_AVATAR_STATES;

typedef enum {
  AW_ZONE_TYPE_CUBE,
  AW_ZONE_TYPE_CYLINDER,
  AW_ZONE_TYPE_SPHERE,
} AW_ZONE_TYPES;

typedef enum {
  AW_PARTICLE_TYPE_SPRITE,
  AW_PARTICLE_TYPE_FACER,
  AW_PARTICLE_TYPE_FLAT,
  AW_PARTICLE_TYPE_OBJECT,
} AW_PARTICLE_TYPES;

typedef enum {
  AW_PARTICLE_DRAW_NORMAL,
  AW_PARTICLE_DRAW_BRIGHT,
  AW_PARTICLE_DRAW_GLOW
} AW_PARTICLE_DRAW_STYLES;

typedef enum {
  AW_CAMERA_TRACK_DEFAULT,
  AW_CAMERA_TRACK_AVATAR,
  AW_CAMERA_TRACK_OBJECT,
  AW_CAMERA_TRACK_AHEAD
} AW_CAMERA_TYPES;

typedef enum {
  AW_REGISTER_MONTHLY,
  AW_REGISTER_ANNUAL,
  AW_REGISTER_USER
} AW_REGISTER_METHODS;

typedef enum {
  AW_AVATAR_SET_NONE      = 0x00,
  AW_AVATAR_SET_POSITION  = 0x01,
  AW_AVATAR_SET_TYPE      = 0x02,
  AW_AVATAR_SET_GESTURE   = 0x04,
  AW_AVATAR_SET_STATE     = 0x08
} AW_AVATAR_SET_FLAGS;

typedef enum {
  AW_ENTITY_AVATAR, // not used as such
  AW_ENTITY_MOVER,
} AW_ENTITY_TYPES;

typedef enum {
  AW_MOVER_STATE_IDLE,    // never set by SDK
  AW_MOVER_STATE_START,
  AW_MOVER_STATE_MOVE,    // never set by SDK
  AW_MOVER_STATE_PAUSE,
  AW_MOVER_STATE_CONTINUE,
  AW_MOVER_STATE_STOP,
  AW_MOVER_STATE_RESET,
} AW_MOVER_STATE_TYPES;

typedef enum {
  AW_MOVER_FLAG_LOOP                  = 0x00000001,
  AW_MOVER_FLAG_USE_OBJTAG            = 0x00000002,
  AW_MOVER_FLAG_BUMP_ADD              = 0x00000004,
  AW_MOVER_FLAG_CLICK_START           = 0x00000008,
  AW_MOVER_FLAG_CLICK_PAUSE           = 0x00000010,
  AW_MOVER_FLAG_LOCK_POSITION         = 0x00000020,
  AW_MOVER_FLAG_LOCK_YAW              = 0x00000040,
  AW_MOVER_FLAG_LOCK_PITCH            = 0x00000080,
  AW_MOVER_FLAG_SINGLE_RIDER          = 0x00000100,
  AW_MOVER_FLAG_NO_AUTO_YAW           = 0x00000200,
  AW_MOVER_FLAG_EMPTY_RESET           = 0x00000400,
  AW_MOVER_FLAG_DISABLE_FLYING        = 0x00000800,
  AW_MOVER_FLAG_KEEP_ON_WATER         = 0x00001000,
  AW_MOVER_FLAG_DISABLE_UPWARDS       = 0x00002000,
  AW_MOVER_FLAG_INVISIBLE_AV          = 0x00004000,
  AW_MOVER_FLAG_EXIT_EJECT_UP         = 0x00008000,
  AW_MOVER_FLAG_EXIT_NON_SOLID        = 0x00010000,
  AW_MOVER_FLAG_AV_APPLY_TILT_X       = 0x00020000,
  AW_MOVER_FLAG_AV_APPLY_TILT_Z       = 0x00040000,
  AW_MOVER_FLAG_OBJECT_LINK           = 0x00080000,
  AW_MOVER_FLAG_DISABLE_MOVE          = 0x00100000,
  AW_MOVER_FLAG_TILT_BY_TERRAIN       = 0x00200000,
  AW_MOVER_FLAG_DISABLE_EXPL_SEQS     = 0x00400000,
  AW_MOVER_FLAG_DISABLE_TURN_ON_PLACE = 0x00800000,
  AW_MOVER_FLAG_DISABLE_TELEPORTS     = 0x01000000,
  AW_MOVER_FLAG_DETACH_ON_TELEPORT    = 0x02000000,
} AW_MOVER_FLAGS;

typedef enum {
  AW_MOVER_TYPE_PASSIVE,
  AW_MOVER_TYPE_ACTIVE,
  AW_MOVER_TYPE_ITEM,
} AW_MOVER_TYPES;

typedef enum {
  AW_ZONE_FLAG_WATER              = 0x01,
  AW_ZONE_FLAG_BLOCK_PARTICLES    = 0x02,
  AW_ZONE_FLAG_BLOCK_LIGHTS       = 0x04,
  AW_ZONE_FLAG_BLOCK_WORLD_LIGHT  = 0x08,
  AW_ZONE_FLAG_BLOCK_CHAT         = 0x10,
  AW_ZONE_FLAG_VISIBLE            = 0x20,
  AW_ZONE_FLAG_BLOCK_JOIN         = 0x40,
} AW_ZONE_FLAGS;

typedef enum {
  AW_PARTICLE_FLAG_INTERPOLATE    = 0x01,
  AW_PARTICLE_FLAG_GRAVITY        = 0x02,
  AW_PARTICLE_FLAG_COLLIDE_ZONES  = 0x04,
  AW_PARTICLE_FLAG_ZONE_EXCLUSIVE = 0x08,
  AW_PARTICLE_FLAG_CAMERA_EMIT    = 0x10,
  AW_PARTICLE_FLAG_MOVER_LINK     = 0x20,
} AW_PARTICLE_FLAGS;

typedef enum {
  AW_CAMERA_FLAG_TRACK_USER       = 0x01,
} AW_CAMERA_FLAGS;

typedef enum {
  AW_OBJECT_TYPE_V3       = 0,
  AW_OBJECT_TYPE_UNKNOWN,
  AW_OBJECT_TYPE_ZONE,
  AW_OBJECT_TYPE_PARTICLES,
  AW_OBJECT_TYPE_MOVER,
  AW_OBJECT_TYPE_CAMERA,
  AW_MAX_OBJECT_TYPES
} AW_OBJECT_TYPES;

typedef enum {
	AW_HUD_ORIGIN_TOP_LEFT  = 0,
	AW_HUD_ORIGIN_TOP,
	AW_HUD_ORIGIN_TOP_RIGHT,
	AW_HUD_ORIGIN_LEFT,
	AW_HUD_ORIGIN_CENTER,
	AW_HUD_ORIGIN_RIGHT,
	AW_HUD_ORIGIN_BOTTOM_LEFT,
	AW_HUD_ORIGIN_BOTTOM,
	AW_HUD_ORIGIN_BOTTOM_RIGHT,
} AW_HUD_ORIGIN_TYPES;

typedef enum {
	AW_HUD_TYPE_TEXT  = 0,
	AW_HUD_TYPE_IMAGE,
	AW_HUD_TYPE_MODEL,
} AW_HUD_TYPES;

typedef enum {
  AW_HUD_ELEMENT_FLAG_CLICKS        = 0x0001,
  AW_HUD_ELEMENT_FLAG_STRETCH       = 0x0002,
  AW_HUD_ELEMENT_FLAG_ADDITIVE      = 0x0004,
  AW_HUD_ELEMENT_FLAG_SIZE_PERCENT  = 0x0008,
  AW_HUD_ELEMENT_FLAG_TRANSITION    = 0x0010,
  AW_HUD_ELEMENT_FLAG_TEMPORARY     = 0x0020,
  AW_HUD_ELEMENT_FLAG_UNIVERSE_PATH = 0x0040,
  AW_HUD_ELEMENT_FLAG_CLAMP         = 0x0080,
  AW_HUD_ELEMENT_FLAG_HIGHLIGHT     = 0x0100,
} AW_HUD_ELEMENT_FLAGS_ENUM;

typedef enum {
  AW_PRIVACY_BLOCK_TELEGRAMS  = 0x0001,
} AW_PRIVACY_TYPES;


/*-----------------------------------------------------------------------------
                         v a r i a b l e s   t y p e s
-----------------------------------------------------------------------------*/
#ifdef LINUX
#pragma pack (push)           // Store current structure packing alignment
#else
#pragma pack (push, aw_api)           // Store current structure packing alignment
#endif
#pragma pack (1)

// 3D vector
typedef struct aw_type_vector {
  float x;
  float y;
  float z;
} aw_type_vector;

// 3D vector range, min and max
typedef struct aw_type_vector_range {
  aw_type_vector  min;
  aw_type_vector  max;
} aw_type_vector_range;

/*-----------------------------------------------------------------------------
               o b j e c t  t y p e  d a t a  s t r u c t u r e s
-----------------------------------------------------------------------------*/

// AW_OBJECT_TYPE_ZONE
typedef struct aw_object_data_zone {
  aw_type_vector        size;         // BBox, MUST be first item in struct!
  unsigned char         version;      // structure version (set by SDK)
  unsigned char         shape;
  char                  priority;
  float                 gravity;
  float                 friction;
  unsigned short        flags;        // boolean flags
  unsigned long         color;        // COLORREF
  unsigned short        fog_min;
  unsigned short        fog_max;
  unsigned short        footstep_len; // length of 1st string in str_data
  unsigned short        ambient_len;  // length of 2nd string in str_data
  unsigned char         camera_len;   // length of 3rd string in str_data
  unsigned char         target_cur_len; // length of 4th string in str_data
  char                  reserved[11]; // Bytes reserverd for future use
  // note: increase the strucure's total size
  // by the length of the strings
  // when allocating memory for this structure!
  // (str_data is the reference to the first byte)
  char                  str_data[1];
} aw_object_data_zone;

// AW_OBJECT_TYPE_PARTICLES
typedef struct aw_object_data_particles {
  aw_type_vector_range  volume;           // BBox, MUST be first item in struct!
  unsigned char         version;          // structure version (set by SDK)
  aw_type_vector_range  speed;
  aw_type_vector_range  accel;
  aw_type_vector_range  angle;
  aw_type_vector_range  spin;
  aw_type_vector_range  size;
  unsigned long         release_min;      // time in ms
  unsigned long         release_max;      // time in ms
  unsigned short        release_size;     // # of particles released
  unsigned long         lifespan;         // time in ms
  unsigned long         emitter_lifespan; // time in ms
  unsigned long         fade_in;          // time in ms
  unsigned long         fade_out;         // time in ms
  unsigned long         color_start;      // COLORREF
  unsigned long         color_end;        // COLORREF
  float                 opacity;
  unsigned char         render_style;
  unsigned short        flags;            // boolean flags (interp, collide, gravity)
  unsigned char         style;
  unsigned short        asset_list_len;   // length of 1st string in str_data
  unsigned char         name_len;         // length of 2nd string in str_data
  char                  reserved[12];     // Bytes reserverd for future use
  // note: increase the strucure's total size
  // by the length of the strings
  // when allocating memory for this structure!
  // (str_data is the reference to the first byte)
  char                  str_data[1];
} aw_object_data_particles;

// AW_OBJECT_TYPE_CAMERA
typedef struct aw_object_data_camera {
  unsigned char         version;      // structure version (set by SDK)
  unsigned short        flags;
  float                 zoom;
  unsigned char         name_len;     // length of 1st string in str_data
  char                  reserved[12]; // Bytes reserverd for future use
  // note: increase the strucure's total size
  // by the length of the strings
  // when allocating memory for this structure!
  // (str_data is the reference to the first byte)
  char                  str_data[1];
} aw_object_data_camera;

// AW_OBJECT_TYPE_MOVER
typedef struct aw_object_data_mover {
  unsigned char         version;          // structure version (set by SDK)
  unsigned char         type;
  unsigned int          flags;
  short                 locked_pos_x;
  short                 locked_pos_y;
  short                 locked_pos_z;
  short                 locked_yaw;
  short                 locked_pitch;
  char                  glide_factor;     // -100 to +100
  unsigned char         speed_factor;     // 0.0 to 25.5 max (* 10)
  unsigned char         friction_factor;  // 0.0 to 25.5 max (* 10)
  char                  accel_tilt_x;     // -127 to +127
  char                  accel_tilt_z;     // -127 to +127
  unsigned char         turn_factor;      // 0.0 to 25.5 max (* 10)
  unsigned char         avatar_tag;       // 0 to 255
  char                  reserved1[9];     // Bytes reserverd for future use
  unsigned char         name_len;         // length of 1st string in str_data
  unsigned char         seq_len;          // length of 2nd string in str_data
  unsigned char         script_len;       // length of 3rd string in str_data
  unsigned char         sound_len;        // length of 4rd string in str_data
  unsigned short        waypoints_len;    // length of 5th string in str_data
  unsigned char         bump_name_len;    // length of 6th string in str_data
  char                  reserved2[2];     // Bytes reserverd for future use
  // note: increase the strucure's total size
  // by the length of the strings
  // when allocating memory for this structure!
  // (str_data is the reference to the first byte)
  char                  str_data[1];
} aw_object_data_mover;

typedef struct aw_waypoint {
  short           x;
  short           y;
  short           z;
  short           yaw;
  short           pitch;
  short           roll;
  unsigned short  speed;
  unsigned char   pause;
  unsigned short  flag;
} aw_waypoint;

#ifdef LINUX
#pragma pack (pop)                    // Since no more push called, we can have the default popped back
#else
#pragma pack (pop, aw_api)            // Restore structure packing alignment
#endif

/*-----------------------------------------------------------------------------
                                 m e t h o d s
-----------------------------------------------------------------------------*/

AWAPI int   aw_init (int build);
#ifdef BINDTOIP
AWAPI int   aw_init_bind (int build, unsigned long Addr);
#endif
AWAPI void  aw_term (void);
AWAPI int   aw_create (const char* domain, int port, void** instance);
AWAPI int   aw_create_resolved (unsigned long address, int port, void** instance);
AWAPI int   aw_destroy (void);
AWAPI void* aw_instance (void);
AWAPI int   aw_instance_set (void *instance);
AWAPI int   aw_login (void);
AWAPI int   aw_wait (int milliseconds);
AWAPI int   aw_int (AW_ATTRIBUTE a);
AWAPI int   aw_int_set (AW_ATTRIBUTE a, int value);
AWAPI char* aw_string (AW_ATTRIBUTE a);
AWAPI int   aw_string_set (AW_ATTRIBUTE a, const char* value);
AWAPI int   aw_bool (AW_ATTRIBUTE a);
AWAPI int   aw_bool_set (AW_ATTRIBUTE a, int value);
AWAPI float aw_float (AW_ATTRIBUTE a);
AWAPI int   aw_float_set (AW_ATTRIBUTE a, float value);
AWAPI char* aw_data (AW_ATTRIBUTE a, unsigned int* length);
AWAPI int   aw_data_set (AW_ATTRIBUTE a, const char* value, unsigned int length);
AWAPI void  (*aw_callback (AW_CALLBACK c))(int rc);
AWAPI int   aw_callback_set (AW_CALLBACK c, void (*callback) (int rc));
AWAPI int   aw_instance_callback_set (AW_CALLBACK c, void (*callback) (int rc));
AWAPI void  (*aw_event (AW_EVENT_ATTRIBUTE a))(void);
AWAPI int   aw_event_set (AW_EVENT_ATTRIBUTE a, void (*handler) (void));
AWAPI int   aw_instance_event_set (AW_EVENT_ATTRIBUTE a, void (*handler) (void));
AWAPI int   aw_enter (const char* world);
AWAPI int   aw_exit (void);
AWAPI int   aw_say (const char* message);
AWAPI int   aw_whisper (int session_id, const char* message);
AWAPI int   aw_state_change (void);
AWAPI int   aw_citizen_attributes_by_name (const char* name);
AWAPI int   aw_citizen_attributes_by_number (int citizen);
AWAPI int   aw_citizen_add (void);
AWAPI int   aw_citizen_change (void);
AWAPI int   aw_citizen_delete (int citizen);
AWAPI int   aw_citizen_next (void);
AWAPI int   aw_citizen_previous (void);
AWAPI int   aw_license_add (void);
AWAPI int   aw_license_attributes (const char* name);
AWAPI int   aw_license_change (void);
AWAPI int   aw_license_delete (const char* name);
AWAPI int   aw_license_next (void);
AWAPI int   aw_license_previous (void);
AWAPI int   aw_world_list (void);
AWAPI int   aw_object_add (void);
AWAPI int   aw_object_change (void);
AWAPI int   aw_object_delete (void);
AWAPI int   aw_object_load (void);
AWAPI int   aw_query (int x_sector, int z_sector, int sequence[3][3]);
AWAPI int   aw_query_5x5 (int x_sector, int z_sector, int sequence[5][5]);
AWAPI int   aw_random (void);
AWAPI int   aw_world_attributes_change (void);
AWAPI int   aw_universe_attributes_change (void);
AWAPI int   aw_session (void);
AWAPI int   aw_world_eject (void);
AWAPI int   aw_sector_from_cell (int cell);
AWAPI int   aw_universe_ejection_add (void);
AWAPI int   aw_universe_ejection_delete (int address);
AWAPI int   aw_universe_ejection_lookup (void);
AWAPI int   aw_universe_ejection_next (void);
AWAPI int   aw_universe_ejection_previous (void);
AWAPI int   aw_object_click (void);
AWAPI int   aw_object_select (void);
AWAPI int   aw_avatar_click (int session_id);
AWAPI int   aw_address (int session_id);
AWAPI int   aw_url_send (int session_id, const char* url, const char* target);
AWAPI int   aw_url_click (const char* url);
AWAPI int   aw_teleport (int session_id);
AWAPI int   aw_world_ejection_add (void);
AWAPI int   aw_world_ejection_delete (void);
AWAPI int   aw_world_ejection_lookup (void);
AWAPI int   aw_world_ejection_next (void);
AWAPI int   aw_world_ejection_previous (void);
AWAPI int   aw_world_attribute_set (int attribute, char* value);
AWAPI int   aw_world_attribute_get (int attribute, int* read_only, char* value);
AWAPI int   aw_delete_all_objects (void);
AWAPI int   aw_cell_next (void);
AWAPI int   aw_world_reload_registry (void);
AWAPI int   aw_world_attributes_reset (void);
AWAPI int   aw_terrain_set (int x, int z, int count, int texture, int* heights);
AWAPI int   aw_terrain_query (int page_x, int page_z, unsigned long sequence);
AWAPI int   aw_terrain_next (void);
AWAPI int   aw_terrain_delete_all (void);
AWAPI int   aw_terrain_load_node (void);
AWAPI int   aw_console_message (int session_id);
AWAPI int   aw_user_data_set (void* data);
AWAPI void* aw_user_data (void);
AWAPI int   aw_avatar_set (int session_id);
AWAPI int   aw_avatar_reload (int citizen, int session_id);
AWAPI int   aw_avatar_location (int citizen, int session_id, char* name);
AWAPI int   aw_world_instance_set (int citizen, int world_instance);
AWAPI int   aw_world_instance_get (int citizen);
AWAPI int   aw_botgram_send (void);
AWAPI int   aw_toolbar_click (void);
AWAPI int   aw_user_list (void);
AWAPI int   aw_noise (int session_id);
AWAPI int   aw_world_attributes_send (int session_id);
AWAPI int   aw_camera_set (int session_id);
AWAPI int   aw_botmenu_send (void);
AWAPI int   aw_object_bump (void);
AWAPI int   aw_traffic_count (int* traffic_in, int* traffic_out);
#ifndef LINUX
AWAPI unsigned int aw_tick ();
#else
AWAPI uint64_t  aw_tick ();
#endif
AWAPI int   aw_check_right (int citizen, char* str);
AWAPI int   aw_check_right_all (char* str);
AWAPI int   aw_has_world_right (int citizen, AW_ATTRIBUTE right);
AWAPI int   aw_has_world_right_all (AW_ATTRIBUTE right);

AWAPI int   aw_mover_set_state (int id, int state, int model_num);
AWAPI int   aw_mover_set_position (int id, int x, int y, int z, int yaw, int pitch, int roll);
AWAPI int   aw_mover_rider_add (int id, int session, int dist, int angle, int y_delta, int yaw_delta, int pitch_delta);
AWAPI int   aw_mover_rider_change (int id, int session, int dist, int angle, int y_delta, int yaw_delta, int pitch_delta);
AWAPI int   aw_mover_rider_delete (int id, int session);
AWAPI int   aw_mover_links (int id);

/* object type function macros below */

AWAPI int   aw_object_zone_set (
            aw_type_vector size, unsigned char shape, char priority,
            float gravity, float friction, unsigned short flags, unsigned long color,
            unsigned short fog_min, unsigned short fog_max,
            char* footstep, char* ambient, char* camera, char* target_cur);
AWAPI aw_object_data_zone* aw_object_zone (int* len);
AWAPI int   aw_object_particles_set (
            aw_type_vector_range volume, aw_type_vector_range speed,
            aw_type_vector_range accel,  aw_type_vector_range angle,
            aw_type_vector_range spin,   aw_type_vector_range size,
            unsigned long release_min, unsigned long release_max, unsigned short release_size,
            unsigned long lifespan, unsigned long emitter_lifespan,
            unsigned long fade_in, unsigned long fade_out,
            unsigned long color_start, unsigned long color_end,
            float opacity, unsigned char render_style, unsigned short flags, unsigned char style,
            char* asset_list, char* name);
AWAPI aw_object_data_particles*  aw_object_particles (int* len);
AWAPI int   aw_object_camera_set (unsigned short flags, float zoom, char* name);
AWAPI aw_object_data_camera* aw_object_camera (int* len);
AWAPI int   aw_object_mover_set (unsigned char type, unsigned short flags,
            char* name, char* script, char* sound, unsigned short waypoints_len, void* waypoints, char* bump_name);
AWAPI aw_object_data_mover*  aw_object_mover (int* len);


/* gui control functions */

AWAPI int   aw_hud_create ();
AWAPI int   aw_hud_click ();
AWAPI int   aw_hud_destroy (int session, int id);
AWAPI int   aw_hud_clear (int session);

/* world server admin methods below */

AWAPI int   aw_server_admin (const char* domain, int port, char* password, void** instance);
AWAPI int   aw_server_world_add (void);
AWAPI int   aw_server_world_delete (int id);
AWAPI int   aw_server_world_change (int id);
AWAPI int   aw_server_world_list (void);
AWAPI int   aw_server_world_start (int id);
AWAPI int   aw_server_world_stop (int id);
AWAPI int   aw_server_world_set (int id);
AWAPI int   aw_server_world_instance_set (int id);
AWAPI int   aw_server_world_instance_add (int id, int instance_id);
AWAPI int   aw_server_world_instance_delete (int id, int instance_id);

/* methods below are not currently available in the SDK */

AWAPI int   aw_contact_add (int citizen, unsigned int options);
AWAPI int   aw_contact_add_by_name (char* name, unsigned int options);
AWAPI int   aw_contact_change (int citizen, unsigned int options);
AWAPI int   aw_contact_confirm (int citizen, unsigned int options);
AWAPI int   aw_contact_delete (int citizen);
AWAPI int   aw_contact_list (int start);
AWAPI int   aw_afk_set (int flag);
AWAPI int   aw_telegram_send (char* to, char* msg);
AWAPI int   aw_join (int citizen);
AWAPI int   aw_join_reply (int citizen, int reply_rc);
AWAPI int   aw_password_send (void);
AWAPI int   aw_immigrate (void);
AWAPI int   aw_register (int renewal);
AWAPI int   aw_send_file (void);
AWAPI int   aw_send_file_reply (int reply_rc);
AWAPI void  aw_login_timeout_set (int timeout);
AWAPI int   aw_tunnel_set (const char* domain, unsigned short port);
AWAPI int   aw_tunnel_set_resolved (unsigned long address, unsigned short port);
AWAPI int   aw_proxy_set (const char* domain, unsigned short port);
AWAPI int   aw_proxy_set_resolved (unsigned long address, unsigned short port);
AWAPI int   aw_proxy_set_login (const char* name, const char* password);
AWAPI int   aw_connection (void);
AWAPI int   aw_connection_set (int type);
AWAPI int   aw_connection_state (void* instance);
AWAPI int   aw_voip_data (void* data, unsigned int len);
AWAPI int   aw_debug_callback_set (void (*callback) (char* debug_string));

#ifdef __cplusplus
}
#endif

#endif /*__AW_H__*/
