##########################################################################################
#
# Magisk Module Installer Script
#
##########################################################################################
##########################################################################################
#
# Instructions:
#
# 1. Place your files into system folder (delete the placeholder file)
# 2. Fill in your module's info into module.prop
# 3. Configure and implement callbacks in this file
# 4. If you need boot scripts, add them into common/post-fs-data.sh or common/service.sh
# 5. Add your additional or modified system properties into common/system.prop
#
##########################################################################################

##########################################################################################
# Config Flags
##########################################################################################

# Set to true if you do *NOT* want Magisk to mount
# any files for you. Most modules would NOT want
# to set this flag to true
SKIPMOUNT=false

# Set to true if you need to load system.prop
PROPFILE=false

# Set to true if you need post-fs-data script
POSTFSDATA=false

# Set to true if you need late_start service script
LATESTARTSERVICE=true

##########################################################################################
# Replace list
##########################################################################################

# List all directories you want to directly replace in the system
# Check the documentations for more info why you would need this

# Construct your list in the following format
# This is an example
REPLACE_EXAMPLE="
/system/app/Youtube
/system/priv-app/SystemUI
/system/priv-app/Settings
/system/framework
/system/priv-app/GalaxyApps_OPEN
/system/app/HoneyBoard
/system/app/HoneyMigrator
/system/app/IceCone
/system/priv-app/SamsungBilling
/system/priv-app/SamsungExperienceService
"

