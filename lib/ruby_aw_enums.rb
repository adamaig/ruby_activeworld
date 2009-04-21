module RubyAwEnums
  def self.enums; @@ENUMS.keys; end;

  def self.aw_attribute(v=nil)
    r = v.nil? ? @@ENUMS[:AW_ATTRIBUTE] : @@ENUMS[:AW_ATTRIBUTE][v.to_sym]
    raise "Unknown AWSDK value '#{v}'" if r.nil?
    r
  end
  # Constants for the enum AW_ATTRIBUTE
  AW_LOGIN_NAME = 0                               #original line : AW_LOGIN_NAME
  AW_LOGIN_PASSWORD = 1                           #original line : AW_LOGIN_PASSWORD
  AW_LOGIN_OWNER = 2                              #original line : AW_LOGIN_OWNER
  AW_LOGIN_PRIVILEGE_PASSWORD = 3                 #original line : AW_LOGIN_PRIVILEGE_PASSWORD
  AW_LOGIN_PRIVILEGE_NUMBER = 4                   #original line : AW_LOGIN_PRIVILEGE_NUMBER
  AW_LOGIN_PRIVILEGE_NAME = 5                     #original line : AW_LOGIN_PRIVILEGE_NAME
  AW_LOGIN_APPLICATION = 6                        #original line : AW_LOGIN_APPLICATION
  AW_LOGIN_EMAIL = 7                              #original line : AW_LOGIN_EMAIL
  AW_UNIVERSE_BROWSER_MINIMUM = 8                 #original line : AW_UNIVERSE_BROWSER_MINIMUM
  AW_UNIVERSE_BROWSER_RELEASE = 9                 #original line : AW_UNIVERSE_BROWSER_RELEASE
  AW_UNIVERSE_BROWSER_BETA = 10                   #original line : AW_UNIVERSE_BROWSER_BETA
  AW_UNIVERSE_WORLD_MINIMUM = 11                  #original line : AW_UNIVERSE_WORLD_MINIMUM
  AW_UNIVERSE_WORLD_START = 12                    #original line : AW_UNIVERSE_WORLD_START
  AW_UNIVERSE_REGISTRATION_REQUIRED = 13          #original line : AW_UNIVERSE_REGISTRATION_REQUIRED
  AW_UNIVERSE_BUILD_NUMBER = 14                   #original line : AW_UNIVERSE_BUILD_NUMBER
  AW_UNIVERSE_MONTHLY_CHARGE = 15                 #original line : AW_UNIVERSE_MONTHLY_CHARGE
  AW_UNIVERSE_ANNUAL_CHARGE = 16                  #original line : AW_UNIVERSE_ANNUAL_CHARGE
  AW_UNIVERSE_REGISTER_METHOD = 17                #original line : AW_UNIVERSE_REGISTER_METHOD
  AW_UNIVERSE_TIME = 18                           #original line : AW_UNIVERSE_TIME
  AW_UNIVERSE_CITIZEN_CHANGES_ALLOWED = 19        #original line : AW_UNIVERSE_CITIZEN_CHANGES_ALLOWED
  AW_UNIVERSE_BROWSER_RELEASE_22 = 20             #original line : AW_UNIVERSE_BROWSER_RELEASE_22
  AW_UNIVERSE_WELCOME_MESSAGE = 21                #original line : AW_UNIVERSE_WELCOME_MESSAGE
  AW_UNIVERSE_WORLD_RELEASE = 22                  #original line : AW_UNIVERSE_WORLD_RELEASE
  AW_UNIVERSE_WORLD_BETA = 23                     #original line : AW_UNIVERSE_WORLD_BETA
  AW_UNIVERSE_ALLOW_TOURISTS = 24                 #original line : AW_UNIVERSE_ALLOW_TOURISTS
  AW_UNIVERSE_SEARCH_URL = 25                     #original line : AW_UNIVERSE_SEARCH_URL
  AW_UNIVERSE_NOTEPAD_URL = 26                    #original line : AW_UNIVERSE_NOTEPAD_URL
  AW_UNIVERSE_NAME = 27                           #original line : AW_UNIVERSE_NAME
  AW_UNIVERSE_USER_LIST_ENABLED = 28              #original line : AW_UNIVERSE_USER_LIST_ENABLED
  AW_CITIZEN_NUMBER = 29                          #original line : AW_CITIZEN_NUMBER
  AW_CITIZEN_NAME = 30                            #original line : AW_CITIZEN_NAME
  AW_CITIZEN_PASSWORD = 31                        #original line : AW_CITIZEN_PASSWORD
  AW_CITIZEN_EMAIL = 32                           #original line : AW_CITIZEN_EMAIL
  AW_CITIZEN_TIME_LEFT = 33                       #original line : AW_CITIZEN_TIME_LEFT
  AW_CITIZEN_PRIVILEGE_PASSWORD = 34              #original line : AW_CITIZEN_PRIVILEGE_PASSWORD
  AW_CITIZEN_IMMIGRATION_TIME = 35                #original line : AW_CITIZEN_IMMIGRATION_TIME
  AW_CITIZEN_EXPIRATION_TIME = 36                 #original line : AW_CITIZEN_EXPIRATION_TIME
  AW_CITIZEN_BETA = 37                            #original line : AW_CITIZEN_BETA
  AW_CITIZEN_LAST_LOGIN = 38                      #original line : AW_CITIZEN_LAST_LOGIN
  AW_CITIZEN_BOT_LIMIT = 39                       #original line : AW_CITIZEN_BOT_LIMIT
  AW_CITIZEN_TOTAL_TIME = 40                      #original line : AW_CITIZEN_TOTAL_TIME
  AW_CITIZEN_ENABLED = 41                         #original line : AW_CITIZEN_ENABLED
  AW_CITIZEN_COMMENT = 42                         #original line : AW_CITIZEN_COMMENT
  AW_CITIZEN_URL = 43                             #original line : AW_CITIZEN_URL
  AW_WORLD_NAME = 44                              #original line : AW_WORLD_NAME
  AW_WORLD_TITLE = 45                             #original line : AW_WORLD_TITLE
  AW_WORLD_BACKDROP = 46                          #original line : AW_WORLD_BACKDROP
  AW_WORLD_GROUND = 47                            #original line : AW_WORLD_GROUND
  AW_WORLD_OBJECT_PATH = 48                       #original line : AW_WORLD_OBJECT_PATH
  AW_WORLD_OBJECT_REFRESH = 49                    #original line : AW_WORLD_OBJECT_REFRESH
  AW_WORLD_BUILD_RIGHT = 50                       #original line : AW_WORLD_BUILD_RIGHT
  AW_WORLD_EMINENT_DOMAIN_RIGHT = 51              #original line : AW_WORLD_EMINENT_DOMAIN_RIGHT
  AW_WORLD_ENTER_RIGHT = 52                       #original line : AW_WORLD_ENTER_RIGHT
  AW_WORLD_SPECIAL_OBJECTS_RIGHT = 53             #original line : AW_WORLD_SPECIAL_OBJECTS_RIGHT
  AW_WORLD_FOG_RED = 54                           #original line : AW_WORLD_FOG_RED
  AW_WORLD_FOG_GREEN = 55                         #original line : AW_WORLD_FOG_GREEN
  AW_WORLD_FOG_BLUE = 56                          #original line : AW_WORLD_FOG_BLUE
  AW_WORLD_CARETAKER_CAPABILITY = 57              #original line : AW_WORLD_CARETAKER_CAPABILITY
  AW_WORLD_RESTRICTED_RADIUS = 58                 #original line : AW_WORLD_RESTRICTED_RADIUS
  AW_WORLD_PUBLIC_SPEAKER_CAPABILITY = 59         #original line : AW_WORLD_PUBLIC_SPEAKER_CAPABILITY
  AW_WORLD_PUBLIC_SPEAKER_RIGHT = 60              #original line : AW_WORLD_PUBLIC_SPEAKER_RIGHT
  AW_WORLD_CREATION_TIMESTAMP = 61                #original line : AW_WORLD_CREATION_TIMESTAMP
  AW_WORLD_HOME_PAGE = 62                         #original line : AW_WORLD_HOME_PAGE
  AW_WORLD_BUILD_NUMBER = 63                      #original line : AW_WORLD_BUILD_NUMBER
  AW_WORLD_OBJECT_PASSWORD = 64                   #original line : AW_WORLD_OBJECT_PASSWORD
  AW_WORLD_DISABLE_CREATE_URL = 65                #original line : AW_WORLD_DISABLE_CREATE_URL
  AW_WORLD_RATING = 66                            #original line : AW_WORLD_RATING
  AW_WORLD_WELCOME_MESSAGE = 67                   #original line : AW_WORLD_WELCOME_MESSAGE
  AW_WORLD_EJECT_RIGHT = 68                       #original line : AW_WORLD_EJECT_RIGHT
  AW_WORLD_EJECT_CAPABILITY = 69                  #original line : AW_WORLD_EJECT_CAPABILITY
  AW_WORLD_CELL_LIMIT = 70                        #original line : AW_WORLD_CELL_LIMIT
  AW_WORLD_BUILD_CAPABILITY = 71                  #original line : AW_WORLD_BUILD_CAPABILITY
  AW_WORLD_ALLOW_PASSTHRU = 72                    #original line : AW_WORLD_ALLOW_PASSTHRU
  AW_WORLD_ALLOW_FLYING = 73                      #original line : AW_WORLD_ALLOW_FLYING
  AW_WORLD_ALLOW_TELEPORT = 74                    #original line : AW_WORLD_ALLOW_TELEPORT
  AW_WORLD_ALLOW_OBJECT_SELECT = 75               #original line : AW_WORLD_ALLOW_OBJECT_SELECT
  AW_WORLD_BOTS_RIGHT = 76                        #original line : AW_WORLD_BOTS_RIGHT
  AW_WORLD_SPEAK_CAPABILITY = 77                  #original line : AW_WORLD_SPEAK_CAPABILITY
  AW_WORLD_SPEAK_RIGHT = 78                       #original line : AW_WORLD_SPEAK_RIGHT
  AW_WORLD_ALLOW_TOURIST_WHISPER = 79             #original line : AW_WORLD_ALLOW_TOURIST_WHISPER
  AW_WORLD_LIGHT_X = 80                           #original line : AW_WORLD_LIGHT_X
  AW_WORLD_LIGHT_Y = 81                           #original line : AW_WORLD_LIGHT_Y
  AW_WORLD_LIGHT_Z = 82                           #original line : AW_WORLD_LIGHT_Z
  AW_WORLD_LIGHT_RED = 83                         #original line : AW_WORLD_LIGHT_RED
  AW_WORLD_LIGHT_GREEN = 84                       #original line : AW_WORLD_LIGHT_GREEN
  AW_WORLD_LIGHT_BLUE = 85                        #original line : AW_WORLD_LIGHT_BLUE
  AW_WORLD_AMBIENT_LIGHT_RED = 86                 #original line : AW_WORLD_AMBIENT_LIGHT_RED
  AW_WORLD_AMBIENT_LIGHT_GREEN = 87               #original line : AW_WORLD_AMBIENT_LIGHT_GREEN
  AW_WORLD_AMBIENT_LIGHT_BLUE = 88                #original line : AW_WORLD_AMBIENT_LIGHT_BLUE
  AW_WORLD_ALLOW_AVATAR_COLLISION = 89            #original line : AW_WORLD_ALLOW_AVATAR_COLLISION
  AW_WORLD_FOG_ENABLE = 90                        #original line : AW_WORLD_FOG_ENABLE
  AW_WORLD_FOG_MINIMUM = 91                       #original line : AW_WORLD_FOG_MINIMUM
  AW_WORLD_FOG_MAXIMUM = 92                       #original line : AW_WORLD_FOG_MAXIMUM
  AW_WORLD_FOG_TINTED = 93                        #original line : AW_WORLD_FOG_TINTED
  AW_WORLD_MAX_USERS = 94                         #original line : AW_WORLD_MAX_USERS
  AW_WORLD_SIZE = 95                              #original line : AW_WORLD_SIZE
  AW_WORLD_OBJECT_COUNT = 96                      #original line : AW_WORLD_OBJECT_COUNT
  AW_WORLD_EXPIRATION = 97                        #original line : AW_WORLD_EXPIRATION
  AW_WORLD_SPECIAL_COMMANDS_RIGHT = 98            #original line : AW_WORLD_SPECIAL_COMMANDS_RIGHT
  AW_WORLD_MAX_LIGHT_RADIUS = 99                  #original line : AW_WORLD_MAX_LIGHT_RADIUS
  AW_WORLD_SKYBOX = 100                           #original line : AW_WORLD_SKYBOX
  AW_WORLD_MINIMUM_VISIBILITY = 101               #original line : AW_WORLD_MINIMUM_VISIBILITY
  AW_WORLD_REPEATING_GROUND = 102                 #original line : AW_WORLD_REPEATING_GROUND
  AW_WORLD_KEYWORDS = 103                         #original line : AW_WORLD_KEYWORDS
  AW_WORLD_ENABLE_TERRAIN = 104                   #original line : AW_WORLD_ENABLE_TERRAIN
  AW_WORLD_ALLOW_3_AXIS_ROTATION = 105            #original line : AW_WORLD_ALLOW_3_AXIS_ROTATION
  AW_WORLD_TERRAIN_TIMESTAMP = 106                #original line : AW_WORLD_TERRAIN_TIMESTAMP
  AW_WORLD_ENTRY_POINT = 107                      #original line : AW_WORLD_ENTRY_POINT
  AW_WORLD_SKY_NORTH_RED = 108                    #original line : AW_WORLD_SKY_NORTH_RED
  AW_WORLD_SKY_NORTH_GREEN = 109                  #original line : AW_WORLD_SKY_NORTH_GREEN
  AW_WORLD_SKY_NORTH_BLUE = 110                   #original line : AW_WORLD_SKY_NORTH_BLUE
  AW_WORLD_SKY_SOUTH_RED = 111                    #original line : AW_WORLD_SKY_SOUTH_RED
  AW_WORLD_SKY_SOUTH_GREEN = 112                  #original line : AW_WORLD_SKY_SOUTH_GREEN
  AW_WORLD_SKY_SOUTH_BLUE = 113                   #original line : AW_WORLD_SKY_SOUTH_BLUE
  AW_WORLD_SKY_EAST_RED = 114                     #original line : AW_WORLD_SKY_EAST_RED
  AW_WORLD_SKY_EAST_GREEN = 115                   #original line : AW_WORLD_SKY_EAST_GREEN
  AW_WORLD_SKY_EAST_BLUE = 116                    #original line : AW_WORLD_SKY_EAST_BLUE
  AW_WORLD_SKY_WEST_RED = 117                     #original line : AW_WORLD_SKY_WEST_RED
  AW_WORLD_SKY_WEST_GREEN = 118                   #original line : AW_WORLD_SKY_WEST_GREEN
  AW_WORLD_SKY_WEST_BLUE = 119                    #original line : AW_WORLD_SKY_WEST_BLUE
  AW_WORLD_SKY_TOP_RED = 120                      #original line : AW_WORLD_SKY_TOP_RED
  AW_WORLD_SKY_TOP_GREEN = 121                    #original line : AW_WORLD_SKY_TOP_GREEN
  AW_WORLD_SKY_TOP_BLUE = 122                     #original line : AW_WORLD_SKY_TOP_BLUE
  AW_WORLD_SKY_BOTTOM_RED = 123                   #original line : AW_WORLD_SKY_BOTTOM_RED
  AW_WORLD_SKY_BOTTOM_GREEN = 124                 #original line : AW_WORLD_SKY_BOTTOM_GREEN
  AW_WORLD_SKY_BOTTOM_BLUE = 125                  #original line : AW_WORLD_SKY_BOTTOM_BLUE
  AW_WORLD_CLOUDS_LAYER1_TEXTURE = 126            #original line : AW_WORLD_CLOUDS_LAYER1_TEXTURE
  AW_WORLD_CLOUDS_LAYER1_MASK = 127               #original line : AW_WORLD_CLOUDS_LAYER1_MASK
  AW_WORLD_CLOUDS_LAYER1_TILE = 128               #original line : AW_WORLD_CLOUDS_LAYER1_TILE
  AW_WORLD_CLOUDS_LAYER1_SPEED_X = 129            #original line : AW_WORLD_CLOUDS_LAYER1_SPEED_X
  AW_WORLD_CLOUDS_LAYER1_SPEED_Z = 130            #original line : AW_WORLD_CLOUDS_LAYER1_SPEED_Z
  AW_WORLD_CLOUDS_LAYER1_OPACITY = 131            #original line : AW_WORLD_CLOUDS_LAYER1_OPACITY
  AW_WORLD_CLOUDS_LAYER2_TEXTURE = 132            #original line : AW_WORLD_CLOUDS_LAYER2_TEXTURE
  AW_WORLD_CLOUDS_LAYER2_MASK = 133               #original line : AW_WORLD_CLOUDS_LAYER2_MASK
  AW_WORLD_CLOUDS_LAYER2_TILE = 134               #original line : AW_WORLD_CLOUDS_LAYER2_TILE
  AW_WORLD_CLOUDS_LAYER2_SPEED_X = 135            #original line : AW_WORLD_CLOUDS_LAYER2_SPEED_X
  AW_WORLD_CLOUDS_LAYER2_SPEED_Z = 136            #original line : AW_WORLD_CLOUDS_LAYER2_SPEED_Z
  AW_WORLD_CLOUDS_LAYER2_OPACITY = 137            #original line : AW_WORLD_CLOUDS_LAYER2_OPACITY
  AW_WORLD_CLOUDS_LAYER3_TEXTURE = 138            #original line : AW_WORLD_CLOUDS_LAYER3_TEXTURE
  AW_WORLD_CLOUDS_LAYER3_MASK = 139               #original line : AW_WORLD_CLOUDS_LAYER3_MASK
  AW_WORLD_CLOUDS_LAYER3_TILE = 140               #original line : AW_WORLD_CLOUDS_LAYER3_TILE
  AW_WORLD_CLOUDS_LAYER3_SPEED_X = 141            #original line : AW_WORLD_CLOUDS_LAYER3_SPEED_X
  AW_WORLD_CLOUDS_LAYER3_SPEED_Z = 142            #original line : AW_WORLD_CLOUDS_LAYER3_SPEED_Z
  AW_WORLD_CLOUDS_LAYER3_OPACITY = 143            #original line : AW_WORLD_CLOUDS_LAYER3_OPACITY
  AW_WORLD_DISABLE_CHAT = 144                     #original line : AW_WORLD_DISABLE_CHAT
  AW_WORLD_ALLOW_CITIZEN_WHISPER = 145            #original line : AW_WORLD_ALLOW_CITIZEN_WHISPER
  AW_WORLD_ALWAYS_SHOW_NAMES = 146                #original line : AW_WORLD_ALWAYS_SHOW_NAMES
  AW_WORLD_DISABLE_AVATAR_LIST = 147              #original line : AW_WORLD_DISABLE_AVATAR_LIST
  AW_WORLD_AVATAR_REFRESH_RATE = 148              #original line : AW_WORLD_AVATAR_REFRESH_RATE
  AW_WORLD_WATER_TEXTURE = 149                    #original line : AW_WORLD_WATER_TEXTURE
  AW_WORLD_WATER_MASK = 150                       #original line : AW_WORLD_WATER_MASK
  AW_WORLD_WATER_BOTTOM_TEXTURE = 151             #original line : AW_WORLD_WATER_BOTTOM_TEXTURE
  AW_WORLD_WATER_BOTTOM_MASK = 152                #original line : AW_WORLD_WATER_BOTTOM_MASK
  AW_WORLD_WATER_OPACITY = 153                    #original line : AW_WORLD_WATER_OPACITY
  AW_WORLD_WATER_RED = 154                        #original line : AW_WORLD_WATER_RED
  AW_WORLD_WATER_GREEN = 155                      #original line : AW_WORLD_WATER_GREEN
  AW_WORLD_WATER_BLUE = 156                       #original line : AW_WORLD_WATER_BLUE
  AW_WORLD_WATER_LEVEL = 157                      #original line : AW_WORLD_WATER_LEVEL
  AW_WORLD_WATER_SURFACE_MOVE = 158               #original line : AW_WORLD_WATER_SURFACE_MOVE
  AW_WORLD_WATER_WAVE_MOVE = 159                  #original line : AW_WORLD_WATER_WAVE_MOVE
  AW_WORLD_WATER_SPEED = 160                      #original line : AW_WORLD_WATER_SPEED
  AW_WORLD_WATER_ENABLED = 161                    #original line : AW_WORLD_WATER_ENABLED
  AW_WORLD_EMINENT_DOMAIN_CAPABILITY = 162        #original line : AW_WORLD_EMINENT_DOMAIN_CAPABILITY
  AW_WORLD_LIGHT_TEXTURE = 163                    #original line : AW_WORLD_LIGHT_TEXTURE
  AW_WORLD_LIGHT_MASK = 164                       #original line : AW_WORLD_LIGHT_MASK
  AW_WORLD_LIGHT_DRAW_SIZE = 165                  #original line : AW_WORLD_LIGHT_DRAW_SIZE
  AW_WORLD_LIGHT_DRAW_FRONT = 166                 #original line : AW_WORLD_LIGHT_DRAW_FRONT
  AW_WORLD_LIGHT_DRAW_BRIGHT = 167                #original line : AW_WORLD_LIGHT_DRAW_BRIGHT
  AW_WORLD_LIGHT_SOURCE_USE_COLOR = 168           #original line : AW_WORLD_LIGHT_SOURCE_USE_COLOR
  AW_WORLD_LIGHT_SOURCE_COLOR = 169               #original line : AW_WORLD_LIGHT_SOURCE_COLOR
  AW_WORLD_TERRAIN_AMBIENT = 170                  #original line : AW_WORLD_TERRAIN_AMBIENT
  AW_WORLD_TERRAIN_DIFFUSE = 171                  #original line : AW_WORLD_TERRAIN_DIFFUSE
  AW_WORLD_WATER_VISIBILITY = 172                 #original line : AW_WORLD_WATER_VISIBILITY
  AW_WORLD_SOUND_FOOTSTEP = 173                   #original line : AW_WORLD_SOUND_FOOTSTEP
  AW_WORLD_SOUND_WATER_ENTER = 174                #original line : AW_WORLD_SOUND_WATER_ENTER
  AW_WORLD_SOUND_WATER_EXIT = 175                 #original line : AW_WORLD_SOUND_WATER_EXIT
  AW_WORLD_SOUND_AMBIENT = 176                    #original line : AW_WORLD_SOUND_AMBIENT
  AW_WORLD_GRAVITY = 177                          #original line : AW_WORLD_GRAVITY
  AW_WORLD_BUOYANCY = 178                         #original line : AW_WORLD_BUOYANCY
  AW_WORLD_FRICTION = 179                         #original line : AW_WORLD_FRICTION
  AW_WORLD_WATER_FRICTION = 180                   #original line : AW_WORLD_WATER_FRICTION
  AW_WORLD_SLOPESLIDE_ENABLED = 181               #original line : AW_WORLD_SLOPESLIDE_ENABLED
  AW_WORLD_SLOPESLIDE_MIN_ANGLE = 182             #original line : AW_WORLD_SLOPESLIDE_MIN_ANGLE
  AW_WORLD_SLOPESLIDE_MAX_ANGLE = 183             #original line : AW_WORLD_SLOPESLIDE_MAX_ANGLE
  AW_WORLD_ALLOW_TOURIST_BUILD = 184              #original line : AW_WORLD_ALLOW_TOURIST_BUILD
  AW_WORLD_ENABLE_REFERER = 185                   #original line : AW_WORLD_ENABLE_REFERER
  AW_WORLD_WATER_UNDER_TERRAIN = 186              #original line : AW_WORLD_WATER_UNDER_TERRAIN
  AW_WORLD_TERRAIN_OFFSET = 187                   #original line : AW_WORLD_TERRAIN_OFFSET
  AW_WORLD_VOIP_RIGHT = 188                       #original line : AW_WORLD_VOIP_RIGHT
  AW_WORLD_DISABLE_MULTIPLE_MEDIA = 189           #original line : AW_WORLD_DISABLE_MULTIPLE_MEDIA
  AW_WORLD_BOTMENU_URL = 190                      #original line : AW_WORLD_BOTMENU_URL
  AW_WORLD_ENABLE_BUMP_EVENT = 191                #original line : AW_WORLD_ENABLE_BUMP_EVENT
  AW_WORLD_ENABLE_SYNC_EVENTS = 192               #original line : AW_WORLD_ENABLE_SYNC_EVENTS
  AW_WORLD_ENABLE_CAV = 193                       #original line : AW_WORLD_ENABLE_CAV
  AW_WORLD_ENABLE_PAV = 194                       #original line : AW_WORLD_ENABLE_PAV
  AW_WORLD_CHAT_DISABLE_URL_CLICKS = 195          #original line : AW_WORLD_CHAT_DISABLE_URL_CLICKS
  AW_WORLD_MOVER_EMPTY_RESET_TIMEOUT = 196        #original line : AW_WORLD_MOVER_EMPTY_RESET_TIMEOUT
  AW_WORLD_MOVER_USED_RESET_TIMEOUT = 197         #original line : AW_WORLD_MOVER_USED_RESET_TIMEOUT
  AW_MY_X = 198                                   #original line : AW_MY_X
  AW_MY_Y = 199                                   #original line : AW_MY_Y
  AW_MY_Z = 200                                   #original line : AW_MY_Z
  AW_MY_YAW = 201                                 #original line : AW_MY_YAW
  AW_MY_PITCH = 202                               #original line : AW_MY_PITCH
  AW_MY_TYPE = 203                                #original line : AW_MY_TYPE
  AW_MY_GESTURE = 204                             #original line : AW_MY_GESTURE
  AW_MY_STATE = 205                               #original line : AW_MY_STATE
  AW_AVATAR_SESSION = 206                         #original line : AW_AVATAR_SESSION
  AW_AVATAR_NAME = 207                            #original line : AW_AVATAR_NAME
  AW_AVATAR_X = 208                               #original line : AW_AVATAR_X
  AW_AVATAR_Y = 209                               #original line : AW_AVATAR_Y
  AW_AVATAR_Z = 210                               #original line : AW_AVATAR_Z
  AW_AVATAR_YAW = 211                             #original line : AW_AVATAR_YAW
  AW_AVATAR_PITCH = 212                           #original line : AW_AVATAR_PITCH
  AW_AVATAR_TYPE = 213                            #original line : AW_AVATAR_TYPE
  AW_AVATAR_GESTURE = 214                         #original line : AW_AVATAR_GESTURE
  AW_AVATAR_STATE = 215                           #original line : AW_AVATAR_STATE
  AW_AVATAR_ADDRESS = 216                         #original line : AW_AVATAR_ADDRESS
  AW_AVATAR_VERSION = 217                         #original line : AW_AVATAR_VERSION
  AW_AVATAR_CITIZEN = 218                         #original line : AW_AVATAR_CITIZEN
  AW_AVATAR_PRIVILEGE = 219                       #original line : AW_AVATAR_PRIVILEGE
  AW_AVATAR_LOCK = 220                            #original line : AW_AVATAR_LOCK
  AW_AVATAR_FLAGS = 221                           #original line : AW_AVATAR_FLAGS
  AW_CHAT_SESSION = 222                           #original line : AW_CHAT_SESSION
  AW_CHAT_MESSAGE = 223                           #original line : AW_CHAT_MESSAGE
  AW_CELL_X = 224                                 #original line : AW_CELL_X
  AW_CELL_Z = 225                                 #original line : AW_CELL_Z
  AW_CELL_SEQUENCE = 226                          #original line : AW_CELL_SEQUENCE
  AW_CELL_SIZE = 227                              #original line : AW_CELL_SIZE
  AW_CELL_ITERATOR = 228                          #original line : AW_CELL_ITERATOR
  AW_CELL_COMBINE = 229                           #original line : AW_CELL_COMBINE
  AW_OBJECT_ID = 230                              #original line : AW_OBJECT_ID
  AW_OBJECT_NUMBER = 231                          #original line : AW_OBJECT_NUMBER
  AW_OBJECT_X = 232                               #original line : AW_OBJECT_X
  AW_OBJECT_Y = 233                               #original line : AW_OBJECT_Y
  AW_OBJECT_Z = 234                               #original line : AW_OBJECT_Z
  AW_OBJECT_YAW = 235                             #original line : AW_OBJECT_YAW
  AW_OBJECT_TILT = 236                            #original line : AW_OBJECT_TILT
  AW_OBJECT_ROLL = 237                            #original line : AW_OBJECT_ROLL
  AW_OBJECT_MODEL = 238                           #original line : AW_OBJECT_MODEL
  AW_OBJECT_DESCRIPTION = 239                     #original line : AW_OBJECT_DESCRIPTION
  AW_OBJECT_ACTION = 240                          #original line : AW_OBJECT_ACTION
  AW_OBJECT_OLD_NUMBER = 241                      #original line : AW_OBJECT_OLD_NUMBER
  AW_OBJECT_OLD_X = 242                           #original line : AW_OBJECT_OLD_X
  AW_OBJECT_OLD_Z = 243                           #original line : AW_OBJECT_OLD_Z
  AW_OBJECT_OWNER = 244                           #original line : AW_OBJECT_OWNER
  AW_OBJECT_SESSION = 245                         #original line : AW_OBJECT_SESSION
  AW_OBJECT_BUILD_TIMESTAMP = 246                 #original line : AW_OBJECT_BUILD_TIMESTAMP
  AW_OBJECT_SYNC = 247                            #original line : AW_OBJECT_SYNC
  AW_OBJECT_TYPE = 248                            #original line : AW_OBJECT_TYPE
  AW_OBJECT_DATA = 249                            #original line : AW_OBJECT_DATA
  AW_QUERY_COMPLETE = 250                         #original line : AW_QUERY_COMPLETE
  AW_CHAT_TYPE = 251                              #original line : AW_CHAT_TYPE
  AW_LICENSE_NAME = 252                           #original line : AW_LICENSE_NAME
  AW_LICENSE_PASSWORD = 253                       #original line : AW_LICENSE_PASSWORD
  AW_LICENSE_USERS = 254                          #original line : AW_LICENSE_USERS
  AW_LICENSE_RANGE = 255                          #original line : AW_LICENSE_RANGE
  AW_LICENSE_EMAIL = 256                          #original line : AW_LICENSE_EMAIL
  AW_LICENSE_COMMENT = 257                        #original line : AW_LICENSE_COMMENT
  AW_LICENSE_CREATION_TIME = 258                  #original line : AW_LICENSE_CREATION_TIME
  AW_LICENSE_EXPIRATION_TIME = 259                #original line : AW_LICENSE_EXPIRATION_TIME
  AW_LICENSE_LAST_START = 260                     #original line : AW_LICENSE_LAST_START
  AW_LICENSE_LAST_ADDRESS = 261                   #original line : AW_LICENSE_LAST_ADDRESS
  AW_LICENSE_HIDDEN = 262                         #original line : AW_LICENSE_HIDDEN
  AW_LICENSE_ALLOW_TOURISTS = 263                 #original line : AW_LICENSE_ALLOW_TOURISTS
  AW_LICENSE_VOIP = 264                           #original line : AW_LICENSE_VOIP
  AW_LICENSE_PLUGINS = 265                        #original line : AW_LICENSE_PLUGINS
  AW_WORLDLIST_NAME = 266                         #original line : AW_WORLDLIST_NAME
  AW_WORLDLIST_STATUS = 267                       #original line : AW_WORLDLIST_STATUS
  AW_WORLDLIST_USERS = 268                        #original line : AW_WORLDLIST_USERS
  AW_WORLDLIST_RATING = 269                       #original line : AW_WORLDLIST_RATING
  AW_WORLDLIST_MORE = 270                         #original line : AW_WORLDLIST_MORE
  AW_EJECT_SESSION = 271                          #original line : AW_EJECT_SESSION
  AW_EJECT_DURATION = 272                         #original line : AW_EJECT_DURATION
  AW_EJECTION_TYPE = 273                          #original line : AW_EJECTION_TYPE
  AW_EJECTION_ADDRESS = 274                       #original line : AW_EJECTION_ADDRESS
  AW_EJECTION_EXPIRATION_TIME = 275               #original line : AW_EJECTION_EXPIRATION_TIME
  AW_EJECTION_CREATION_TIME = 276                 #original line : AW_EJECTION_CREATION_TIME
  AW_EJECTION_COMMENT = 277                       #original line : AW_EJECTION_COMMENT
  AW_DISCONNECT_REASON = 278                      #original line : AW_DISCONNECT_REASON
  AW_FILE_RECIPIENT = 279                         #original line : AW_FILE_RECIPIENT
  AW_FILE_SENDER = 280                            #original line : AW_FILE_SENDER
  AW_FILE_SENDER_NAME = 281                       #original line : AW_FILE_SENDER_NAME
  AW_FILE_SESSION = 282                           #original line : AW_FILE_SESSION
  AW_FILE_ADDRESS = 283                           #original line : AW_FILE_ADDRESS
  AW_FILE_PORT = 284                              #original line : AW_FILE_PORT
  AW_CLICKED_SESSION = 285                        #original line : AW_CLICKED_SESSION
  AW_CLICKED_NAME = 286                           #original line : AW_CLICKED_NAME
  AW_URL_NAME = 287                               #original line : AW_URL_NAME
  AW_URL_POST = 288                               #original line : AW_URL_POST
  AW_URL_TARGET = 289                             #original line : AW_URL_TARGET
  AW_URL_TARGET_3D = 290                          #original line : AW_URL_TARGET_3D
  AW_TELEPORT_WORLD = 291                         #original line : AW_TELEPORT_WORLD
  AW_TELEPORT_X = 292                             #original line : AW_TELEPORT_X
  AW_TELEPORT_Y = 293                             #original line : AW_TELEPORT_Y
  AW_TELEPORT_Z = 294                             #original line : AW_TELEPORT_Z
  AW_TELEPORT_YAW = 295                           #original line : AW_TELEPORT_YAW
  AW_TELEPORT_WARP = 296                          #original line : AW_TELEPORT_WARP
  AW_SERVER_BUILD = 297                           #original line : AW_SERVER_BUILD
  AW_SERVER_NAME = 298                            #original line : AW_SERVER_NAME
  AW_SERVER_PASSWORD = 299                        #original line : AW_SERVER_PASSWORD
  AW_SERVER_REGISTRY = 300                        #original line : AW_SERVER_REGISTRY
  AW_SERVER_CARETAKERS = 301                      #original line : AW_SERVER_CARETAKERS
  AW_SERVER_ID = 302                              #original line : AW_SERVER_ID
  AW_SERVER_INSTANCE = 303                        #original line : AW_SERVER_INSTANCE
  AW_SERVER_ENABLED = 304                         #original line : AW_SERVER_ENABLED
  AW_SERVER_STATE = 305                           #original line : AW_SERVER_STATE
  AW_SERVER_USERS = 306                           #original line : AW_SERVER_USERS
  AW_SERVER_MAX_USERS = 307                       #original line : AW_SERVER_MAX_USERS
  AW_SERVER_OBJECTS = 308                         #original line : AW_SERVER_OBJECTS
  AW_SERVER_SIZE = 309                            #original line : AW_SERVER_SIZE
  AW_SERVER_EXPIRATION = 310                      #original line : AW_SERVER_EXPIRATION
  AW_SERVER_START_RC = 311                        #original line : AW_SERVER_START_RC
  AW_SERVER_MORE = 312                            #original line : AW_SERVER_MORE
  AW_SERVER_TERRAIN_NODES = 313                   #original line : AW_SERVER_TERRAIN_NODES
  AW_TERRAIN_X = 314                              #original line : AW_TERRAIN_X
  AW_TERRAIN_Z = 315                              #original line : AW_TERRAIN_Z
  AW_TERRAIN_PAGE_X = 316                         #original line : AW_TERRAIN_PAGE_X
  AW_TERRAIN_PAGE_Z = 317                         #original line : AW_TERRAIN_PAGE_Z
  AW_TERRAIN_NODE_X = 318                         #original line : AW_TERRAIN_NODE_X
  AW_TERRAIN_NODE_Z = 319                         #original line : AW_TERRAIN_NODE_Z
  AW_TERRAIN_NODE_SIZE = 320                      #original line : AW_TERRAIN_NODE_SIZE
  AW_TERRAIN_NODE_TEXTURE_COUNT = 321             #original line : AW_TERRAIN_NODE_TEXTURE_COUNT
  AW_TERRAIN_NODE_HEIGHT_COUNT = 322              #original line : AW_TERRAIN_NODE_HEIGHT_COUNT
  AW_TERRAIN_NODE_TEXTURES = 323                  #original line : AW_TERRAIN_NODE_TEXTURES
  AW_TERRAIN_NODE_HEIGHTS = 324                   #original line : AW_TERRAIN_NODE_HEIGHTS
  AW_TERRAIN_SEQUENCE = 325                       #original line : AW_TERRAIN_SEQUENCE
  AW_TERRAIN_COMPLETE = 326                       #original line : AW_TERRAIN_COMPLETE
  AW_TERRAIN_VERSION_NEEDED = 327                 #original line : AW_TERRAIN_VERSION_NEEDED
  AW_ENTER_GLOBAL = 328                           #original line : AW_ENTER_GLOBAL
  AW_CONSOLE_RED = 329                            #original line : AW_CONSOLE_RED
  AW_CONSOLE_GREEN = 330                          #original line : AW_CONSOLE_GREEN
  AW_CONSOLE_BLUE = 331                           #original line : AW_CONSOLE_BLUE
  AW_CONSOLE_BOLD = 332                           #original line : AW_CONSOLE_BOLD
  AW_CONSOLE_ITALICS = 333                        #original line : AW_CONSOLE_ITALICS
  AW_CONSOLE_MESSAGE = 334                        #original line : AW_CONSOLE_MESSAGE
  AW_BOTGRAM_TO = 335                             #original line : AW_BOTGRAM_TO
  AW_BOTGRAM_FROM = 336                           #original line : AW_BOTGRAM_FROM
  AW_BOTGRAM_FROM_NAME = 337                      #original line : AW_BOTGRAM_FROM_NAME
  AW_BOTGRAM_TYPE = 338                           #original line : AW_BOTGRAM_TYPE
  AW_BOTGRAM_TEXT = 339                           #original line : AW_BOTGRAM_TEXT
  AW_TOOLBAR_ID = 340                             #original line : AW_TOOLBAR_ID
  AW_TOOLBAR_SESSION = 341                        #original line : AW_TOOLBAR_SESSION
  AW_USERLIST_MORE = 342                          #original line : AW_USERLIST_MORE
  AW_USERLIST_NAME = 343                          #original line : AW_USERLIST_NAME
  AW_USERLIST_WORLD = 344                         #original line : AW_USERLIST_WORLD
  AW_USERLIST_EMAIL = 345                         #original line : AW_USERLIST_EMAIL
  AW_USERLIST_CITIZEN = 346                       #original line : AW_USERLIST_CITIZEN
  AW_USERLIST_PRIVILEGE = 347                     #original line : AW_USERLIST_PRIVILEGE
  AW_USERLIST_STATE = 348                         #original line : AW_USERLIST_STATE
  AW_USERLIST_ADDRESS = 349                       #original line : AW_USERLIST_ADDRESS
  AW_USERLIST_ID = 350                            #original line : AW_USERLIST_ID
  AW_SOUND_NAME = 351                             #original line : AW_SOUND_NAME
  AW_CAMERA_LOCATION_TYPE = 352                   #original line : AW_CAMERA_LOCATION_TYPE
  AW_CAMERA_LOCATION_OBJECT = 353                 #original line : AW_CAMERA_LOCATION_OBJECT
  AW_CAMERA_LOCATION_SESSION = 354                #original line : AW_CAMERA_LOCATION_SESSION
  AW_CAMERA_TARGET_TYPE = 355                     #original line : AW_CAMERA_TARGET_TYPE
  AW_CAMERA_TARGET_OBJECT = 356                   #original line : AW_CAMERA_TARGET_OBJECT
  AW_CAMERA_TARGET_SESSION = 357                  #original line : AW_CAMERA_TARGET_SESSION
  AW_PLUGIN_STRING = 358                          #original line : AW_PLUGIN_STRING
  AW_BOTMENU_TO_SESSION = 359                     #original line : AW_BOTMENU_TO_SESSION
  AW_BOTMENU_FROM_NAME = 360                      #original line : AW_BOTMENU_FROM_NAME
  AW_BOTMENU_FROM_SESSION = 361                   #original line : AW_BOTMENU_FROM_SESSION
  AW_BOTMENU_QUESTION = 362                       #original line : AW_BOTMENU_QUESTION
  AW_BOTMENU_ANSWER = 363                         #original line : AW_BOTMENU_ANSWER
  AW_CONTACT_NUMBER = 364                         #original line : AW_CONTACT_NUMBER
  AW_CONTACT_STATUS = 365                         #original line : AW_CONTACT_STATUS
  AW_CONTACT_NAME = 366                           #original line : AW_CONTACT_NAME
  AW_CONTACT_WORLD = 367                          #original line : AW_CONTACT_WORLD
  AW_CONTACT_MORE = 368                           #original line : AW_CONTACT_MORE
  AW_CONTACT_OPTIONS = 369                        #original line : AW_CONTACT_OPTIONS
  AW_TELEGRAM_TO = 370                            #original line : AW_TELEGRAM_TO
  AW_TELEGRAM_FROM = 371                          #original line : AW_TELEGRAM_FROM
  AW_TELEGRAM_TEXT = 372                          #original line : AW_TELEGRAM_TEXT
  AW_TELEGRAM_SENT = 373                          #original line : AW_TELEGRAM_SENT
  AW_TELEGRAM_MORE = 374                          #original line : AW_TELEGRAM_MORE
  AW_JOIN_NAME = 375                              #original line : AW_JOIN_NAME
  AW_JOIN_CITIZEN = 376                           #original line : AW_JOIN_CITIZEN
  AW_JOIN_WORLD = 377                             #original line : AW_JOIN_WORLD
  AW_JOIN_X = 378                                 #original line : AW_JOIN_X
  AW_JOIN_Y = 379                                 #original line : AW_JOIN_Y
  AW_JOIN_Z = 380                                 #original line : AW_JOIN_Z
  AW_JOIN_YAW = 381                               #original line : AW_JOIN_YAW
  AW_REGISTER_CC_NAME = 382                       #original line : AW_REGISTER_CC_NAME
  AW_REGISTER_CC_NUMBER = 383                     #original line : AW_REGISTER_CC_NUMBER
  AW_REGISTER_CC_MONTH = 384                      #original line : AW_REGISTER_CC_MONTH
  AW_REGISTER_CC_YEAR = 385                       #original line : AW_REGISTER_CC_YEAR
  AW_REGISTER_ADDRESS = 386                       #original line : AW_REGISTER_ADDRESS
  AW_REGISTER_CITY = 387                          #original line : AW_REGISTER_CITY
  AW_REGISTER_STATE = 388                         #original line : AW_REGISTER_STATE
  AW_REGISTER_ZIP = 389                           #original line : AW_REGISTER_ZIP
  AW_REGISTER_PHONE_NUMBER = 390                  #original line : AW_REGISTER_PHONE_NUMBER
  AW_REGISTER_BUSINESS_NAME = 391                 #original line : AW_REGISTER_BUSINESS_NAME
  AW_REGISTER_VENDOR = 392                        #original line : AW_REGISTER_VENDOR
  AW_REGISTER_RESULT = 393                        #original line : AW_REGISTER_RESULT
  AW_REGISTER_METHOD = 394                        #original line : AW_REGISTER_METHOD
  AW_VOIP_DATA = 395                              #original line : AW_VOIP_DATA
  AW_UNIVERSE_CAV_PATH = 396                      #original line : AW_UNIVERSE_CAV_PATH
  AW_CITIZEN_CAV_ENABLED = 397                    #original line : AW_CITIZEN_CAV_ENABLED
  AW_CITIZEN_CAV_TEMPLATE = 398                   #original line : AW_CITIZEN_CAV_TEMPLATE
  AW_CAV_TEMPL_NUMBER = 399                       #original line : AW_CAV_TEMPL_NUMBER
  AW_CAV_TEMPL_TYPE = 400                         #original line : AW_CAV_TEMPL_TYPE
  AW_CAV_TEMPL_RATING = 401                       #original line : AW_CAV_TEMPL_RATING
  AW_CAV_TEMPL_NAME = 402                         #original line : AW_CAV_TEMPL_NAME
  AW_CAV_TEMPL_MODEL = 403                        #original line : AW_CAV_TEMPL_MODEL
  AW_CAV_CITIZEN = 404                            #original line : AW_CAV_CITIZEN
  AW_CAV_TEMPLATE = 405                           #original line : AW_CAV_TEMPLATE
  AW_CAV_TYPE = 406                               #original line : AW_CAV_TYPE
  AW_CAV_RATING = 407                             #original line : AW_CAV_RATING
  AW_CAV_NAME = 408                               #original line : AW_CAV_NAME
  AW_CAV_MODEL = 409                              #original line : AW_CAV_MODEL
  AW_CAV_KEYFRAME1SCALE = 410                     #original line : AW_CAV_KEYFRAME1SCALE
  AW_CAV_KEYFRAME2SCALE = 411                     #original line : AW_CAV_KEYFRAME2SCALE
  AW_CAV_HEIGHT = 412                             #original line : AW_CAV_HEIGHT
  AW_CAV_SKINCOLOR = 413                          #original line : AW_CAV_SKINCOLOR
  AW_CAV_HAIRCOLOR = 414                          #original line : AW_CAV_HAIRCOLOR
  AW_ENTITY_TYPE = 415                            #original line : AW_ENTITY_TYPE
  AW_ENTITY_ID = 416                              #original line : AW_ENTITY_ID
  AW_ENTITY_STATE = 417                           #original line : AW_ENTITY_STATE
  AW_ENTITY_FLAGS = 418                           #original line : AW_ENTITY_FLAGS
  AW_ENTITY_X = 419                               #original line : AW_ENTITY_X
  AW_ENTITY_Y = 420                               #original line : AW_ENTITY_Y
  AW_ENTITY_Z = 421                               #original line : AW_ENTITY_Z
  AW_ENTITY_YAW = 422                             #original line : AW_ENTITY_YAW
  AW_ENTITY_PITCH = 423                           #original line : AW_ENTITY_PITCH
  AW_ENTITY_ROLL = 424                            #original line : AW_ENTITY_ROLL
  AW_ENTITY_OWNER_SESSION = 425                   #original line : AW_ENTITY_OWNER_SESSION
  AW_ENTITY_OWNER_CITIZEN = 426                   #original line : AW_ENTITY_OWNER_CITIZEN
  AW_AVATAR_DISTANCE = 427                        #original line : AW_AVATAR_DISTANCE
  AW_AVATAR_ANGLE = 428                           #original line : AW_AVATAR_ANGLE
  AW_AVATAR_Y_DELTA = 429                         #original line : AW_AVATAR_Y_DELTA
  AW_AVATAR_YAW_DELTA = 430                       #original line : AW_AVATAR_YAW_DELTA
  AW_AVATAR_PITCH_DELTA = 431                     #original line : AW_AVATAR_PITCH_DELTA
  AW_AVATAR_WORLD_INSTANCE = 432                  #original line : AW_AVATAR_WORLD_INSTANCE
  AW_ATTRIB_SENDER_SESSION = 433                  #original line : AW_ATTRIB_SENDER_SESSION
  AW_ENTITY_MODEL_NUM = 434                       #original line : AW_ENTITY_MODEL_NUM
  AW_WORLD_V4_OBJECTS_RIGHT = 435                 #original line : AW_WORLD_V4_OBJECTS_RIGHT
  AW_CITIZEN_LAST_ADDRESS = 436                   #original line : AW_CITIZEN_LAST_ADDRESS
  AW_HUD_ELEMENT_TYPE = 437                       #original line : AW_HUD_ELEMENT_TYPE
  AW_HUD_ELEMENT_ID = 438                         #original line : AW_HUD_ELEMENT_ID
  AW_HUD_ELEMENT_SESSION = 439                    #original line : AW_HUD_ELEMENT_SESSION
  AW_HUD_ELEMENT_ORIGIN = 440                     #original line : AW_HUD_ELEMENT_ORIGIN
  AW_HUD_ELEMENT_X = 441                          #original line : AW_HUD_ELEMENT_X
  AW_HUD_ELEMENT_Y = 442                          #original line : AW_HUD_ELEMENT_Y
  AW_HUD_ELEMENT_Z = 443                          #original line : AW_HUD_ELEMENT_Z
  AW_HUD_ELEMENT_FLAGS = 444                      #original line : AW_HUD_ELEMENT_FLAGS
  AW_HUD_ELEMENT_TEXT = 445                       #original line : AW_HUD_ELEMENT_TEXT
  AW_HUD_ELEMENT_COLOR = 446                      #original line : AW_HUD_ELEMENT_COLOR
  AW_HUD_ELEMENT_OPACITY = 447                    #original line : AW_HUD_ELEMENT_OPACITY
  AW_HUD_ELEMENT_SIZE_X = 448                     #original line : AW_HUD_ELEMENT_SIZE_X
  AW_HUD_ELEMENT_SIZE_Y = 449                     #original line : AW_HUD_ELEMENT_SIZE_Y
  AW_HUD_ELEMENT_SIZE_Z = 450                     #original line : AW_HUD_ELEMENT_SIZE_Z
  AW_HUD_ELEMENT_CLICK_X = 451                    #original line : AW_HUD_ELEMENT_CLICK_X
  AW_HUD_ELEMENT_CLICK_Y = 452                    #original line : AW_HUD_ELEMENT_CLICK_Y
  AW_HUD_ELEMENT_CLICK_Z = 453                    #original line : AW_HUD_ELEMENT_CLICK_Z
  AW_HUD_ELEMENT_TEXTURE_OFFSET_X = 454           #original line : AW_HUD_ELEMENT_TEXTURE_OFFSET_X
  AW_HUD_ELEMENT_TEXTURE_OFFSET_Y = 455           #original line : AW_HUD_ELEMENT_TEXTURE_OFFSET_Y
  AW_CITIZEN_PRIVACY = 456                        #original line : AW_CITIZEN_PRIVACY
  AW_CITIZEN_TRIAL = 457                          #original line : AW_CITIZEN_TRIAL
  AW_UNIVERSE_CAV_PATH2 = 458                     #original line : AW_UNIVERSE_CAV_PATH2
  AW_MAX_ATTRIBUTE = 459                          #original line : AW_MAX_ATTRIBUTE

  def self.aw_event_attribute(v=nil)
    r = v.nil? ? @@ENUMS[:AW_EVENT_ATTRIBUTE] : @@ENUMS[:AW_EVENT_ATTRIBUTE][v.to_sym]
    raise "Unknown AWSDK value '#{v}'" if r.nil?
    r
  end
  # Constants for the enum AW_EVENT_ATTRIBUTE
  AW_EVENT_AVATAR_ADD = 0                         #original line : AW_EVENT_AVATAR_ADD
  AW_EVENT_AVATAR_CHANGE = 1                      #original line : AW_EVENT_AVATAR_CHANGE
  AW_EVENT_AVATAR_DELETE = 2                      #original line : AW_EVENT_AVATAR_DELETE
  AW_EVENT_CELL_BEGIN = 3                         #original line : AW_EVENT_CELL_BEGIN
  AW_EVENT_CELL_OBJECT = 4                        #original line : AW_EVENT_CELL_OBJECT
  AW_EVENT_CELL_END = 5                           #original line : AW_EVENT_CELL_END
  AW_EVENT_CHAT = 6                               #original line : AW_EVENT_CHAT
  AW_EVENT_OBJECT_ADD = 7                         #original line : AW_EVENT_OBJECT_ADD
  AW_EVENT_OBJECT_DELETE = 8                      #original line : AW_EVENT_OBJECT_DELETE
  AW_EVENT_UNIVERSE_ATTRIBUTES = 9                #original line : AW_EVENT_UNIVERSE_ATTRIBUTES
  AW_EVENT_UNIVERSE_DISCONNECT = 10               #original line : AW_EVENT_UNIVERSE_DISCONNECT
  AW_EVENT_WORLD_ATTRIBUTES = 11                  #original line : AW_EVENT_WORLD_ATTRIBUTES
  AW_EVENT_WORLD_INFO = 12                        #original line : AW_EVENT_WORLD_INFO
  AW_EVENT_WORLD_DISCONNECT = 13                  #original line : AW_EVENT_WORLD_DISCONNECT
  AW_EVENT_SEND_FILE = 14                         #original line : AW_EVENT_SEND_FILE
  AW_EVENT_CONTACT_STATE = 15                     #original line : AW_EVENT_CONTACT_STATE
  AW_EVENT_TELEGRAM = 16                          #original line : AW_EVENT_TELEGRAM
  AW_EVENT_JOIN = 17                              #original line : AW_EVENT_JOIN
  AW_EVENT_OBJECT_CLICK = 18                      #original line : AW_EVENT_OBJECT_CLICK
  AW_EVENT_OBJECT_SELECT = 19                     #original line : AW_EVENT_OBJECT_SELECT
  AW_EVENT_AVATAR_CLICK = 20                      #original line : AW_EVENT_AVATAR_CLICK
  AW_EVENT_URL = 21                               #original line : AW_EVENT_URL
  AW_EVENT_URL_CLICK = 22                         #original line : AW_EVENT_URL_CLICK
  AW_EVENT_TELEPORT = 23                          #original line : AW_EVENT_TELEPORT
  AW_EVENT_ADMIN_WORLD_INFO = 24                  #original line : AW_EVENT_ADMIN_WORLD_INFO
  AW_EVENT_ADMIN_WORLD_DELETE = 25                #original line : AW_EVENT_ADMIN_WORLD_DELETE
  AW_EVENT_TERRAIN_BEGIN = 26                     #original line : AW_EVENT_TERRAIN_BEGIN
  AW_EVENT_TERRAIN_DATA = 27                      #original line : AW_EVENT_TERRAIN_DATA
  AW_EVENT_TERRAIN_END = 28                       #original line : AW_EVENT_TERRAIN_END
  AW_EVENT_CONSOLE_MESSAGE = 29                   #original line : AW_EVENT_CONSOLE_MESSAGE
  AW_EVENT_TERRAIN_CHANGED = 30                   #original line : AW_EVENT_TERRAIN_CHANGED
  AW_EVENT_BOTGRAM = 31                           #original line : AW_EVENT_BOTGRAM
  AW_EVENT_TOOLBAR_CLICK = 32                     #original line : AW_EVENT_TOOLBAR_CLICK
  AW_EVENT_USER_INFO = 33                         #original line : AW_EVENT_USER_INFO
  AW_EVENT_VOIP_DATA = 34                         #original line : AW_EVENT_VOIP_DATA
  AW_EVENT_NOISE = 35                             #original line : AW_EVENT_NOISE
  AW_EVENT_CAMERA = 36                            #original line : AW_EVENT_CAMERA
  AW_EVENT_BOTMENU = 37                           #original line : AW_EVENT_BOTMENU
  AW_EVENT_OBJECT_BUMP = 38                       #original line : AW_EVENT_OBJECT_BUMP
  AW_EVENT_ENTITY_ADD = 39                        #original line : AW_EVENT_ENTITY_ADD
  AW_EVENT_ENTITY_CHANGE = 40                     #original line : AW_EVENT_ENTITY_CHANGE
  AW_EVENT_ENTITY_DELETE = 41                     #original line : AW_EVENT_ENTITY_DELETE
  AW_EVENT_ENTITY_RIDER_ADD = 42                  #original line : AW_EVENT_ENTITY_RIDER_ADD
  AW_EVENT_ENTITY_RIDER_DELETE = 43               #original line : AW_EVENT_ENTITY_RIDER_DELETE
  AW_EVENT_ENTITY_RIDER_CHANGE = 44               #original line : AW_EVENT_ENTITY_RIDER_CHANGE
  AW_EVENT_AVATAR_RELOAD = 45                     #original line : AW_EVENT_AVATAR_RELOAD
  AW_EVENT_ENTITY_LINKS = 46                      #original line : AW_EVENT_ENTITY_LINKS
  AW_EVENT_HUD_CLICK = 47                         #original line : AW_EVENT_HUD_CLICK
  AW_EVENT_HUD_CREATE = 48                        #original line : AW_EVENT_HUD_CREATE
  AW_EVENT_HUD_DESTROY = 49                       #original line : AW_EVENT_HUD_DESTROY
  AW_EVENT_HUD_CLEAR = 50                         #original line : AW_EVENT_HUD_CLEAR
  AW_MAX_EVENT = 51                               #original line : AW_MAX_EVENT

  def self.aw_callback(v=nil)
    r = v.nil? ? @@ENUMS[:AW_CALLBACK] : @@ENUMS[:AW_CALLBACK][v.to_sym]
    raise "Unknown AWSDK value '#{v}'" if r.nil?
    r
  end
  # Constants for the enum AW_CALLBACK
  AW_CALLBACK_CREATE = 0                          #original line : AW_CALLBACK_CREATE
  AW_CALLBACK_LOGIN = 1                           #original line : AW_CALLBACK_LOGIN
  AW_CALLBACK_ENTER = 2                           #original line : AW_CALLBACK_ENTER
  AW_CALLBACK_OBJECT_RESULT = 3                   #original line : AW_CALLBACK_OBJECT_RESULT
  AW_CALLBACK_LICENSE_ATTRIBUTES = 4              #original line : AW_CALLBACK_LICENSE_ATTRIBUTES
  AW_CALLBACK_LICENSE_RESULT = 5                  #original line : AW_CALLBACK_LICENSE_RESULT
  AW_CALLBACK_CITIZEN_ATTRIBUTES = 6              #original line : AW_CALLBACK_CITIZEN_ATTRIBUTES
  AW_CALLBACK_CITIZEN_RESULT = 7                  #original line : AW_CALLBACK_CITIZEN_RESULT
  AW_CALLBACK_QUERY = 8                           #original line : AW_CALLBACK_QUERY
  AW_CALLBACK_WORLD_LIST = 9                      #original line : AW_CALLBACK_WORLD_LIST
  AW_CALLBACK_SEND_FILE = 10                      #original line : AW_CALLBACK_SEND_FILE
  AW_CALLBACK_JOIN = 11                           #original line : AW_CALLBACK_JOIN
  AW_CALLBACK_PASSWORD_SEND = 12                  #original line : AW_CALLBACK_PASSWORD_SEND
  AW_CALLBACK_IMMIGRATE = 13                      #original line : AW_CALLBACK_IMMIGRATE
  AW_CALLBACK_REGISTER = 14                       #original line : AW_CALLBACK_REGISTER
  AW_CALLBACK_UNIVERSE_EJECTION = 15              #original line : AW_CALLBACK_UNIVERSE_EJECTION
  AW_CALLBACK_UNIVERSE_EJECTION_RESULT = 16       #original line : AW_CALLBACK_UNIVERSE_EJECTION_RESULT
  AW_CALLBACK_ADDRESS = 17                        #original line : AW_CALLBACK_ADDRESS
  AW_CALLBACK_WORLD_EJECTION = 18                 #original line : AW_CALLBACK_WORLD_EJECTION
  AW_CALLBACK_WORLD_EJECTION_RESULT = 19          #original line : AW_CALLBACK_WORLD_EJECTION_RESULT
  AW_CALLBACK_ADMIN_WORLD_LIST = 20               #original line : AW_CALLBACK_ADMIN_WORLD_LIST
  AW_CALLBACK_ADMIN_WORLD_RESULT = 21             #original line : AW_CALLBACK_ADMIN_WORLD_RESULT
  AW_CALLBACK_DELETE_ALL_OBJECTS_RESULT = 22      #original line : AW_CALLBACK_DELETE_ALL_OBJECTS_RESULT
  AW_CALLBACK_CELL_RESULT = 23                    #original line : AW_CALLBACK_CELL_RESULT
  AW_CALLBACK_RELOAD_REGISTRY = 24                #original line : AW_CALLBACK_RELOAD_REGISTRY
  AW_CALLBACK_ATTRIBUTES_RESET_RESULT = 25        #original line : AW_CALLBACK_ATTRIBUTES_RESET_RESULT
  AW_CALLBACK_ADMIN = 26                          #original line : AW_CALLBACK_ADMIN
  AW_CALLBACK_CONTACT_ADD = 27                    #original line : AW_CALLBACK_CONTACT_ADD
  AW_CALLBACK_TELEGRAM_RESULT = 28                #original line : AW_CALLBACK_TELEGRAM_RESULT
  AW_CALLBACK_TERRAIN_SET_RESULT = 29             #original line : AW_CALLBACK_TERRAIN_SET_RESULT
  AW_CALLBACK_TERRAIN_NEXT_RESULT = 30            #original line : AW_CALLBACK_TERRAIN_NEXT_RESULT
  AW_CALLBACK_TERRAIN_DELETE_ALL_RESULT = 31      #original line : AW_CALLBACK_TERRAIN_DELETE_ALL_RESULT
  AW_CALLBACK_TERRAIN_LOAD_NODE_RESULT = 32       #original line : AW_CALLBACK_TERRAIN_LOAD_NODE_RESULT
  AW_CALLBACK_BOTGRAM_RESULT = 33                 #original line : AW_CALLBACK_BOTGRAM_RESULT
  AW_CALLBACK_USER_LIST = 34                      #original line : AW_CALLBACK_USER_LIST
  AW_CALLBACK_BOTMENU_RESULT = 35                 #original line : AW_CALLBACK_BOTMENU_RESULT
  AW_CALLBACK_CAV_TEMPLATE = 36                   #original line : AW_CALLBACK_CAV_TEMPLATE
  AW_CALLBACK_CAV_TEMPLATE_RESULT = 37            #original line : AW_CALLBACK_CAV_TEMPLATE_RESULT
  AW_CALLBACK_CAV = 38                            #original line : AW_CALLBACK_CAV
  AW_CALLBACK_CAV_RESULT = 39                     #original line : AW_CALLBACK_CAV_RESULT
  AW_CALLBACK_WORLD_INSTANCE = 40                 #original line : AW_CALLBACK_WORLD_INSTANCE
  AW_CALLBACK_HUD_RESULT = 41                     #original line : AW_CALLBACK_HUD_RESULT
  AW_CALLBACK_AVATAR_LOCATION = 42                #original line : AW_CALLBACK_AVATAR_LOCATION
  AW_MAX_CALLBACK = 43                            #original line : AW_MAX_CALLBACK

  def self.aw_chat_types(v=nil)
    r = v.nil? ? @@ENUMS[:AW_CHAT_TYPES] : @@ENUMS[:AW_CHAT_TYPES][v.to_sym]
    raise "Unknown AWSDK value '#{v}'" if r.nil?
    r
  end
  # Constants for the enum AW_CHAT_TYPES
  AW_CHAT_SAID = 0                                #original line : AW_CHAT_SAID
  AW_CHAT_BROADCAST = 1                           #original line : AW_CHAT_BROADCAST
  AW_CHAT_WHISPER = 2                             #original line : AW_CHAT_WHISPER

  def self.aw_contact_states(v=nil)
    r = v.nil? ? @@ENUMS[:AW_CONTACT_STATES] : @@ENUMS[:AW_CONTACT_STATES][v.to_sym]
    raise "Unknown AWSDK value '#{v}'" if r.nil?
    r
  end
  # Constants for the enum AW_CONTACT_STATES
  AW_CONTACT_OFFLINE = 0                          #original line : AW_CONTACT_OFFLINE
  AW_CONTACT_ONLINE = 1                           #original line : AW_CONTACT_ONLINE
  AW_CONTACT_NOT_A_CITIZEN = 2                    #original line : AW_CONTACT_NOT_A_CITIZEN
  AW_CONTACT_AFK = 3                              #original line : AW_CONTACT_AFK
  AW_CONTACT_UNKNOWN = 4                          #original line : AW_CONTACT_UNKNOWN
  AW_CONTACT_DELETE = 5                           #original line : AW_CONTACT_DELETE

  def self.aw_world_states(v=nil)
    r = v.nil? ? @@ENUMS[:AW_WORLD_STATES] : @@ENUMS[:AW_WORLD_STATES][v.to_sym]
    raise "Unknown AWSDK value '#{v}'" if r.nil?
    r
  end
  # Constants for the enum AW_WORLD_STATES
  AW_WORLDSTATUS_UNKNOWN = 0                      #original line : AW_WORLDSTATUS_UNKNOWN
  AW_WORLDSTATUS_PUBLIC = 1                       #original line : AW_WORLDSTATUS_PUBLIC
  AW_WORLDSTATUS_PRIVATE = 2                      #original line : AW_WORLDSTATUS_PRIVATE
  AW_WORLDSTATUS_STOPPED = 3                      #original line : AW_WORLDSTATUS_STOPPED

  def self.aw_server_states(v=nil)
    r = v.nil? ? @@ENUMS[:AW_SERVER_STATES] : @@ENUMS[:AW_SERVER_STATES][v.to_sym]
    raise "Unknown AWSDK value '#{v}'" if r.nil?
    r
  end
  # Constants for the enum AW_SERVER_STATES
  AW_SERVER_STOPPED = 0                           #original line : AW_SERVER_STOPPED
  AW_SERVER_STARTING = 1                          #original line : AW_SERVER_STARTING
  AW_SERVER_START_WAIT = 2                        #original line : AW_SERVER_START_WAIT
  AW_SERVER_RUNNING = 3                           #original line : AW_SERVER_RUNNING

  def self.aw_connection_types(v=nil)
    r = v.nil? ? @@ENUMS[:AW_CONNECTION_TYPES] : @@ENUMS[:AW_CONNECTION_TYPES][v.to_sym]
    raise "Unknown AWSDK value '#{v}'" if r.nil?
    r
  end
  # Constants for the enum AW_CONNECTION_TYPES
  AW_CONNECTION_DIRECT = 0                        #original line : AW_CONNECTION_DIRECT
  AW_CONNECTION_FIREWALL_NO_PROXY = 1             #original line : AW_CONNECTION_FIREWALL_NO_PROXY
  AW_CONNECTION_PROXY_AUTO = 2                    #original line : AW_CONNECTION_PROXY_AUTO
  AW_CONNECTION_PROXY_NO_AUTH = 3                 #original line : AW_CONNECTION_PROXY_NO_AUTH
  AW_CONNECTION_PROXY_BASIC = 4                   #original line : AW_CONNECTION_PROXY_BASIC
  AW_CONNECTION_PROXY_AUTH_NTLM = 5               #original line : AW_CONNECTION_PROXY_AUTH_NTLM
  AW_CONNECTION_MAX = 6                           #original line : AW_CONNECTION_MAX

  def self.aw_connection_states(v=nil)
    r = v.nil? ? @@ENUMS[:AW_CONNECTION_STATES] : @@ENUMS[:AW_CONNECTION_STATES][v.to_sym]
    raise "Unknown AWSDK value '#{v}'" if r.nil?
    r
  end
  # Constants for the enum AW_CONNECTION_STATES
  AW_CONNECTION_STATE_NOT_CONNECTED = 0           #original line : AW_CONNECTION_STATE_NOT_CONNECTED
  AW_CONNECTION_STATE_CONNECTING_TO_PROXY = 1     #original line : AW_CONNECTION_STATE_CONNECTING_TO_PROXY
  AW_CONNECTION_STATE_NEGOTIATING_WITH_PROXY = 2  #original line : AW_CONNECTION_STATE_NEGOTIATING_WITH_PROXY
  AW_CONNECTION_STATE_CONNECTING_TO_TUNNEL = 3    #original line : AW_CONNECTION_STATE_CONNECTING_TO_TUNNEL
  AW_CONNECTION_STATE_CONNECTING_TO_UNIVERSE = 4  #original line : AW_CONNECTION_STATE_CONNECTING_TO_UNIVERSE
  AW_CONNECTION_STATE_CONNECTED = 5               #original line : AW_CONNECTION_STATE_CONNECTED
  AW_CONNECTION_STATE_PASSWORD_REQUIRED = 6       #original line : AW_CONNECTION_STATE_PASSWORD_REQUIRED

  def self.aw_ejection_types(v=nil)
    r = v.nil? ? @@ENUMS[:AW_EJECTION_TYPES] : @@ENUMS[:AW_EJECTION_TYPES][v.to_sym]
    raise "Unknown AWSDK value '#{v}'" if r.nil?
    r
  end
  # Constants for the enum AW_EJECTION_TYPES
  AW_EJECT_BY_ADDRESS = 0                         #original line : AW_EJECT_BY_ADDRESS
  AW_EJECT_BY_COMPUTER = 1                        #original line : AW_EJECT_BY_COMPUTER
  AW_EJECT_BY_CITIZEN = 2                         #original line : AW_EJECT_BY_CITIZEN

  def self.aw_avatar_states(v=nil)
    r = v.nil? ? @@ENUMS[:AW_AVATAR_STATES] : @@ENUMS[:AW_AVATAR_STATES][v.to_sym]
    raise "Unknown AWSDK value '#{v}'" if r.nil?
    r
  end
  # Constants for the enum AW_AVATAR_STATES
  AW_AVATAR_STATE_WALKING = 0                     #original line : AW_AVATAR_STATE_WALKING
  AW_AVATAR_STATE_RUNNING = 1                     #original line : AW_AVATAR_STATE_RUNNING
  AW_AVATAR_STATE_FLYING = 2                      #original line : AW_AVATAR_STATE_FLYING
  AW_AVATAR_STATE_SWIMMING = 3                    #original line : AW_AVATAR_STATE_SWIMMING
  AW_AVATAR_STATE_FALLING = 4                     #original line : AW_AVATAR_STATE_FALLING
  AW_AVATAR_STATE_JUMPING = 5                     #original line : AW_AVATAR_STATE_JUMPING
  AW_AVATAR_STATE_WARPING = 6                     #original line : AW_AVATAR_STATE_WARPING
  AW_AVATAR_STATE_RIDING = 7                      #original line : AW_AVATAR_STATE_RIDING
  AW_AVATAR_STATE_SLIDING1 = 8                    #original line : AW_AVATAR_STATE_SLIDING1
  AW_AVATAR_STATE_SLIDING2 = 9                    #original line : AW_AVATAR_STATE_SLIDING2
  AW_AVATAR_STATE_SLIDING3 = 10                   #original line : AW_AVATAR_STATE_SLIDING3
  AW_AVATAR_STATE_CLIMBING = 11                   #original line : AW_AVATAR_STATE_CLIMBING

  def self.aw_zone_types(v=nil)
    r = v.nil? ? @@ENUMS[:AW_ZONE_TYPES] : @@ENUMS[:AW_ZONE_TYPES][v.to_sym]
    raise "Unknown AWSDK value '#{v}'" if r.nil?
    r
  end
  # Constants for the enum AW_ZONE_TYPES
  AW_ZONE_TYPE_CUBE = 0                           #original line : AW_ZONE_TYPE_CUBE
  AW_ZONE_TYPE_CYLINDER = 1                       #original line : AW_ZONE_TYPE_CYLINDER
  AW_ZONE_TYPE_SPHERE = 2                         #original line : AW_ZONE_TYPE_SPHERE

  def self.aw_particle_types(v=nil)
    r = v.nil? ? @@ENUMS[:AW_PARTICLE_TYPES] : @@ENUMS[:AW_PARTICLE_TYPES][v.to_sym]
    raise "Unknown AWSDK value '#{v}'" if r.nil?
    r
  end
  # Constants for the enum AW_PARTICLE_TYPES
  AW_PARTICLE_TYPE_SPRITE = 0                     #original line : AW_PARTICLE_TYPE_SPRITE
  AW_PARTICLE_TYPE_FACER = 1                      #original line : AW_PARTICLE_TYPE_FACER
  AW_PARTICLE_TYPE_FLAT = 2                       #original line : AW_PARTICLE_TYPE_FLAT
  AW_PARTICLE_TYPE_OBJECT = 3                     #original line : AW_PARTICLE_TYPE_OBJECT

  def self.aw_particle_draw_styles(v=nil)
    r = v.nil? ? @@ENUMS[:AW_PARTICLE_DRAW_STYLES] : @@ENUMS[:AW_PARTICLE_DRAW_STYLES][v.to_sym]
    raise "Unknown AWSDK value '#{v}'" if r.nil?
    r
  end
  # Constants for the enum AW_PARTICLE_DRAW_STYLES
  AW_PARTICLE_DRAW_NORMAL = 0                     #original line : AW_PARTICLE_DRAW_NORMAL
  AW_PARTICLE_DRAW_BRIGHT = 1                     #original line : AW_PARTICLE_DRAW_BRIGHT
  AW_PARTICLE_DRAW_GLOW = 2                       #original line : AW_PARTICLE_DRAW_GLOW

  def self.aw_camera_types(v=nil)
    r = v.nil? ? @@ENUMS[:AW_CAMERA_TYPES] : @@ENUMS[:AW_CAMERA_TYPES][v.to_sym]
    raise "Unknown AWSDK value '#{v}'" if r.nil?
    r
  end
  # Constants for the enum AW_CAMERA_TYPES
  AW_CAMERA_TRACK_DEFAULT = 0                     #original line : AW_CAMERA_TRACK_DEFAULT
  AW_CAMERA_TRACK_AVATAR = 1                      #original line : AW_CAMERA_TRACK_AVATAR
  AW_CAMERA_TRACK_OBJECT = 2                      #original line : AW_CAMERA_TRACK_OBJECT
  AW_CAMERA_TRACK_AHEAD = 3                       #original line : AW_CAMERA_TRACK_AHEAD

  def self.aw_register_methods(v=nil)
    r = v.nil? ? @@ENUMS[:AW_REGISTER_METHODS] : @@ENUMS[:AW_REGISTER_METHODS][v.to_sym]
    raise "Unknown AWSDK value '#{v}'" if r.nil?
    r
  end
  # Constants for the enum AW_REGISTER_METHODS
  AW_REGISTER_MONTHLY = 0                         #original line : AW_REGISTER_MONTHLY
  AW_REGISTER_ANNUAL = 1                          #original line : AW_REGISTER_ANNUAL
  AW_REGISTER_USER = 2                            #original line : AW_REGISTER_USER

  def self.aw_avatar_set_flags(v=nil)
    r = v.nil? ? @@ENUMS[:AW_AVATAR_SET_FLAGS] : @@ENUMS[:AW_AVATAR_SET_FLAGS][v.to_sym]
    raise "Unknown AWSDK value '#{v}'" if r.nil?
    r
  end
  # Constants for the enum AW_AVATAR_SET_FLAGS
  AW_AVATAR_SET_NONE = 0                          #original line : AW_AVATAR_SET_NONE      = 0x00
  AW_AVATAR_SET_POSITION = 1                      #original line : AW_AVATAR_SET_POSITION  = 0x01
  AW_AVATAR_SET_TYPE = 2                          #original line : AW_AVATAR_SET_TYPE      = 0x02
  AW_AVATAR_SET_GESTURE = 4                       #original line : AW_AVATAR_SET_GESTURE   = 0x04
  AW_AVATAR_SET_STATE = 8                         #original line : AW_AVATAR_SET_STATE     = 0x08

  def self.aw_entity_types(v=nil)
    r = v.nil? ? @@ENUMS[:AW_ENTITY_TYPES] : @@ENUMS[:AW_ENTITY_TYPES][v.to_sym]
    raise "Unknown AWSDK value '#{v}'" if r.nil?
    r
  end
  # Constants for the enum AW_ENTITY_TYPES
  AW_ENTITY_AVATAR = 0                            #original line : AW_ENTITY_AVATAR
  AW_ENTITY_MOVER = 1                             #original line : AW_ENTITY_MOVER

  def self.aw_mover_state_types(v=nil)
    r = v.nil? ? @@ENUMS[:AW_MOVER_STATE_TYPES] : @@ENUMS[:AW_MOVER_STATE_TYPES][v.to_sym]
    raise "Unknown AWSDK value '#{v}'" if r.nil?
    r
  end
  # Constants for the enum AW_MOVER_STATE_TYPES
  AW_MOVER_STATE_IDLE = 0                         #original line : AW_MOVER_STATE_IDLE
  AW_MOVER_STATE_START = 1                        #original line : AW_MOVER_STATE_START
  AW_MOVER_STATE_MOVE = 2                         #original line : AW_MOVER_STATE_MOVE
  AW_MOVER_STATE_PAUSE = 3                        #original line : AW_MOVER_STATE_PAUSE
  AW_MOVER_STATE_CONTINUE = 4                     #original line : AW_MOVER_STATE_CONTINUE
  AW_MOVER_STATE_STOP = 5                         #original line : AW_MOVER_STATE_STOP
  AW_MOVER_STATE_RESET = 6                        #original line : AW_MOVER_STATE_RESET

  def self.aw_mover_flags(v=nil)
    r = v.nil? ? @@ENUMS[:AW_MOVER_FLAGS] : @@ENUMS[:AW_MOVER_FLAGS][v.to_sym]
    raise "Unknown AWSDK value '#{v}'" if r.nil?
    r
  end
  # Constants for the enum AW_MOVER_FLAGS
  AW_MOVER_FLAG_LOOP = 1                          #original line : AW_MOVER_FLAG_LOOP                  = 0x00000001
  AW_MOVER_FLAG_USE_OBJTAG = 2                    #original line : AW_MOVER_FLAG_USE_OBJTAG            = 0x00000002
  AW_MOVER_FLAG_BUMP_ADD = 4                      #original line : AW_MOVER_FLAG_BUMP_ADD              = 0x00000004
  AW_MOVER_FLAG_CLICK_START = 8                   #original line : AW_MOVER_FLAG_CLICK_START           = 0x00000008
  AW_MOVER_FLAG_CLICK_PAUSE = 16                  #original line : AW_MOVER_FLAG_CLICK_PAUSE           = 0x00000010
  AW_MOVER_FLAG_LOCK_POSITION = 32                #original line : AW_MOVER_FLAG_LOCK_POSITION         = 0x00000020
  AW_MOVER_FLAG_LOCK_YAW = 64                     #original line : AW_MOVER_FLAG_LOCK_YAW              = 0x00000040
  AW_MOVER_FLAG_LOCK_PITCH = 128                  #original line : AW_MOVER_FLAG_LOCK_PITCH            = 0x00000080
  AW_MOVER_FLAG_SINGLE_RIDER = 256                #original line : AW_MOVER_FLAG_SINGLE_RIDER          = 0x00000100
  AW_MOVER_FLAG_NO_AUTO_YAW = 512                 #original line : AW_MOVER_FLAG_NO_AUTO_YAW           = 0x00000200
  AW_MOVER_FLAG_EMPTY_RESET = 1024                #original line : AW_MOVER_FLAG_EMPTY_RESET           = 0x00000400
  AW_MOVER_FLAG_DISABLE_FLYING = 2048             #original line : AW_MOVER_FLAG_DISABLE_FLYING        = 0x00000800
  AW_MOVER_FLAG_KEEP_ON_WATER = 4096              #original line : AW_MOVER_FLAG_KEEP_ON_WATER         = 0x00001000
  AW_MOVER_FLAG_DISABLE_UPWARDS = 8192            #original line : AW_MOVER_FLAG_DISABLE_UPWARDS       = 0x00002000
  AW_MOVER_FLAG_INVISIBLE_AV = 16384              #original line : AW_MOVER_FLAG_INVISIBLE_AV          = 0x00004000
  AW_MOVER_FLAG_EXIT_EJECT_UP = 32768             #original line : AW_MOVER_FLAG_EXIT_EJECT_UP         = 0x00008000
  AW_MOVER_FLAG_EXIT_NON_SOLID = 65536            #original line : AW_MOVER_FLAG_EXIT_NON_SOLID        = 0x00010000
  AW_MOVER_FLAG_AV_APPLY_TILT_X = 131072          #original line : AW_MOVER_FLAG_AV_APPLY_TILT_X       = 0x00020000
  AW_MOVER_FLAG_AV_APPLY_TILT_Z = 262144          #original line : AW_MOVER_FLAG_AV_APPLY_TILT_Z       = 0x00040000
  AW_MOVER_FLAG_OBJECT_LINK = 524288              #original line : AW_MOVER_FLAG_OBJECT_LINK           = 0x00080000
  AW_MOVER_FLAG_DISABLE_MOVE = 1048576            #original line : AW_MOVER_FLAG_DISABLE_MOVE          = 0x00100000
  AW_MOVER_FLAG_TILT_BY_TERRAIN = 2097152         #original line : AW_MOVER_FLAG_TILT_BY_TERRAIN       = 0x00200000
  AW_MOVER_FLAG_DISABLE_EXPL_SEQS = 4194304       #original line : AW_MOVER_FLAG_DISABLE_EXPL_SEQS     = 0x00400000
  AW_MOVER_FLAG_DISABLE_TURN_ON_PLACE = 8388608   #original line : AW_MOVER_FLAG_DISABLE_TURN_ON_PLACE = 0x00800000
  AW_MOVER_FLAG_DISABLE_TELEPORTS = 16777216      #original line : AW_MOVER_FLAG_DISABLE_TELEPORTS     = 0x01000000
  AW_MOVER_FLAG_DETACH_ON_TELEPORT = 33554432     #original line : AW_MOVER_FLAG_DETACH_ON_TELEPORT    = 0x02000000

  def self.aw_mover_types(v=nil)
    r = v.nil? ? @@ENUMS[:AW_MOVER_TYPES] : @@ENUMS[:AW_MOVER_TYPES][v.to_sym]
    raise "Unknown AWSDK value '#{v}'" if r.nil?
    r
  end
  # Constants for the enum AW_MOVER_TYPES
  AW_MOVER_TYPE_PASSIVE = 0                       #original line : AW_MOVER_TYPE_PASSIVE
  AW_MOVER_TYPE_ACTIVE = 1                        #original line : AW_MOVER_TYPE_ACTIVE
  AW_MOVER_TYPE_ITEM = 2                          #original line : AW_MOVER_TYPE_ITEM

  def self.aw_zone_flags(v=nil)
    r = v.nil? ? @@ENUMS[:AW_ZONE_FLAGS] : @@ENUMS[:AW_ZONE_FLAGS][v.to_sym]
    raise "Unknown AWSDK value '#{v}'" if r.nil?
    r
  end
  # Constants for the enum AW_ZONE_FLAGS
  AW_ZONE_FLAG_WATER = 1                          #original line : AW_ZONE_FLAG_WATER              = 0x01
  AW_ZONE_FLAG_BLOCK_PARTICLES = 2                #original line : AW_ZONE_FLAG_BLOCK_PARTICLES    = 0x02
  AW_ZONE_FLAG_BLOCK_LIGHTS = 4                   #original line : AW_ZONE_FLAG_BLOCK_LIGHTS       = 0x04
  AW_ZONE_FLAG_BLOCK_WORLD_LIGHT = 8              #original line : AW_ZONE_FLAG_BLOCK_WORLD_LIGHT  = 0x08
  AW_ZONE_FLAG_BLOCK_CHAT = 16                    #original line : AW_ZONE_FLAG_BLOCK_CHAT         = 0x10
  AW_ZONE_FLAG_VISIBLE = 32                       #original line : AW_ZONE_FLAG_VISIBLE            = 0x20
  AW_ZONE_FLAG_BLOCK_JOIN = 64                    #original line : AW_ZONE_FLAG_BLOCK_JOIN         = 0x40

  def self.aw_particle_flags(v=nil)
    r = v.nil? ? @@ENUMS[:AW_PARTICLE_FLAGS] : @@ENUMS[:AW_PARTICLE_FLAGS][v.to_sym]
    raise "Unknown AWSDK value '#{v}'" if r.nil?
    r
  end
  # Constants for the enum AW_PARTICLE_FLAGS
  AW_PARTICLE_FLAG_INTERPOLATE = 1                #original line : AW_PARTICLE_FLAG_INTERPOLATE    = 0x01
  AW_PARTICLE_FLAG_GRAVITY = 2                    #original line : AW_PARTICLE_FLAG_GRAVITY        = 0x02
  AW_PARTICLE_FLAG_COLLIDE_ZONES = 4              #original line : AW_PARTICLE_FLAG_COLLIDE_ZONES  = 0x04
  AW_PARTICLE_FLAG_ZONE_EXCLUSIVE = 8             #original line : AW_PARTICLE_FLAG_ZONE_EXCLUSIVE = 0x08
  AW_PARTICLE_FLAG_CAMERA_EMIT = 16               #original line : AW_PARTICLE_FLAG_CAMERA_EMIT    = 0x10
  AW_PARTICLE_FLAG_MOVER_LINK = 32                #original line : AW_PARTICLE_FLAG_MOVER_LINK     = 0x20

  def self.aw_camera_flags(v=nil)
    r = v.nil? ? @@ENUMS[:AW_CAMERA_FLAGS] : @@ENUMS[:AW_CAMERA_FLAGS][v.to_sym]
    raise "Unknown AWSDK value '#{v}'" if r.nil?
    r
  end
  # Constants for the enum AW_CAMERA_FLAGS
  AW_CAMERA_FLAG_TRACK_USER = 1                   #original line : AW_CAMERA_FLAG_TRACK_USER       = 0x01

  def self.aw_object_types(v=nil)
    r = v.nil? ? @@ENUMS[:AW_OBJECT_TYPES] : @@ENUMS[:AW_OBJECT_TYPES][v.to_sym]
    raise "Unknown AWSDK value '#{v}'" if r.nil?
    r
  end
  # Constants for the enum AW_OBJECT_TYPES
  AW_OBJECT_TYPE_V3 = 0                           #original line : AW_OBJECT_TYPE_V3       = 0
  AW_OBJECT_TYPE_UNKNOWN = 1                      #original line : AW_OBJECT_TYPE_UNKNOWN
  AW_OBJECT_TYPE_ZONE = 2                         #original line : AW_OBJECT_TYPE_ZONE
  AW_OBJECT_TYPE_PARTICLES = 3                    #original line : AW_OBJECT_TYPE_PARTICLES
  AW_OBJECT_TYPE_MOVER = 4                        #original line : AW_OBJECT_TYPE_MOVER
  AW_OBJECT_TYPE_CAMERA = 5                       #original line : AW_OBJECT_TYPE_CAMERA
  AW_MAX_OBJECT_TYPES = 6                         #original line : AW_MAX_OBJECT_TYPES

  def self.aw_hud_origin_types(v=nil)
    r = v.nil? ? @@ENUMS[:AW_HUD_ORIGIN_TYPES] : @@ENUMS[:AW_HUD_ORIGIN_TYPES][v.to_sym]
    raise "Unknown AWSDK value '#{v}'" if r.nil?
    r
  end
  # Constants for the enum AW_HUD_ORIGIN_TYPES
  AW_HUD_ORIGIN_TOP_LEFT = 0                      #original line : AW_HUD_ORIGIN_TOP_LEFT  = 0
  AW_HUD_ORIGIN_TOP = 1                           #original line : AW_HUD_ORIGIN_TOP
  AW_HUD_ORIGIN_TOP_RIGHT = 2                     #original line : AW_HUD_ORIGIN_TOP_RIGHT
  AW_HUD_ORIGIN_LEFT = 3                          #original line : AW_HUD_ORIGIN_LEFT
  AW_HUD_ORIGIN_CENTER = 4                        #original line : AW_HUD_ORIGIN_CENTER
  AW_HUD_ORIGIN_RIGHT = 5                         #original line : AW_HUD_ORIGIN_RIGHT
  AW_HUD_ORIGIN_BOTTOM_LEFT = 6                   #original line : AW_HUD_ORIGIN_BOTTOM_LEFT
  AW_HUD_ORIGIN_BOTTOM = 7                        #original line : AW_HUD_ORIGIN_BOTTOM
  AW_HUD_ORIGIN_BOTTOM_RIGHT = 8                  #original line : AW_HUD_ORIGIN_BOTTOM_RIGHT

  def self.aw_hud_types(v=nil)
    r = v.nil? ? @@ENUMS[:AW_HUD_TYPES] : @@ENUMS[:AW_HUD_TYPES][v.to_sym]
    raise "Unknown AWSDK value '#{v}'" if r.nil?
    r
  end
  # Constants for the enum AW_HUD_TYPES
  AW_HUD_TYPE_TEXT = 0                            #original line : AW_HUD_TYPE_TEXT  = 0
  AW_HUD_TYPE_IMAGE = 1                           #original line : AW_HUD_TYPE_IMAGE
  AW_HUD_TYPE_MODEL = 2                           #original line : AW_HUD_TYPE_MODEL

  def self.aw_hud_element_flags_enum(v=nil)
    r = v.nil? ? @@ENUMS[:AW_HUD_ELEMENT_FLAGS_ENUM] : @@ENUMS[:AW_HUD_ELEMENT_FLAGS_ENUM][v.to_sym]
    raise "Unknown AWSDK value '#{v}'" if r.nil?
    r
  end
  # Constants for the enum AW_HUD_ELEMENT_FLAGS_ENUM
  AW_HUD_ELEMENT_FLAG_CLICKS = 1                  #original line : AW_HUD_ELEMENT_FLAG_CLICKS        = 0x0001
  AW_HUD_ELEMENT_FLAG_STRETCH = 2                 #original line : AW_HUD_ELEMENT_FLAG_STRETCH       = 0x0002
  AW_HUD_ELEMENT_FLAG_ADDITIVE = 4                #original line : AW_HUD_ELEMENT_FLAG_ADDITIVE      = 0x0004
  AW_HUD_ELEMENT_FLAG_SIZE_PERCENT = 8            #original line : AW_HUD_ELEMENT_FLAG_SIZE_PERCENT  = 0x0008
  AW_HUD_ELEMENT_FLAG_TRANSITION = 16             #original line : AW_HUD_ELEMENT_FLAG_TRANSITION    = 0x0010
  AW_HUD_ELEMENT_FLAG_TEMPORARY = 32              #original line : AW_HUD_ELEMENT_FLAG_TEMPORARY     = 0x0020
  AW_HUD_ELEMENT_FLAG_UNIVERSE_PATH = 64          #original line : AW_HUD_ELEMENT_FLAG_UNIVERSE_PATH = 0x0040
  AW_HUD_ELEMENT_FLAG_CLAMP = 128                 #original line : AW_HUD_ELEMENT_FLAG_CLAMP         = 0x0080
  AW_HUD_ELEMENT_FLAG_HIGHLIGHT = 256             #original line : AW_HUD_ELEMENT_FLAG_HIGHLIGHT     = 0x0100

  def self.aw_privacy_types(v=nil)
    r = v.nil? ? @@ENUMS[:AW_PRIVACY_TYPES] : @@ENUMS[:AW_PRIVACY_TYPES][v.to_sym]
    raise "Unknown AWSDK value '#{v}'" if r.nil?
    r
  end
  # Constants for the enum AW_PRIVACY_TYPES
  AW_PRIVACY_BLOCK_TELEGRAMS = 1                  #original line : AW_PRIVACY_BLOCK_TELEGRAMS  = 0x0001

