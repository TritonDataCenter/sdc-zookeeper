#
# Copyright (c) 2014, Joyent, Inc. All rights reserved.
#

NAME=sdc-zookeeper

include ./tools/mk/Makefile.defs

TAR=tar
RELEASE_TARBALL=$(NAME)-pkg-$(STAMP).tar.bz2
ROOT := $(shell pwd)
RELSTAGEDIR := /tmp/$(STAMP)


#
# Targets
#

.PHONY: all

all: sdc-scripts

.PHONY: release
release: all
	@echo "Building $(RELEASE_TARBALL)"
	@mkdir -p $(RELSTAGEDIR)/root/opt/smartdc/boot
	cp -r $(ROOT)/deps/sdc-scripts/* \
		$(RELSTAGEDIR)/root/opt/smartdc/boot
	cp -r $(ROOT)/boot \
		$(RELSTAGEDIR)/root/opt/smartdc/boot
	@mkdir -p $(RELSTAGEDIR)/root/opt/smartdc/zk
	cp -r $(ROOT)/zookeeper-base/sapi_manifests \
		$(RELSTAGEDIR)/root/opt/smartdc/zk
	@rm -rf $(RELSTAGEDIR)

.PHONY: publish
publish: release
	@if [[ -z "$(BITS_DIR)" ]]; then \
		@echo "error: 'BITS_DIR' must be set for 'publish' target"; \
		exit 1; \
	fi
	mkdir -p $(BITS_DIR)/binder
	cp $(ROOT)/$(RELEASE_TARBALL) $(BITS_DIR)/binder/$(RELEASE_TARBALL)


include ./tools/mk/Makefile.deps
include ./tools/mk/Makefile.targ

sdc-scripts: deps/sdc-scripts/.git
