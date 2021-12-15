################################################################################
#
# Build the squashfs root filesystem image
#
################################################################################

ROOTFS_SQUASHFS_DEPENDENCIES = host-squashfs

ROOTFS_SQUASHFS_ARGS = 

ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS_PAD),)
ROOTFS_SQUASHFS_ARGS += 
endif

ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS4_LZ4),y)
ROOTFS_SQUASHFS_ARGS += -comp lz4 -Xhc
else ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS4_LZO),y)
ROOTFS_SQUASHFS_ARGS += -comp lzo
else ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS4_LZMA),y)
ROOTFS_SQUASHFS_ARGS += -comp lzma
else ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS4_XZ),y)
ROOTFS_SQUASHFS_ARGS += -comp xz
else ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS4_ZSTD),y)
ROOTFS_SQUASHFS_ARGS += -comp zstd
else
ROOTFS_SQUASHFS_ARGS += 
endif

define ROOTFS_SQUASHFS_CMD
	$(HOST_DIR)/bin/mksquashfs $(TARGET_DIR) $@ $(ROOTFS_SQUASHFS_ARGS) -all-root -noappend -no-exports -no-xattrs
endef

$(eval $(rootfs))
