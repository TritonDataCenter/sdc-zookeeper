<!--
    This Source Code Form is subject to the terms of the Mozilla Public
    License, v. 2.0. If a copy of the MPL was not distributed with this
    file, You can obtain one at http://mozilla.org/MPL/2.0/.
-->

<!--
    Copyright (c) 2014, Joyent, Inc.
-->

# sdc-zookeeper

This repository is part of the Joyent SmartDataCenter project (SDC).  For
contribution guidelines, issues, and general documentation, visit the main
[SDC](http://github.com/joyent/sdc) project page.

# DEPRECATED

This repo is now deprecated. SDC no longer uses the separate "zookeeper"
core zones. Instead SDC's zk is used from the "binder" zones. See
[binder.git](http://github.com/joyent/binder).

# Overview

This repo contains the setup and configuration for the SDC zookeeper *zone*.
Zookeeper itself is delivered via the zookeeper-common submodule.
