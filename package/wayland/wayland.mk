WAYLAND_VERSION = 4b681a7fd4bee01c4d3385e69ee47ed3856c2229
WAYLAND_SITE = git://anongit.freedesktop.org/wayland/wayland
WAYLAND_SITE_METHOD = git
HOST_WAYLAND_DEPENDENCIES = host-expat host-libffi
WAYLAND_DEPENDENCIES = host-pkg-config udev VideoCore libffi host-wayland
WAYLAND_INSTALL_STAGING = YES

# Wayland needs the host tool wayland-scanner to be built first

HOST_WAYLAND_AUTORECONF = YES

define HOST_WAYLAND_CONFIG_CMDS
	(cd $(@D) && rm -rf config.cache; \
	        $(HOST_CONFIGURE_OPTS) \
		CFLAGS="$(HOST_CFLAGS)" \
		LDFLAGS="$(HOST_LDFLAGS)" \
		./configure \
		--prefix="$(HOST_DIR)/usr" \
		--sysconfdir="$(HOST_DIR)/etc" \
	)
endef

WAYLAND_CONF_OPT += --disable-scanner

WAYLAND_AUTORECONF = YES

$(eval $(autotools-package))
$(eval $(host-autotools-package))