# This hash provides named access to the enum values if desired
  @@ENUMS = {
    :AW_ATTRIBUTE => {
      :AW_HUD_ELEMENT_TYPE => 437,
      :AW_WORLD_SOUND_WATER_EXIT => 175,
      :AW_WORLD_NAME => 44,
      :AW_SERVER_USERS => 306,
      :AW_MY_STATE => 205,
      :AW_WORLD_ALLOW_TELEPORT => 74,
      :AW_BOTGRAM_FROM => 336,
      :AW_OBJECT_YAW => 235,
      :AW_WORLD_ENABLE_TERRAIN => 104,
      :AW_CONTACT_NAME => 366,
      :AW_LICENSE_PLUGINS => 265,
      :AW_WORLD_CLOUDS_LAYER2_TILE => 134,
      :AW_LOGIN_PRIVILEGE_PASSWORD => 3,
      :AW_UNIVERSE_CAV_PATH => 396,
      :AW_ENTITY_OWNER_CITIZEN => 426,
      :AW_WORLD_LIGHT_MASK => 164,
      :AW_CITIZEN_TIME_LEFT => 33,
      :AW_TELEPORT_YAW => 295,
      :AW_CITIZEN_PRIVACY => 456,
      :AW_WORLD_ENABLE_PAV => 194,
      :AW_WORLD_BUILD_NUMBER => 63,
      :AW_TERRAIN_SEQUENCE => 325,
      :AW_CELL_X => 224,
      :AW_WORLD_FOG_TINTED => 93,
      :AW_CAMERA_TARGET_TYPE => 355,
      :AW_LICENSE_USERS => 254,
      :AW_WORLD_SKY_BOTTOM_RED => 123,
      :AW_REGISTER_CC_YEAR => 385,
      :AW_ENTITY_TYPE => 415,
      :AW_FILE_PORT => 284,
      :AW_WORLD_WATER_OPACITY => 153,
      :AW_UNIVERSE_WORLD_RELEASE => 22,
      :AW_HUD_ELEMENT_TEXT => 445,
      :AW_TERRAIN_X => 314,
      :AW_WORLD_SLOPESLIDE_MAX_ANGLE => 183,
      :AW_WORLD_ENTER_RIGHT => 52,
      :AW_USERLIST_WORLD => 344,
      :AW_AVATAR_TYPE => 213,
      :AW_WORLD_LIGHT_Z => 82,
      :AW_TELEGRAM_MORE => 374,
      :AW_OBJECT_OLD_Z => 243,
      :AW_WORLD_SKY_SOUTH_GREEN => 112,
      :AW_CAV_CITIZEN => 404,
      :AW_UNIVERSE_WORLD_MINIMUM => 11,
      :AW_EJECTION_TYPE => 273,
      :AW_WORLD_CLOUDS_LAYER3_SPEED_Z => 142,
      :AW_ENTITY_MODEL_NUM => 434,
      :AW_CITIZEN_ENABLED => 41,
      :AW_SERVER_INSTANCE => 303,
      :AW_WORLD_WATER_VISIBILITY => 172,
      :AW_WORLD_BUILD_CAPABILITY => 71,
      :AW_CONSOLE_ITALICS => 333,
      :AW_MY_PITCH => 202,
      :AW_WORLD_MINIMUM_VISIBILITY => 101,
      :AW_BOTMENU_ANSWER => 363,
      :AW_OBJECT_X => 232,
      :AW_WORLD_CLOUDS_LAYER1_OPACITY => 131,
      :AW_LOGIN_NAME => 0,
      :AW_REGISTER_RESULT => 393,
      :AW_LICENSE_HIDDEN => 262,
      :AW_ENTITY_PITCH => 423,
      :AW_CITIZEN_NAME => 30,
      :AW_TELEPORT_X => 292,
      :AW_WORLD_WATER_ENABLED => 161,
      :AW_HUD_ELEMENT_CLICK_Z => 453,
      :AW_WORLD_PUBLIC_SPEAKER_RIGHT => 60,
      :AW_TERRAIN_NODE_HEIGHT_COUNT => 322,
      :AW_WORLD_ENABLE_BUMP_EVENT => 191,
      :AW_WORLD_FOG_ENABLE => 90,
      :AW_CAMERA_LOCATION_TYPE => 352,
      :AW_AVATAR_FLAGS => 221,
      :AW_WORLD_SKY_TOP_RED => 120,
      :AW_REGISTER_CC_NAME => 382,
      :AW_CHAT_TYPE => 251,
      :AW_CAV_HEIGHT => 412,
      :AW_WORLD_WATER_MASK => 150,
      :AW_UNIVERSE_CITIZEN_CHANGES_ALLOWED => 19,
      :AW_FILE_SENDER_NAME => 281,
      :AW_HUD_ELEMENT_Y => 442,
      :AW_WORLD_WATER_FRICTION => 180,
      :AW_WORLD_OBJECT_REFRESH => 49,
      :AW_SERVER_START_RC => 311,
      :AW_AVATAR_Z => 210,
      :AW_WORLD_ALLOW_TOURIST_WHISPER => 79,
      :AW_TOOLBAR_SESSION => 341,
      :AW_OBJECT_ACTION => 240,
      :AW_WORLD_SKY_NORTH_GREEN => 109,
      :AW_TELEGRAM_FROM => 371,
      :AW_WORLDLIST_MORE => 270,
      :AW_WORLD_CLOUDS_LAYER3_MASK => 139,
      :AW_UNIVERSE_BROWSER_MINIMUM => 8,
      :AW_CAV_TEMPL_RATING => 401,
      :AW_AVATAR_PITCH_DELTA => 431,
      :AW_SERVER_REGISTRY => 300,
      :AW_WORLD_LIGHT_SOURCE_COLOR => 169,
      :AW_CITIZEN_LAST_LOGIN => 38,
      :AW_CONSOLE_GREEN => 330,
      :AW_MY_Y => 199,
      :AW_WORLD_EJECT_RIGHT => 68,
      :AW_BOTMENU_FROM_NAME => 360,
      :AW_CELL_COMBINE => 229,
      :AW_WORLD_SPECIAL_COMMANDS_RIGHT => 98,
      :AW_REGISTER_PHONE_NUMBER => 390,
      :AW_LICENSE_EXPIRATION_TIME => 259,
      :AW_WORLD_CLOUDS_LAYER1_TILE => 128,
      :AW_ENTITY_Y => 420,
      :AW_URL_TARGET => 289,
      :AW_WORLD_WATER_SURFACE_MOVE => 158,
      :AW_UNIVERSE_NAME => 27,
      :AW_HUD_ELEMENT_SIZE_Z => 450,
      :AW_TERRAIN_NODE_Z => 319,
      :AW_WORLD_VOIP_RIGHT => 188,
      :AW_WORLD_CARETAKER_CAPABILITY => 57,
      :AW_USERLIST_ADDRESS => 349,
      :AW_AVATAR_CITIZEN => 218,
      :AW_WORLD_AMBIENT_LIGHT_GREEN => 87,
      :AW_JOIN_Y => 379,
      :AW_OBJECT_TYPE => 248,
      :AW_WORLD_SKY_WEST_RED => 117,
      :AW_CAV_MODEL => 409,
      :AW_UNIVERSE_ANNUAL_CHARGE => 16,
      :AW_DISCONNECT_REASON => 278,
      :AW_WORLD_DISABLE_AVATAR_LIST => 147,
      :AW_HUD_ELEMENT_SESSION => 439,
      :AW_WORLD_BACKDROP => 46,
      :AW_SERVER_OBJECTS => 308,
      :AW_WORLD_GRAVITY => 177,
      :AW_WORLD_BOTS_RIGHT => 76,
      :AW_BOTGRAM_TYPE => 338,
      :AW_AVATAR_NAME => 207,
      :AW_WORLD_TERRAIN_TIMESTAMP => 106,
      :AW_CONTACT_MORE => 368,
      :AW_OBJECT_ROLL => 237,
      :AW_WORLD_CLOUDS_LAYER2_SPEED_Z => 136,
      :AW_LOGIN_PRIVILEGE_NAME => 5,
      :AW_CITIZEN_CAV_TEMPLATE => 398,
      :AW_WORLDLIST_STATUS => 267,
      :AW_AVATAR_ANGLE => 428,
      :AW_WORLD_LIGHT_DRAW_FRONT => 166,
      :AW_CITIZEN_IMMIGRATION_TIME => 35,
      :AW_SERVER_BUILD => 297,
      :AW_UNIVERSE_CAV_PATH2 => 458,
      :AW_WORLD_MOVER_EMPTY_RESET_TIMEOUT => 196,
      :AW_WORLD_DISABLE_CREATE_URL => 65,
      :AW_TERRAIN_VERSION_NEEDED => 327,
      :AW_CELL_SEQUENCE => 226,
      :AW_WORLD_SIZE => 95,
      :AW_CAMERA_TARGET_SESSION => 357,
      :AW_LICENSE_EMAIL => 256,
      :AW_WORLD_SKY_BOTTOM_BLUE => 125,
      :AW_REGISTER_CITY => 387,
      :AW_ENTITY_STATE => 417,
      :AW_CLICKED_NAME => 286,
      :AW_WORLD_WATER_GREEN => 155,
      :AW_UNIVERSE_ALLOW_TOURISTS => 24,
      :AW_HUD_ELEMENT_OPACITY => 447,
      :AW_TERRAIN_PAGE_X => 316,
      :AW_WORLD_ENABLE_REFERER => 185,
      :AW_WORLD_FOG_RED => 54,
      :AW_USERLIST_CITIZEN => 346,
      :AW_AVATAR_STATE => 215,
      :AW_WORLD_LIGHT_GREEN => 84,
      :AW_JOIN_CITIZEN => 376,
      :AW_OBJECT_SESSION => 245,
      :AW_WORLD_SKY_EAST_RED => 114,
      :AW_CAV_TYPE => 406,
      :AW_EJECTION_EXPIRATION_TIME => 275,
      :AW_WORLD_DISABLE_CHAT => 144,
      :AW_UNIVERSE_REGISTRATION_REQUIRED => 13,
      :AW_CITIZEN_LAST_ADDRESS => 436,
      :AW_SERVER_STATE => 305,
      :AW_WORLD_SOUND_WATER_ENTER => 174,
      :AW_CITIZEN_URL => 43,
      :AW_BOTGRAM_TO => 335,
      :AW_MY_GESTURE => 204,
      :AW_WORLD_ALLOW_FLYING => 73,
      :AW_CONTACT_STATUS => 365,
      :AW_OBJECT_Z => 234,
      :AW_WORLD_KEYWORDS => 103,
      :AW_LOGIN_OWNER => 2,
      :AW_VOIP_DATA => 395,
      :AW_LICENSE_VOIP => 264,
      :AW_WORLD_CLOUDS_LAYER2_MASK => 133,
      :AW_ENTITY_OWNER_SESSION => 425,
      :AW_CITIZEN_EMAIL => 32,
      :AW_TELEPORT_Z => 294,
      :AW_WORLD_LIGHT_TEXTURE => 163,
      :AW_HUD_ELEMENT_TEXTURE_OFFSET_Y => 455,
      :AW_WORLD_HOME_PAGE => 62,
      :AW_TERRAIN_NODE_HEIGHTS => 324,
      :AW_WORLD_ENABLE_CAV => 193,
      :AW_WORLD_FOG_MAXIMUM => 92,
      :AW_CAMERA_LOCATION_SESSION => 354,
      :AW_CHAT_MESSAGE => 223,
      :AW_WORLD_SKY_TOP_BLUE => 122,
      :AW_REGISTER_CC_MONTH => 384,
      :AW_LICENSE_PASSWORD => 253,
      :AW_CAV_HAIRCOLOR => 414,
      :AW_WORLD_WATER_BOTTOM_MASK => 152,
      :AW_UNIVERSE_WELCOME_MESSAGE => 21,
      :AW_FILE_ADDRESS => 283,
      :AW_HUD_ELEMENT_FLAGS => 444,
      :AW_WORLD_SLOPESLIDE_MIN_ANGLE => 182,
      :AW_WORLD_EMINENT_DOMAIN_RIGHT => 51,
      :AW_SERVER_TERRAIN_NODES => 313,
      :AW_AVATAR_PITCH => 212,
      :AW_WORLD_LIGHT_Y => 81,
      :AW_USERLIST_NAME => 343,
      :AW_OBJECT_OLD_X => 242,
      :AW_WORLD_SKY_SOUTH_RED => 111,
      :AW_TELEGRAM_SENT => 373,
      :AW_CAV_TEMPL_MODEL => 403,
      :AW_EJECT_DURATION => 272,
      :AW_WORLD_CLOUDS_LAYER3_SPEED_X => 141,
      :AW_UNIVERSE_BROWSER_BETA => 10,
      :AW_ATTRIB_SENDER_SESSION => 433,
      :AW_SERVER_ID => 302,
      :AW_WORLD_TERRAIN_DIFFUSE => 171,
      :AW_CITIZEN_TOTAL_TIME => 40,
      :AW_CONSOLE_BOLD => 332,
      :AW_MY_YAW => 201,
      :AW_WORLD_CELL_LIMIT => 70,
      :AW_OBJECT_NUMBER => 231,
      :AW_WORLD_SKYBOX => 100,
      :AW_BOTMENU_QUESTION => 362,
      :AW_LICENSE_LAST_ADDRESS => 261,
      :AW_WORLD_CLOUDS_LAYER1_SPEED_Z => 130,
      :AW_REGISTER_VENDOR => 392,
      :AW_ENTITY_YAW => 422,
      :AW_TELEPORT_WORLD => 291,
      :AW_WORLD_WATER_SPEED => 160,
      :AW_CITIZEN_NUMBER => 29,
      :AW_HUD_ELEMENT_CLICK_Y => 452,
      :AW_TERRAIN_NODE_TEXTURE_COUNT => 321,
      :AW_WORLD_BOTMENU_URL => 190,
      :AW_WORLD_PUBLIC_SPEAKER_CAPABILITY => 59,
      :AW_SOUND_NAME => 351,
      :AW_AVATAR_LOCK => 220,
      :AW_WORLD_ALLOW_AVATAR_COLLISION => 89,
      :AW_JOIN_YAW => 381,
      :AW_QUERY_COMPLETE => 250,
      :AW_WORLD_SKY_WEST_BLUE => 119,
      :AW_CAV_KEYFRAME2SCALE => 411,
      :AW_UNIVERSE_TIME => 18,
      :AW_FILE_SENDER => 280,
      :AW_WORLD_WATER_TEXTURE => 149,
      :AW_HUD_ELEMENT_X => 441,
      :AW_WORLD_OBJECT_PATH => 48,
      :AW_SERVER_EXPIRATION => 310,
      :AW_WORLD_FRICTION => 179,
      :AW_WORLD_SPEAK_RIGHT => 78,
      :AW_TOOLBAR_ID => 340,
      :AW_AVATAR_Y => 209,
      :AW_WORLD_SKY_NORTH_RED => 108,
      :AW_TELEGRAM_TO => 370,
      :AW_OBJECT_DESCRIPTION => 239,
      :AW_WORLD_CLOUDS_LAYER3_TEXTURE => 138,
      :AW_LOGIN_EMAIL => 7,
      :AW_CAV_TEMPL_TYPE => 400,
      :AW_WORLDLIST_RATING => 269,
      :AW_AVATAR_YAW_DELTA => 430,
      :AW_WORLD_LIGHT_SOURCE_USE_COLOR => 168,
      :AW_CITIZEN_BETA => 37,
      :AW_SERVER_PASSWORD => 299,
      :AW_MY_X => 198,
      :AW_WORLD_WELCOME_MESSAGE => 67,
      :AW_CONSOLE_RED => 329,
      :AW_WORLD_EXPIRATION => 97,
      :AW_BOTMENU_TO_SESSION => 359,
      :AW_CELL_ITERATOR => 228,
      :AW_WORLD_CLOUDS_LAYER1_MASK => 127,
      :AW_REGISTER_ZIP => 389,
      :AW_LICENSE_CREATION_TIME => 258,
      :AW_ENTITY_X => 419,
      :AW_WORLD_WATER_LEVEL => 157,
      :AW_UNIVERSE_NOTEPAD_URL => 26,
      :AW_URL_POST => 288,
      :AW_HUD_ELEMENT_SIZE_Y => 449,
      :AW_WORLD_TERRAIN_OFFSET => 187,
      :AW_WORLD_FOG_BLUE => 56,
      :AW_TERRAIN_NODE_X => 318,
      :AW_AVATAR_VERSION => 217,
      :AW_WORLD_AMBIENT_LIGHT_RED => 86,
      :AW_USERLIST_STATE => 348,
      :AW_OBJECT_SYNC => 247,
      :AW_WORLD_SKY_EAST_BLUE => 116,
      :AW_JOIN_X => 378,
      :AW_CAV_NAME => 408,
      :AW_EJECTION_COMMENT => 277,
      :AW_WORLD_ALWAYS_SHOW_NAMES => 146,
      :AW_UNIVERSE_MONTHLY_CHARGE => 15,
      :AW_HUD_ELEMENT_ID => 438,
      :AW_SERVER_MAX_USERS => 307,
      :AW_WORLD_SOUND_AMBIENT => 176,
      :AW_WORLD_TITLE => 45,
      :AW_BOTGRAM_FROM_NAME => 337,
      :AW_AVATAR_SESSION => 206,
      :AW_WORLD_ALLOW_OBJECT_SELECT => 75,
      :AW_CONTACT_WORLD => 367,
      :AW_OBJECT_TILT => 236,
      :AW_WORLD_ALLOW_3_AXIS_ROTATION => 105,
      :AW_LOGIN_PRIVILEGE_NUMBER => 4,
      :AW_CITIZEN_CAV_ENABLED => 397,
      :AW_WORLDLIST_NAME => 266,
      :AW_WORLD_CLOUDS_LAYER2_SPEED_X => 135,
      :AW_AVATAR_DISTANCE => 427,
      :AW_CITIZEN_PRIVILEGE_PASSWORD => 34,
      :AW_TELEPORT_WARP => 296,
      :AW_WORLD_LIGHT_DRAW_SIZE => 165,
      :AW_CITIZEN_TRIAL => 457,
      :AW_WORLD_OBJECT_PASSWORD => 64,
      :AW_TERRAIN_COMPLETE => 326,
      :AW_WORLD_CHAT_DISABLE_URL_CLICKS => 195,
      :AW_CAMERA_TARGET_OBJECT => 356,
      :AW_CELL_Z => 225,
      :AW_WORLD_MAX_USERS => 94,
      :AW_REGISTER_ADDRESS => 386,
      :AW_LICENSE_RANGE => 255,
      :AW_WORLD_SKY_BOTTOM_GREEN => 124,
      :AW_ENTITY_ID => 416,
      :AW_UNIVERSE_WORLD_BETA => 23,
      :AW_CLICKED_SESSION => 285,
      :AW_WORLD_WATER_RED => 154,
      :AW_HUD_ELEMENT_COLOR => 446,
      :AW_WORLD_SPECIAL_OBJECTS_RIGHT => 53,
      :AW_TERRAIN_Z => 315,
      :AW_WORLD_ALLOW_TOURIST_BUILD => 184,
      :AW_WORLD_LIGHT_RED => 83,
      :AW_USERLIST_EMAIL => 345,
      :AW_AVATAR_GESTURE => 214,
      :AW_WORLD_SKY_SOUTH_BLUE => 113,
      :AW_JOIN_NAME => 375,
      :AW_OBJECT_OWNER => 244,
      :AW_CAV_TEMPLATE => 405,
      :AW_WORLD_CLOUDS_LAYER3_OPACITY => 143,
      :AW_UNIVERSE_WORLD_START => 12,
      :AW_EJECTION_ADDRESS => 274,
      :AW_WORLD_V4_OBJECTS_RIGHT => 435,
      :AW_WORLD_SOUND_FOOTSTEP => 173,
      :AW_CITIZEN_COMMENT => 42,
      :AW_SERVER_ENABLED => 304,
      :AW_MY_TYPE => 203,
      :AW_WORLD_ALLOW_PASSTHRU => 72,
      :AW_CONSOLE_MESSAGE => 334,
      :AW_OBJECT_Y => 233,
      :AW_WORLD_REPEATING_GROUND => 102,
      :AW_CONTACT_NUMBER => 364,
      :AW_LICENSE_ALLOW_TOURISTS => 263,
      :AW_WORLD_CLOUDS_LAYER2_TEXTURE => 132,
      :AW_LOGIN_PASSWORD => 1,
      :AW_REGISTER_METHOD => 394,
      :AW_ENTITY_ROLL => 424,
      :AW_TELEPORT_Y => 293,
      :AW_WORLD_EMINENT_DOMAIN_CAPABILITY => 162,
      :AW_CITIZEN_PASSWORD => 31,
      :AW_HUD_ELEMENT_TEXTURE_OFFSET_X => 454,
      :AW_TERRAIN_NODE_TEXTURES => 323,
      :AW_WORLD_ENABLE_SYNC_EVENTS => 192,
      :AW_WORLD_CREATION_TIMESTAMP => 61,
      :AW_CAMERA_LOCATION_OBJECT => 353,
      :AW_CHAT_SESSION => 222,
      :AW_WORLD_FOG_MINIMUM => 91,
      :AW_REGISTER_CC_NUMBER => 383,
      :AW_LICENSE_NAME => 252,
      :AW_WORLD_SKY_TOP_GREEN => 121,
      :AW_CAV_SKINCOLOR => 413,
      :AW_FILE_SESSION => 282,
      :AW_WORLD_WATER_BOTTOM_TEXTURE => 151,
      :AW_UNIVERSE_BROWSER_RELEASE_22 => 20,
      :AW_HUD_ELEMENT_Z => 443,
      :AW_SERVER_MORE => 312,
      :AW_WORLD_SLOPESLIDE_ENABLED => 181,
      :AW_WORLD_BUILD_RIGHT => 50,
      :AW_USERLIST_MORE => 342,
      :AW_AVATAR_YAW => 211,
      :AW_WORLD_LIGHT_X => 80,
      :AW_TELEGRAM_TEXT => 372,
      :AW_OBJECT_OLD_NUMBER => 241,
      :AW_WORLD_SKY_NORTH_BLUE => 110,
      :AW_CAV_TEMPL_NAME => 402,
      :AW_UNIVERSE_BROWSER_RELEASE => 9,
      :AW_EJECT_SESSION => 271,
      :AW_WORLD_CLOUDS_LAYER3_TILE => 140,
      :AW_AVATAR_WORLD_INSTANCE => 432,
      :AW_CITIZEN_BOT_LIMIT => 39,
      :AW_SERVER_CARETAKERS => 301,
      :AW_WORLD_TERRAIN_AMBIENT => 170,
      :AW_WORLD_EJECT_CAPABILITY => 69,
      :AW_CONSOLE_BLUE => 331,
      :AW_MY_Z => 200,
      :AW_WORLD_MAX_LIGHT_RADIUS => 99,
      :AW_BOTMENU_FROM_SESSION => 361,
      :AW_OBJECT_ID => 230,
      :AW_WORLD_CLOUDS_LAYER1_SPEED_X => 129,
      :AW_REGISTER_BUSINESS_NAME => 391,
      :AW_LICENSE_LAST_START => 260,
      :AW_ENTITY_Z => 421,
      :AW_WORLD_WATER_WAVE_MOVE => 159,
      :AW_UNIVERSE_USER_LIST_ENABLED => 28,
      :AW_URL_TARGET_3D => 290,
      :AW_HUD_ELEMENT_CLICK_X => 451,
      :AW_WORLD_DISABLE_MULTIPLE_MEDIA => 189,
      :AW_WORLD_RESTRICTED_RADIUS => 58,
      :AW_TERRAIN_NODE_SIZE => 320,
      :AW_AVATAR_PRIVILEGE => 219,
      :AW_WORLD_AMBIENT_LIGHT_BLUE => 88,
      :AW_USERLIST_ID => 350,
      :AW_OBJECT_DATA => 249,
      :AW_WORLD_SKY_WEST_GREEN => 118,
      :AW_JOIN_Z => 380,
      :AW_CAV_KEYFRAME1SCALE => 410,
      :AW_FILE_RECIPIENT => 279,
      :AW_WORLD_AVATAR_REFRESH_RATE => 148,
      :AW_UNIVERSE_REGISTER_METHOD => 17,
      :AW_HUD_ELEMENT_ORIGIN => 440,
      :AW_SERVER_SIZE => 309,
      :AW_WORLD_BUOYANCY => 178,
      :AW_WORLD_GROUND => 47,
      :AW_BOTGRAM_TEXT => 339,
      :AW_AVATAR_X => 208,
      :AW_WORLD_SPEAK_CAPABILITY => 77,
      :AW_CONTACT_OPTIONS => 369,
      :AW_OBJECT_MODEL => 238,
      :AW_WORLD_ENTRY_POINT => 107,
      :AW_CAV_TEMPL_NUMBER => 399,
      :AW_WORLDLIST_USERS => 268,
      :AW_WORLD_CLOUDS_LAYER2_OPACITY => 137,
      :AW_LOGIN_APPLICATION => 6,
      :AW_AVATAR_Y_DELTA => 429,
      :AW_SERVER_NAME => 298,
      :AW_WORLD_LIGHT_DRAW_BRIGHT => 167,
      :AW_CITIZEN_EXPIRATION_TIME => 36,
      :AW_MAX_ATTRIBUTE => 459,
      :AW_ENTER_GLOBAL => 328,
      :AW_WORLD_MOVER_USED_RESET_TIMEOUT => 197,
      :AW_WORLD_RATING => 66,
      :AW_PLUGIN_STRING => 358,
      :AW_CELL_SIZE => 227,
      :AW_WORLD_OBJECT_COUNT => 96,
      :AW_REGISTER_STATE => 388,
      :AW_LICENSE_COMMENT => 257,
      :AW_WORLD_CLOUDS_LAYER1_TEXTURE => 126,
      :AW_ENTITY_FLAGS => 418,
      :AW_UNIVERSE_SEARCH_URL => 25,
      :AW_URL_NAME => 287,
      :AW_WORLD_WATER_BLUE => 156,
      :AW_HUD_ELEMENT_SIZE_X => 448,
      :AW_WORLD_FOG_GREEN => 55,
      :AW_TERRAIN_PAGE_Z => 317,
      :AW_WORLD_WATER_UNDER_TERRAIN => 186,
      :AW_WORLD_LIGHT_BLUE => 85,
      :AW_USERLIST_PRIVILEGE => 347,
      :AW_AVATAR_ADDRESS => 216,
      :AW_WORLD_SKY_EAST_GREEN => 115,
      :AW_JOIN_WORLD => 377,
      :AW_OBJECT_BUILD_TIMESTAMP => 246,
      :AW_CAV_RATING => 407,
      :AW_WORLD_ALLOW_CITIZEN_WHISPER => 145,
      :AW_UNIVERSE_BUILD_NUMBER => 14,
      :AW_EJECTION_CREATION_TIME => 276
    },
    :AW_AVATAR_SET_FLAGS => {
      :AW_AVATAR_SET_NONE => 0,
      :AW_AVATAR_SET_POSITION => 1,
      :AW_AVATAR_SET_TYPE => 2,
      :AW_AVATAR_SET_GESTURE => 4,
      :AW_AVATAR_SET_STATE => 8
    },
    :AW_AVATAR_STATES => {
      :AW_AVATAR_STATE_RIDING => 7,
      :AW_AVATAR_STATE_FLYING => 2,
      :AW_AVATAR_STATE_SLIDING1 => 8,
      :AW_AVATAR_STATE_SWIMMING => 3,
      :AW_AVATAR_STATE_SLIDING2 => 9,
      :AW_AVATAR_STATE_FALLING => 4,
      :AW_AVATAR_STATE_SLIDING3 => 10,
      :AW_AVATAR_STATE_JUMPING => 5,
      :AW_AVATAR_STATE_CLIMBING => 11,
      :AW_AVATAR_STATE_WALKING => 0,
      :AW_AVATAR_STATE_WARPING => 6,
      :AW_AVATAR_STATE_RUNNING => 1
    },
    :AW_CALLBACK => {
      :AW_CALLBACK_CAV => 38,
      :AW_CALLBACK_CONTACT_ADD => 27,
      :AW_CALLBACK_UNIVERSE_EJECTION_RESULT => 16,
      :AW_CALLBACK_LICENSE_RESULT => 5,
      :AW_CALLBACK_BOTGRAM_RESULT => 33,
      :AW_CALLBACK_DELETE_ALL_OBJECTS_RESULT => 22,
      :AW_CALLBACK_JOIN => 11,
      :AW_CALLBACK_CREATE => 0,
      :AW_CALLBACK_CAV_RESULT => 39,
      :AW_CALLBACK_TELEGRAM_RESULT => 28,
      :AW_CALLBACK_ADDRESS => 17,
      :AW_CALLBACK_CITIZEN_ATTRIBUTES => 6,
      :AW_CALLBACK_USER_LIST => 34,
      :AW_CALLBACK_CELL_RESULT => 23,
      :AW_CALLBACK_PASSWORD_SEND => 12,
      :AW_CALLBACK_LOGIN => 1,
      :AW_CALLBACK_WORLD_INSTANCE => 40,
      :AW_CALLBACK_TERRAIN_SET_RESULT => 29,
      :AW_CALLBACK_WORLD_EJECTION => 18,
      :AW_CALLBACK_CITIZEN_RESULT => 7,
      :AW_CALLBACK_BOTMENU_RESULT => 35,
      :AW_CALLBACK_RELOAD_REGISTRY => 24,
      :AW_CALLBACK_IMMIGRATE => 13,
      :AW_CALLBACK_ENTER => 2,
      :AW_CALLBACK_HUD_RESULT => 41,
      :AW_CALLBACK_TERRAIN_NEXT_RESULT => 30,
      :AW_CALLBACK_WORLD_EJECTION_RESULT => 19,
      :AW_CALLBACK_QUERY => 8,
      :AW_CALLBACK_CAV_TEMPLATE => 36,
      :AW_CALLBACK_ATTRIBUTES_RESET_RESULT => 25,
      :AW_CALLBACK_REGISTER => 14,
      :AW_CALLBACK_OBJECT_RESULT => 3,
      :AW_CALLBACK_AVATAR_LOCATION => 42,
      :AW_CALLBACK_TERRAIN_DELETE_ALL_RESULT => 31,
      :AW_CALLBACK_ADMIN_WORLD_LIST => 20,
      :AW_CALLBACK_WORLD_LIST => 9,
      :AW_CALLBACK_CAV_TEMPLATE_RESULT => 37,
      :AW_CALLBACK_ADMIN => 26,
      :AW_CALLBACK_UNIVERSE_EJECTION => 15,
      :AW_CALLBACK_LICENSE_ATTRIBUTES => 4,
      :AW_MAX_CALLBACK => 43,
      :AW_CALLBACK_TERRAIN_LOAD_NODE_RESULT => 32,
      :AW_CALLBACK_ADMIN_WORLD_RESULT => 21,
      :AW_CALLBACK_SEND_FILE => 10
    },
    :AW_CAMERA_FLAGS => {
      :AW_CAMERA_FLAG_TRACK_USER => 1
    },
    :AW_CAMERA_TYPES => {
      :AW_CAMERA_TRACK_AHEAD => 3,
      :AW_CAMERA_TRACK_DEFAULT => 0,
      :AW_CAMERA_TRACK_AVATAR => 1,
      :AW_CAMERA_TRACK_OBJECT => 2
    },
    :AW_CHAT_TYPES => {
      :AW_CHAT_SAID => 0,
      :AW_CHAT_BROADCAST => 1,
      :AW_CHAT_WHISPER => 2
    },
    :AW_CONNECTION_STATES => {
      :AW_CONNECTION_STATE_CONNECTING_TO_TUNNEL => 3,
      :AW_CONNECTION_STATE_CONNECTING_TO_UNIVERSE => 4,
      :AW_CONNECTION_STATE_CONNECTED => 5,
      :AW_CONNECTION_STATE_NOT_CONNECTED => 0,
      :AW_CONNECTION_STATE_PASSWORD_REQUIRED => 6,
      :AW_CONNECTION_STATE_CONNECTING_TO_PROXY => 1,
      :AW_CONNECTION_STATE_NEGOTIATING_WITH_PROXY => 2
    },
    :AW_CONNECTION_TYPES => {
      :AW_CONNECTION_PROXY_AUTH_NTLM => 5,
      :AW_CONNECTION_DIRECT => 0,
      :AW_CONNECTION_MAX => 6,
      :AW_CONNECTION_FIREWALL_NO_PROXY => 1,
      :AW_CONNECTION_PROXY_AUTO => 2,
      :AW_CONNECTION_PROXY_NO_AUTH => 3,
      :AW_CONNECTION_PROXY_BASIC => 4
    },
    :AW_CONTACT_STATES => {
      :AW_CONTACT_OFFLINE => 0,
      :AW_CONTACT_ONLINE => 1,
      :AW_CONTACT_NOT_A_CITIZEN => 2,
      :AW_CONTACT_AFK => 3,
      :AW_CONTACT_UNKNOWN => 4,
      :AW_CONTACT_DELETE => 5
    },
    :AW_EJECTION_TYPES => {
      :AW_EJECT_BY_ADDRESS => 0,
      :AW_EJECT_BY_COMPUTER => 1,
      :AW_EJECT_BY_CITIZEN => 2
    },
    :AW_ENTITY_TYPES => {
      :AW_ENTITY_AVATAR => 0,
      :AW_ENTITY_MOVER => 1
    },
    :AW_EVENT_ATTRIBUTE => {
      :AW_EVENT_HUD_CLICK => 47,
      :AW_EVENT_CAMERA => 36,
      :AW_EVENT_ADMIN_WORLD_DELETE => 25,
      :AW_EVENT_SEND_FILE => 14,
      :AW_EVENT_CELL_BEGIN => 3,
      :AW_EVENT_ENTITY_RIDER_ADD => 42,
      :AW_EVENT_BOTGRAM => 31,
      :AW_EVENT_AVATAR_CLICK => 20,
      :AW_EVENT_UNIVERSE_ATTRIBUTES => 9,
      :AW_EVENT_HUD_CREATE => 48,
      :AW_EVENT_BOTMENU => 37,
      :AW_EVENT_TERRAIN_BEGIN => 26,
      :AW_EVENT_CONTACT_STATE => 15,
      :AW_EVENT_CELL_OBJECT => 4,
      :AW_EVENT_ENTITY_RIDER_DELETE => 43,
      :AW_EVENT_TOOLBAR_CLICK => 32,
      :AW_EVENT_URL => 21,
      :AW_EVENT_UNIVERSE_DISCONNECT => 10,
      :AW_EVENT_HUD_DESTROY => 49,
      :AW_EVENT_OBJECT_BUMP => 38,
      :AW_EVENT_TERRAIN_DATA => 27,
      :AW_EVENT_TELEGRAM => 16,
      :AW_EVENT_CELL_END => 5,
      :AW_EVENT_ENTITY_RIDER_CHANGE => 44,
      :AW_EVENT_USER_INFO => 33,
      :AW_EVENT_URL_CLICK => 22,
      :AW_EVENT_WORLD_ATTRIBUTES => 11,
      :AW_EVENT_AVATAR_ADD => 0,
      :AW_EVENT_HUD_CLEAR => 50,
      :AW_EVENT_ENTITY_ADD => 39,
      :AW_EVENT_TERRAIN_END => 28,
      :AW_EVENT_JOIN => 17,
      :AW_EVENT_CHAT => 6,
      :AW_EVENT_AVATAR_RELOAD => 45,
      :AW_EVENT_VOIP_DATA => 34,
      :AW_EVENT_TELEPORT => 23,
      :AW_EVENT_WORLD_INFO => 12,
      :AW_EVENT_AVATAR_CHANGE => 1,
      :AW_MAX_EVENT => 51,
      :AW_EVENT_ENTITY_CHANGE => 40,
      :AW_EVENT_CONSOLE_MESSAGE => 29,
      :AW_EVENT_OBJECT_CLICK => 18,
      :AW_EVENT_OBJECT_ADD => 7,
      :AW_EVENT_ENTITY_LINKS => 46,
      :AW_EVENT_NOISE => 35,
      :AW_EVENT_ADMIN_WORLD_INFO => 24,
      :AW_EVENT_WORLD_DISCONNECT => 13,
      :AW_EVENT_AVATAR_DELETE => 2,
      :AW_EVENT_ENTITY_DELETE => 41,
      :AW_EVENT_TERRAIN_CHANGED => 30,
      :AW_EVENT_OBJECT_SELECT => 19,
      :AW_EVENT_OBJECT_DELETE => 8
    },
    :AW_HUD_ELEMENT_FLAGS_ENUM => {
      :AW_HUD_ELEMENT_FLAG_UNIVERSE_PATH => 64,
      :AW_HUD_ELEMENT_FLAG_STRETCH => 2,
      :AW_HUD_ELEMENT_FLAG_CLAMP => 128,
      :AW_HUD_ELEMENT_FLAG_ADDITIVE => 4,
      :AW_HUD_ELEMENT_FLAG_HIGHLIGHT => 256,
      :AW_HUD_ELEMENT_FLAG_SIZE_PERCENT => 8,
      :AW_HUD_ELEMENT_FLAG_TRANSITION => 16,
      :AW_HUD_ELEMENT_FLAG_TEMPORARY => 32,
      :AW_HUD_ELEMENT_FLAG_CLICKS => 1
    },
    :AW_HUD_ORIGIN_TYPES => {
      :AW_HUD_ORIGIN_CENTER => 4,
      :AW_HUD_ORIGIN_RIGHT => 5,
      :AW_HUD_ORIGIN_TOP_LEFT => 0,
      :AW_HUD_ORIGIN_BOTTOM_LEFT => 6,
      :AW_HUD_ORIGIN_TOP => 1,
      :AW_HUD_ORIGIN_BOTTOM => 7,
      :AW_HUD_ORIGIN_TOP_RIGHT => 2,
      :AW_HUD_ORIGIN_BOTTOM_RIGHT => 8,
      :AW_HUD_ORIGIN_LEFT => 3
    },
    :AW_HUD_TYPES => {
      :AW_HUD_TYPE_TEXT => 0,
      :AW_HUD_TYPE_IMAGE => 1,
      :AW_HUD_TYPE_MODEL => 2
    },
    :AW_MOVER_FLAGS => {
      :AW_MOVER_FLAG_TILT_BY_TERRAIN => 2097152,
      :AW_MOVER_FLAG_EMPTY_RESET => 1024,
      :AW_MOVER_FLAG_EXIT_NON_SOLID => 65536,
      :AW_MOVER_FLAG_LOCK_POSITION => 32,
      :AW_MOVER_FLAG_DISABLE_EXPL_SEQS => 4194304,
      :AW_MOVER_FLAG_DISABLE_FLYING => 2048,
      :AW_MOVER_FLAG_LOOP => 1,
      :AW_MOVER_FLAG_AV_APPLY_TILT_X => 131072,
      :AW_MOVER_FLAG_LOCK_YAW => 64,
      :AW_MOVER_FLAG_DISABLE_TURN_ON_PLACE => 8388608,
      :AW_MOVER_FLAG_KEEP_ON_WATER => 4096,
      :AW_MOVER_FLAG_USE_OBJTAG => 2,
      :AW_MOVER_FLAG_AV_APPLY_TILT_Z => 262144,
      :AW_MOVER_FLAG_LOCK_PITCH => 128,
      :AW_MOVER_FLAG_DISABLE_TELEPORTS => 16777216,
      :AW_MOVER_FLAG_DISABLE_UPWARDS => 8192,
      :AW_MOVER_FLAG_BUMP_ADD => 4,
      :AW_MOVER_FLAG_OBJECT_LINK => 524288,
      :AW_MOVER_FLAG_SINGLE_RIDER => 256,
      :AW_MOVER_FLAG_DETACH_ON_TELEPORT => 33554432,
      :AW_MOVER_FLAG_INVISIBLE_AV => 16384,
      :AW_MOVER_FLAG_CLICK_START => 8,
      :AW_MOVER_FLAG_DISABLE_MOVE => 1048576,
      :AW_MOVER_FLAG_NO_AUTO_YAW => 512,
      :AW_MOVER_FLAG_EXIT_EJECT_UP => 32768,
      :AW_MOVER_FLAG_CLICK_PAUSE => 16
    },
    :AW_MOVER_STATE_TYPES => {
      :AW_MOVER_STATE_MOVE => 2,
      :AW_MOVER_STATE_PAUSE => 3,
      :AW_MOVER_STATE_CONTINUE => 4,
      :AW_MOVER_STATE_STOP => 5,
      :AW_MOVER_STATE_IDLE => 0,
      :AW_MOVER_STATE_RESET => 6,
      :AW_MOVER_STATE_START => 1
    },
    :AW_MOVER_TYPES => {
      :AW_MOVER_TYPE_PASSIVE => 0,
      :AW_MOVER_TYPE_ACTIVE => 1,
      :AW_MOVER_TYPE_ITEM => 2
    },
    :AW_OBJECT_TYPES => {
      :AW_MAX_OBJECT_TYPES => 6,
      :AW_OBJECT_TYPE_UNKNOWN => 1,
      :AW_OBJECT_TYPE_ZONE => 2,
      :AW_OBJECT_TYPE_PARTICLES => 3,
      :AW_OBJECT_TYPE_MOVER => 4,
      :AW_OBJECT_TYPE_CAMERA => 5,
      :AW_OBJECT_TYPE_V3 => 0
    },
    :AW_PARTICLE_DRAW_STYLES => {
      :AW_PARTICLE_DRAW_GLOW => 2,
      :AW_PARTICLE_DRAW_NORMAL => 0,
      :AW_PARTICLE_DRAW_BRIGHT => 1
    },
    :AW_PARTICLE_FLAGS => {
      :AW_PARTICLE_FLAG_CAMERA_EMIT => 16,
      :AW_PARTICLE_FLAG_MOVER_LINK => 32,
      :AW_PARTICLE_FLAG_INTERPOLATE => 1,
      :AW_PARTICLE_FLAG_GRAVITY => 2,
      :AW_PARTICLE_FLAG_COLLIDE_ZONES => 4,
      :AW_PARTICLE_FLAG_ZONE_EXCLUSIVE => 8
    },
    :AW_PARTICLE_TYPES => {
      :AW_PARTICLE_TYPE_FACER => 1,
      :AW_PARTICLE_TYPE_FLAT => 2,
      :AW_PARTICLE_TYPE_OBJECT => 3,
      :AW_PARTICLE_TYPE_SPRITE => 0
    },
    :AW_PRIVACY_TYPES => {
      :AW_PRIVACY_BLOCK_TELEGRAMS => 1
    },
    :AW_REGISTER_METHODS => {
      :AW_REGISTER_MONTHLY => 0,
      :AW_REGISTER_ANNUAL => 1,
      :AW_REGISTER_USER => 2
    },
    :AW_SERVER_STATES => {
      :AW_SERVER_STOPPED => 0,
      :AW_SERVER_STARTING => 1,
      :AW_SERVER_START_WAIT => 2,
      :AW_SERVER_RUNNING => 3
    },
    :AW_WORLD_STATES => {
      :AW_WORLDSTATUS_UNKNOWN => 0,
      :AW_WORLDSTATUS_PUBLIC => 1,
      :AW_WORLDSTATUS_PRIVATE => 2,
      :AW_WORLDSTATUS_STOPPED => 3
    },
    :AW_ZONE_FLAGS => {
      :AW_ZONE_FLAG_BLOCK_PARTICLES => 2,
      :AW_ZONE_FLAG_BLOCK_LIGHTS => 4,
      :AW_ZONE_FLAG_BLOCK_WORLD_LIGHT => 8,
      :AW_ZONE_FLAG_BLOCK_CHAT => 16,
      :AW_ZONE_FLAG_VISIBLE => 32,
      :AW_ZONE_FLAG_WATER => 1,
      :AW_ZONE_FLAG_BLOCK_JOIN => 64
    },
    :AW_ZONE_TYPES => {
      :AW_ZONE_TYPE_CUBE => 0,
      :AW_ZONE_TYPE_CYLINDER => 1,
      :AW_ZONE_TYPE_SPHERE => 2
    }
  }
end