# Construct your own list here
# /system/app/OEMLogKit
# /system/product/app/Account
REPLACE="
/system/hidden/SmartTutor
/system/preload/Tips
/system/app/AASAservice
/system/app/AllShareAware
/system/app/AllshareFileShare
/system/app/AllshareMediaShare
/system/app/AntHalService
/system/app/ANTPlusPlugins
/system/app/AppLinker
/system/app/ANTPlusTest
/system/app/ARDrawing
/system/app/ARZone
/system/app/AutomationTest_FB
/system/app/BasicDreams
/system/app/BixbyWakeup
/system/app/BluetoothTest
/system/app/BookmarkProvider
/system/app/Cameralyzer
/system/app/Chrome
/system/app/ChromeCustomizations
/system/app/CocktailQuickTool
/system/app/CompanionDeviceManager
/system/app/ConnectivityUxOverlay
/system/app/DictDiotekForSec
/system/app/DRParser
/system/app/DailyBoard
/system/app/DAAgent
/system/app/DsmsAPK
/system/app/DuoStub
/system/app/EdmSimPinService
/system/app/FactoryAirCommandManager
/system/app/FactoryCameraFB
/system/app/Fast
/system/app/GearManagerStub
/system/app/Gmail2
/system/app/HiyaService
/system/app/ImsSettings
/system/app/KidsHome_Installer
/system/app/LinkSharing_v11
/system/app/LiveDrawing
/system/app/Maps
/system/app/MAPSAgent
/system/app/MdecService
/system/app/MDMApp
/system/app/MdxKitService
/system/app/MinusOnePage
/system/app/PartnerBookmarksProvider
/system/app/PhotoTable
/system/app/Privacy
/system/app/PlayAutoInstallConfig
/system/app/SamsungTTS
/system/app/SamsungPassAutofill_v1
/system/app/SilentLog
/system/app/SimAppDialog
/system/app/SmartSwitchAgent
/system/app/SmartMirroring
/system/app/StickerCenter
/system/app/UniversalMDMClient
/system/app/VisionIntelligence3.7
/system/app/VideoEditorLite_Dream_N
/system/app/VTCameraSetting
/system/app/WebManual
/system/app/WifiGuider
/system/app/WlanTest
/system/app/YouTube
/system/priv-app/AirReadingGlass
/system/priv-app/ANTRadioService
/system/priv-app/AppsEdgePanel_v3.2
/system/priv-app/AREmoji
/system/priv-app/AREmojiEditor
/system/priv-app/AutoDoodle
/system/priv-app/BeaconManager
/system/priv-app/Bixby
/system/priv-app/BixbyService
/system/priv-app/BixbyVisionFramework3.5
/system/priv-app/CallBGProvider
/system/priv-app/CallLogBackup
/system/priv-app/CIDManager
/system/priv-app/CocktailBarService_v3.2
/system/priv-app/DeviceQualityAgent3
/system/priv-app/DeviceTest
/system/priv-app/DiagMonAgent8
/system/priv-app/EasySetup
/system/priv-app/EarphoneTypeC
/system/priv-app/FactoryTestProvider
/system/priv-app/Finder
/system/priv-app/FotaAgent
/system/priv-app/GameHome
/system/priv-app/HdmApk
/system/priv-app/HwModuleTest
/system/priv-app/GalaxyApps_OPEN
/system/priv-app/GpuWatchApp
/system/priv-app/ImsLogger
/system/priv-app/imsservice
/system/priv-app/KLMSAgent
/system/priv-app/knoxanalyticsagent
/system/priv-app/LiveStickers
/system/priv-app/MCFDeviceSync
/system/priv-app/MmsService
/system/priv-app/OMCAgent5
/system/priv-app/Quickboard
/system/priv-app/OneDrive_Samsung_v3
/system/priv-app/PeopleStripe
/system/priv-app/Routines
/system/priv-app/RubinVersion3
/system/priv-app/SamsungBilling
/system/priv-app/SamsungDialer
/system/priv-app/SamsungExperienceService
/system/priv-app/SamsungGallery2018
/system/priv-app/SamsungInCallUI
/system/priv-app/SamsungMessages
/system/priv-app/SamsungPass
/system/priv-app/SamsungSmartSuggestions
/system/priv-app/SamsungMultiConnectivity
/system/priv-app/SecAppSeparation
/system/priv-app/SecMyFiles2020
/system/priv-app/SecTelephonyProvider
/system/priv-app/SecureFolder
/system/priv-app/serviceModeApp_FB
/system/priv-app/SettingsBixby
/system/priv-app/ShareLive
/system/priv-app/SmartCallProvider
/system/priv-app/SmartSwitchAssistant
/system/priv-app/SmartThingsKit
/system/priv-app/SmartManager_v6_DeviceSecurity
/system/priv-app/SKMSAgent
/system/priv-app/SOAgent7
/system/priv-app/SPPPushClient
/system/priv-app/StickerFaceARAvatar
/system/priv-app/StoryService
/system/priv-app/SVCAgent
/system/priv-app/SVoiceIME
/system/priv-app/SystemUIBixby2
/system/priv-app/TADownloader
/system/priv-app/TaPackAuthFw
/system/priv-app/TalkbackSE
/system/priv-app/TaskEdgePanel_v3.2
/system/priv-app/Telecom
/system/priv-app/TelephonyUI
/system/priv-app/TeleService
/system/priv-app/Traceur
/system/priv-app/Upday
/system/product/app/appmanager
/system/product/app/Audible-Android-StubApp-1.0-release
/system/product/app/facebook-stub
/system/product/app/messenger-stub
/system/product/app/Yandex_Search_10.51
/system/product/priv-app/ClaroJuegos_Stub
/system/product/priv-app/installer
/system/product/priv-app/miTelcel_Stub
/system/product/priv-app/MyGalaxy_Stub
/system/product/priv-app/QRreader
/system/product/priv-app/TelcelContenedorStub
/system/product/preload
"

