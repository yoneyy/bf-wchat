# This file is generated by gyp; do not edit.

TOOLSET := target
TARGET := bf-wchat
DEFS_Debug := \
	'-DNODE_GYP_MODULE_NAME=bf-wchat' \
	'-DUSING_UV_SHARED=1' \
	'-DUSING_V8_SHARED=1' \
	'-DV8_DEPRECATION_WARNINGS=1' \
	'-DV8_DEPRECATION_WARNINGS' \
	'-DV8_IMMINENT_DEPRECATION_WARNINGS' \
	'-D_LARGEFILE_SOURCE' \
	'-D_FILE_OFFSET_BITS=64' \
	'-D__STDC_FORMAT_MACROS' \
	'-DOPENSSL_NO_PINSHARED' \
	'-DOPENSSL_THREADS' \
	'-DNAPI_DISABLE_CPP_EXCEPTIONS' \
	'-DBUILDING_NODE_EXTENSION' \
	'-DDEBUG' \
	'-D_DEBUG' \
	'-DV8_ENABLE_CHECKS'

# Flags passed to all source files.
CFLAGS_Debug := \
	-fPIC \
	-pthread \
	-Wall \
	-Wextra \
	-Wno-unused-parameter \
	-m64 \
	-g \
	-O0

# Flags passed to only C files.
CFLAGS_C_Debug :=

# Flags passed to only C++ files.
CFLAGS_CC_Debug := \
	-fno-rtti \
	-std=gnu++1y

INCS_Debug := \
	-I/root/.cache/node-gyp/14.18.1/include/node \
	-I/root/.cache/node-gyp/14.18.1/src \
	-I/root/.cache/node-gyp/14.18.1/deps/openssl/config \
	-I/root/.cache/node-gyp/14.18.1/deps/openssl/openssl/include \
	-I/root/.cache/node-gyp/14.18.1/deps/uv/include \
	-I/root/.cache/node-gyp/14.18.1/deps/zlib \
	-I/root/.cache/node-gyp/14.18.1/deps/v8/include \
	-I$(srcdir)/include/**/* \
	-I/www/test/wework-chat-cpp/node_modules/node-addon-api

DEFS_Release := \
	'-DNODE_GYP_MODULE_NAME=bf-wchat' \
	'-DUSING_UV_SHARED=1' \
	'-DUSING_V8_SHARED=1' \
	'-DV8_DEPRECATION_WARNINGS=1' \
	'-DV8_DEPRECATION_WARNINGS' \
	'-DV8_IMMINENT_DEPRECATION_WARNINGS' \
	'-D_LARGEFILE_SOURCE' \
	'-D_FILE_OFFSET_BITS=64' \
	'-D__STDC_FORMAT_MACROS' \
	'-DOPENSSL_NO_PINSHARED' \
	'-DOPENSSL_THREADS' \
	'-DNAPI_DISABLE_CPP_EXCEPTIONS' \
	'-DBUILDING_NODE_EXTENSION'

# Flags passed to all source files.
CFLAGS_Release := \
	-fPIC \
	-pthread \
	-Wall \
	-Wextra \
	-Wno-unused-parameter \
	-m64 \
	-O3 \
	-fno-omit-frame-pointer

# Flags passed to only C files.
CFLAGS_C_Release :=

# Flags passed to only C++ files.
CFLAGS_CC_Release := \
	-fno-rtti \
	-std=gnu++1y

INCS_Release := \
	-I/root/.cache/node-gyp/14.18.1/include/node \
	-I/root/.cache/node-gyp/14.18.1/src \
	-I/root/.cache/node-gyp/14.18.1/deps/openssl/config \
	-I/root/.cache/node-gyp/14.18.1/deps/openssl/openssl/include \
	-I/root/.cache/node-gyp/14.18.1/deps/uv/include \
	-I/root/.cache/node-gyp/14.18.1/deps/zlib \
	-I/root/.cache/node-gyp/14.18.1/deps/v8/include \
	-I$(srcdir)/include/**/* \
	-I/www/test/wework-chat-cpp/node_modules/node-addon-api

OBJS := \
	$(obj).target/$(TARGET)/wework_chat.o

# Add to the list of files we specially track dependencies for.
all_deps += $(OBJS)

# CFLAGS et al overrides must be target-local.
# See "Target-specific Variable Values" in the GNU Make manual.
$(OBJS): TOOLSET := $(TOOLSET)
$(OBJS): GYP_CFLAGS := $(DEFS_$(BUILDTYPE)) $(INCS_$(BUILDTYPE))  $(CFLAGS_$(BUILDTYPE)) $(CFLAGS_C_$(BUILDTYPE))
$(OBJS): GYP_CXXFLAGS := $(DEFS_$(BUILDTYPE)) $(INCS_$(BUILDTYPE))  $(CFLAGS_$(BUILDTYPE)) $(CFLAGS_CC_$(BUILDTYPE))

# Suffix rules, putting all outputs into $(obj).

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(srcdir)/%.cpp FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

# Try building from generated source, too.

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(obj).$(TOOLSET)/%.cpp FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(obj)/%.cpp FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

# End of this set of suffix rules
### Rules for final target.
LDFLAGS_Debug := \
	-pthread \
	-rdynamic \
	-m64

LDFLAGS_Release := \
	-pthread \
	-rdynamic \
	-m64

LIBS := \
	/www/test/wework-chat-cpp/lib/libWeWorkFinanceSdk_C.so

$(obj).target/bf-wchat.node: GYP_LDFLAGS := $(LDFLAGS_$(BUILDTYPE))
$(obj).target/bf-wchat.node: LIBS := $(LIBS)
$(obj).target/bf-wchat.node: TOOLSET := $(TOOLSET)
$(obj).target/bf-wchat.node: $(OBJS) FORCE_DO_CMD
	$(call do_cmd,solink_module)

all_deps += $(obj).target/bf-wchat.node
# Add target alias
.PHONY: bf-wchat
bf-wchat: $(builddir)/bf-wchat.node

# Copy this to the executable output path.
$(builddir)/bf-wchat.node: TOOLSET := $(TOOLSET)
$(builddir)/bf-wchat.node: $(obj).target/bf-wchat.node FORCE_DO_CMD
	$(call do_cmd,copy)

all_deps += $(builddir)/bf-wchat.node
# Short alias for building this executable.
.PHONY: bf-wchat.node
bf-wchat.node: $(obj).target/bf-wchat.node $(builddir)/bf-wchat.node

# Add executable to "all" target.
.PHONY: all
all: $(builddir)/bf-wchat.node

