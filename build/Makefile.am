AUTOMAKE_OPTIONS = foreign subdir-objects
ACLOCAL_AMFLAGS = -I m4

########################################
# Compile the libraries we depend upon #
########################################

# Static library names
Shared = libsnoxdko-shared.la
Lua = liblua-5.2.2.la

# Library build list
lib_LTLIBRARIES = $(Shared) $(Lua)

###########################
#   Shared code library   #
###########################
libsnoxdko_shared_la_CPPFLAGS = -D$(BUILD_TYPE)
libsnoxdko_shared_la_LIBADD = $(UNIXODBC_LIBS)
libsnoxdko_shared_la_SOURCES = \
	../src/shared/DebugUtils.cpp \
	../src/shared/globals.cpp \
	../src/shared/Mutex.cpp \
	../src/shared/Thread.cpp \
	../src/shared/Condition.cpp \
	../src/shared/RWLock.cpp \
	../src/shared/tstring.cpp \
	../src/shared/Ini.cpp \
	../src/shared/database/OdbcRecordset.cpp \
	../src/shared/database/OdbcConnection.cpp \
	../src/shared/database/OdbcCommand.cpp \
	../src/shared/database/OdbcParameter.cpp \
	../src/shared/CircularBuffer.cpp \
	../src/shared/SocketOpsLinux.cpp \
	../src/shared/SocketMgr.cpp \
	../src/shared/SocketMgrLinux.cpp \
	../src/shared/Socket.cpp \
	../src/shared/SocketLinux.cpp \
	../src/shared/KOSocket.cpp \
	../src/shared/JvCryption.cpp \
	../src/shared/crc32.cpp \
	../src/shared/lzf.cpp \
	../src/shared/SMDFile.cpp \
	../src/shared/TimeThread.cpp \
	../src/shared/ReferenceObject.cpp \
	../src/shared/signal_handler.cpp \
	../src/N3BASE/N3ShapeMgr.cpp

###########################
#       Lua library       #
###########################

# TO-DO: Set the platform via autoconf.
liblua_5_2_2_la_CPPFLAGS = -D$(BUILD_TYPE) -DLUA_USE_LINUX
liblua_5_2_2_la_SOURCES = \
	../src/scripting/Lua/lapi.c ../src/scripting/Lua/lauxlib.c \
	../src/scripting/Lua/lbaselib.c ../src/scripting/Lua/lbitlib.c \
	../src/scripting/Lua/lcode.c ../src/scripting/Lua/lcorolib.c \
	../src/scripting/Lua/lctype.c ../src/scripting/Lua/ldblib.c \
	../src/scripting/Lua/ldebug.c ../src/scripting/Lua/ldo.c \
	../src/scripting/Lua/ldump.c ../src/scripting/Lua/lfunc.c \
	../src/scripting/Lua/lgc.c ../src/scripting/Lua/linit.c \
	../src/scripting/Lua/liolib.c ../src/scripting/Lua/llex.c \
	../src/scripting/Lua/lmathlib.c ../src/scripting/Lua/lmem.c \
	../src/scripting/Lua/loadlib.c ../src/scripting/Lua/lobject.c \
	../src/scripting/Lua/lopcodes.c ../src/scripting/Lua/loslib.c \
	../src/scripting/Lua/lparser.c ../src/scripting/Lua/lstate.c \
	../src/scripting/Lua/lstring.c ../src/scripting/Lua/lstrlib.c \
	../src/scripting/Lua/ltable.c ../src/scripting/Lua/ltablib.c \
	../src/scripting/Lua/ltm.c ../src/scripting/Lua/lundump.c \
	../src/scripting/Lua/lvm.c ../src/scripting/Lua/lzio.c

########################################
#    Build the server applications     #
########################################
bin_PROGRAMS = VersionManager AIServer Ebenezer