##########################################################################################
#
# Function Callbacks
#
# The following functions will be called by the installation framework.
# You do not have the ability to modify update-binary, the only way you can customize
# installation is through implementing these functions.
#
# When running your callbacks, the installation framework will make sure the Magisk
# internal busybox path is *PREPENDED* to PATH, so all common commands shall exist.
# Also, it will make sure /data, /system, and /vendor is properly mounted.
#
##########################################################################################
##########################################################################################
#
# The installation framework will export some variables and functions.
# You should use these variables and functions for installation.
#
# ! DO NOT use any Magisk internal paths as those are NOT public API.
# ! DO NOT use other functions in util_functions.sh as they are NOT public API.
# ! Non public APIs are not guranteed to maintain compatibility between releases.
#
# Available variables:
#
# MAGISK_VER (string): the version string of current installed Magisk
# MAGISK_VER_CODE (int): the version code of current installed Magisk
# BOOTMODE (bool): true if the module is currently installing in Magisk Manager
# MODPATH (path): the path where your module files should be installed
# TMPDIR (path): a place where you can temporarily store files
# ZIPFILE (path): your module's installation zip
# ARCH (string): the architecture of the device. Value is either arm, arm64, x86, or x64
# IS64BIT (bool): true if $ARCH is either arm64 or x64
# API (int): the API level (Android version) of the device
#
# Availible functions:
#
# ui_print <msg>
#     print <msg> to console
#     Avoid using 'echo' as it will not display in custom recovery's console
#
# abort <msg>
#     print error message <msg> to console and terminate installation
#     Avoid using 'exit' as it will skip the termination cleanup steps
#
# set_perm <target> <owner> <group> <permission> [context]
#     if [context] is empty, it will default to "u:object_r:system_file:s0"
#     this function is a shorthand for the following commands
#       chown owner.group target
#       chmod permission target
#       chcon context target
#
# set_perm_recursive <directory> <owner> <group> <dirpermission> <filepermission> [context]
#     if [context] is empty, it will default to "u:object_r:system_file:s0"
#     for all files in <directory>, it will call:
#       set_perm file owner group filepermission context
#     for all directories in <directory> (including itself), it will call:
#       set_perm dir owner group dirpermission context
#
##########################################################################################
##########################################################################################
# If you need boot scripts, DO NOT use general boot scripts (post-fs-data.d/service.d)
# ONLY use module scripts as it respects the module status (remove/disable) and is
# guaranteed to maintain the same behavior in future Magisk releases.
# Enable boot scripts by setting the flags in the config section above.
##########################################################################################

# Set what you want to display when installing your module

print_modname() {
  ui_print " "
  ui_print "****************************************"
  ui_print " "
  ui_print "            Magisk ModPack"
  ui_print "              for Tab S6"
  ui_print "       by niklas389 @ Github & XDA"
  ui_print " "
  ui_print "****************************************"
  ui_print " "
  ui_print " "
  }

# Copy/extract your module files into $MODPATH in on_install.

on_install() {
  # The following is the default implementation: extract $ZIPFILE/system to $MODPATH
  # Extend/change the logic to whatever you want

  ui_print "-> Installing..."
  unzip -o "$ZIPFILE" 'system/*' -d $MODPATH >&2

  #disabling guest user
  ui_print "  - Disabling Guest User"
  settings put global guest_user_enabled 0
  #setting animation scales
  ui_print "  - Setting Animation Speed"
  settings put global window_animation_scale 0.65
  settings put global transition_animation_scale 0.65
  settings put global animator_duration_scale 0.65
}

# Only some special files require specific permissions
# This function will be called after on_install is done
# The default permissions should be good enough for most cases

set_permissions() {
  # The following is the default rule, DO NOT remove
  set_perm_recursive $MODPATH 0 0 0755 0644

  # Here are some examples:
  # set_perm_recursive  $MODPATH/system/lib       0     0       0755      0644
  # set_perm  $MODPATH/system/bin/app_process32   0     2000    0755      u:object_r:zygote_exec:s0
  # set_perm  $MODPATH/system/bin/dex2oat         0     2000    0755      u:object_r:dex2oat_exec:s0
  # set_perm  $MODPATH/system/lib/libart.so       0     0       0644
}

# You can add more functions to assist your custom script code

cancel() {
  imageless_magisk || unmount_magisk_image
  ui_print "! Installation cancelled, reason:"
  abort "  -$1"
}