###########################
#      Login server       #
###########################
VersionManager_CPPFLAGS = -D$(BUILD_TYPE) -DLOGIN_SERVER
VersionManager_LDADD = $(Shared)
VersionManager_SOURCES = \
	../src/LogInServer/main.cpp \
	../src/LogInServer/stdafx.cpp \
	../src/LogInServer/LoginServer.cpp \
	../src/LogInServer/LoginSession.cpp \
	../src/LogInServer/DBProcess.cpp

###########################
#       Game server       #
###########################
Ebenezer_CPPFLAGS = -D$(BUILD_TYPE) -DEBENEZER
Ebenezer_LDADD = $(Shared) $(Lua)
Ebenezer_SOURCES = \
	../src/Ebenezer/main.cpp \
	../src/Ebenezer/DatabaseThread.cpp \
	../src/Ebenezer/DBAgent.cpp \
	../src/Ebenezer/lua_bindings.cpp \
	../src/Ebenezer/LuaEngine.cpp \
	../src/Ebenezer/User.cpp \
	../src/Ebenezer/ArenaHandler.cpp \
	../src/Ebenezer/AttackHandler.cpp \
	../src/Ebenezer/CharacterMovementHandler.cpp \
	../src/Ebenezer/CharacterSelectionHandler.cpp \
	../src/Ebenezer/ChatHandler.cpp \
	../src/Ebenezer/FriendHandler.cpp \
	../src/Ebenezer/ItemHandler.cpp \
	../src/Ebenezer/LetterHandler.cpp \
	../src/Ebenezer/LoginHandler.cpp \
	../src/Ebenezer/MerchantHandler.cpp \
	../src/Ebenezer/NPCHandler.cpp \
	../src/Ebenezer/PartyHandler.cpp \
	../src/Ebenezer/QuestHandler.cpp \
	../src/Ebenezer/RentalHandler.cpp \
	../src/Ebenezer/ShoppingMallHandler.cpp \
	../src/Ebenezer/TradeHandler.cpp \
	../src/Ebenezer/SealHandler.cpp \
	../src/Ebenezer/UpgradeHandler.cpp \
	../src/Ebenezer/AISocket.cpp \
	../src/Ebenezer/ConsoleInputThread.cpp \
	../src/Ebenezer/EbenezerDlg.cpp \
	../src/Ebenezer/GameEvent.cpp \
	../src/Ebenezer/KingSystem.cpp \
	../src/Ebenezer/Knights.cpp \
	../src/Ebenezer/KnightsManager.cpp \
	../src/Ebenezer/LoadServerData.cpp \
	../src/Ebenezer/MagicInstance.cpp \
	../src/Ebenezer/MagicProcess.cpp \
	../src/Ebenezer/Map.cpp \
	../src/Ebenezer/Npc.cpp \
	../src/Ebenezer/Region.cpp \
	../src/Ebenezer/Unit.cpp \
	../src/Ebenezer/stdafx.cpp

###########################
#        AI server        #
###########################
AIServer_CPPFLAGS = -D$(BUILD_TYPE) -DAI_SERVER
AIServer_LDADD = $(Shared)
AIServer_SOURCES = \
	../src/Ebenezer/Unit.cpp \
	../src/Ebenezer/MagicProcess.cpp \
	../src/AIServer/main.cpp \
	../src/AIServer/AIUser.cpp \
	../src/AIServer/GameSocket.cpp \
	../src/AIServer/MAP.cpp \
	../src/AIServer/Npc.cpp \
	../src/AIServer/NpcMagicProcess.cpp \
	../src/AIServer/NpcThread.cpp \
	../src/AIServer/Party.cpp \
	../src/AIServer/PathFind.cpp \
	../src/AIServer/RoomEvent.cpp \
	../src/AIServer/ServerDlg.cpp \
	../src/AIServer/stdafx.cpp

########################################
#           Post-build script          #
#   Copies files to build's bin dir    #
########################################
all-local:
if DEBUG_BUILD
        BinDir = ../bin/Debug/
else
        BinDir = ../bin/Release/
endif
	@cp VersionManager $(BinDir)
	@cp Ebenezer $(BinDir)
	@cp AIServer $(BinDir)	
	@echo Server files copied to directory: $(BinDir)
