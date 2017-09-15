# xmidt

Xmidt (pronounced "transmit") is a combination of a server cluster and client that provide a highly available data path to devices deployed all over the world.

# tl;dr summary

A device connects to the xmidt cloud via the xmidt client.  Cloud based services can use the xmidt cloud api to send and receive messages from the devices without needing to worry about where the device is in the world or in the network.  Push and pull data from the device with ease.

# the xmidt servers

### [caduceus](https://github.com/Comcast/caduceus)

Caduceus provides the pub-sub message delivery mechanism for xmidt.

[![Build Status](https://travis-ci.org/Comcast/caduceus.svg?branch=master)](https://travis-ci.org/Comcast/caduceus) 
[![codecov.io](http://codecov.io/github/Comcast/caduceus/coverage.svg?branch=master)](http://codecov.io/github/Comcast/caduceus?branch=master)
[![Go Report Card](https://goreportcard.com/badge/github.com/Comcast/caduceus)](https://goreportcard.com/report/github.com/Comcast/caduceus)
[![Code Climate](https://codeclimate.com/github/Comcast/caduceus/badges/gpa.svg)](https://codeclimate.com/github/Comcast/caduceus)
[![Issue Count](https://codeclimate.com/github/Comcast/caduceus/badges/issue_count.svg)](https://codeclimate.com/github/Comcast/caduceus)
[![Apache V2 License](http://img.shields.io/badge/license-Apache%20V2-blue.svg)](https://github.com/Comcast/caduceus/blob/master/LICENSE)


### [scytale](https://github.com/Comcast/scytale)

Scytale accepts the inbound requests, fans out across data centers and delivers the messages to the Talaria machines that could be hosting the device connection.

[![Build Status](https://travis-ci.org/Comcast/scytale.svg?branch=master)](https://travis-ci.org/Comcast/scytale) 
[![codecov.io](http://codecov.io/github/Comcast/scytale/coverage.svg?branch=master)](http://codecov.io/github/Comcast/scytale?branch=master)
[![Go Report Card](https://goreportcard.com/badge/github.com/Comcast/scytale)](https://goreportcard.com/report/github.com/Comcast/scytale)
[![Code Climate](https://codeclimate.com/github/Comcast/scytale/badges/gpa.svg)](https://codeclimate.com/github/Comcast/scytale)
[![Issue Count](https://codeclimate.com/github/Comcast/scytale/badges/issue_count.svg)](https://codeclimate.com/github/Comcast/scytale)
[![Apache V2 License](http://img.shields.io/badge/license-Apache%20V2-blue.svg)](https://github.com/Comcast/scytale/blob/master/LICENSE)


### [talaria](https://github.com/Comcast/talaria)

Talaria maintains the secure websocket connections from the device and passes the messages from or to the device.

[![Build Status](https://travis-ci.org/Comcast/talaria.svg?branch=master)](https://travis-ci.org/Comcast/talaria) 
[![codecov.io](http://codecov.io/github/Comcast/talaria/coverage.svg?branch=master)](http://codecov.io/github/Comcast/talaria?branch=master)
[![Go Report Card](https://goreportcard.com/badge/github.com/Comcast/talaria)](https://goreportcard.com/report/github.com/Comcast/talaria)
[![Code Climate](https://codeclimate.com/github/Comcast/talaria/badges/gpa.svg)](https://codeclimate.com/github/Comcast/talaria)
[![Issue Count](https://codeclimate.com/github/Comcast/talaria/badges/issue_count.svg)](https://codeclimate.com/github/Comcast/talaria)
[![Apache V2 License](http://img.shields.io/badge/license-Apache%20V2-blue.svg)](https://github.com/Comcast/talaria/blob/master/LICENSE)


### [petasos](https://github.com/Comcast/petasos)

Petasos helps reduce the load on the Talaria machines during mass reboot cases by calculating which specific Talaria a device should connect to & redirecting the incoming request.

[![Build Status](https://travis-ci.org/Comcast/petasos.svg?branch=master)](https://travis-ci.org/Comcast/petasos) 
[![codecov.io](http://codecov.io/github/Comcast/petasos/coverage.svg?branch=master)](http://codecov.io/github/Comcast/petasos?branch=master)
[![Go Report Card](https://goreportcard.com/badge/github.com/Comcast/petasos)](https://goreportcard.com/report/github.com/Comcast/petasos)
[![Code Climate](https://codeclimate.com/github/Comcast/petasos/badges/gpa.svg)](https://codeclimate.com/github/Comcast/petasos)
[![Issue Count](https://codeclimate.com/github/Comcast/petasos/badges/issue_count.svg)](https://codeclimate.com/github/Comcast/petasos)
[![Apache V2 License](http://img.shields.io/badge/license-Apache%20V2-blue.svg)](https://github.com/Comcast/petasos/blob/master/LICENSE)

### [mnemosyne](https://github.com/Comcast/mnemosyne)

# the xmidt client

### [parodus](https://github.com/Comcast/parodus)

Parodus is the light weight client that reaches out to the xmidt cloud to establish the connection.

[![Build Status](https://travis-ci.org/Comcast/parodus.svg?branch=master)](https://travis-ci.org/Comcast/parodus)
[![codecov.io](http://codecov.io/github/Comcast/parodus/coverage.svg?branch=master)](http://codecov.io/github/Comcast/parodus?branch=master)
[![Coverity](https://img.shields.io/coverity/scan/11192.svg)](https://scan.coverity.com/projects/comcast-parodus)
[![Apache V2 License](http://img.shields.io/badge/license-Apache%20V2-blue.svg)](https://github.com/Comcast/parodus/blob/master/LICENSE)

# server support libraries

### webpa-common
### [webpa-common](https://github.com/Comcast/webpa-common)

[![Build Status](https://travis-ci.org/Comcast/webpa-common.svg?branch=master)](https://travis-ci.org/Comcast/webpa-common) 
[![codecov.io](http://codecov.io/github/Comcast/webpa-common/coverage.svg?branch=master)](http://codecov.io/github/Comcast/webpa-common?branch=master)
[![Go Report Card](https://goreportcard.com/badge/github.com/Comcast/webpa-common)](https://goreportcard.com/report/github.com/Comcast/webpa-common)

### [kratos](https://github.com/Comcast/kratos)

[![Build Status](https://travis-ci.org/Comcast/kratos.svg?branch=master)](https://travis-ci.org/Comcast/kratos)
[![codecov.io](http://codecov.io/github/Comcast/kratos/coverage.svg?branch=master)](http://codecov.io/github/Comcast/kratos?branch=master)
[![Go Report Card](https://goreportcard.com/badge/github.com/Comcast/kratos)](https://goreportcard.com/report/github.com/Comcast/kratos)

### [golang-money](https://github.com/Comcast/golang-money)

[![Build Status](https://travis-ci.org/Comcast/golang-money.svg?branch=master)](https://travis-ci.org/Comcast/golang-money) 
[![codecov.io](http://codecov.io/github/Comcast/golang-money/coverage.svg?branch=master)](http://codecov.io/github/Comcast/golang-money?branch=master) 
[![Go Report Card](https://goreportcard.com/badge/github.com/Comcast/golang-money)](https://goreportcard.com/report/github.com/Comcast/golang-money) 

### [tr18b1e](https://github.com/Comcast/tr18b1e)

[![Build Status](https://travis-ci.org/Comcast/tr18b1e.svg?branch=master)](https://travis-ci.org/Comcast/tr18b1e)
[![codecov.io](http://codecov.io/github/Comcast/tr18b1e/coverage.svg?branch=master)](http://codecov.io/github/Comcast/tr18b1e?branch=master)
[![Go Report Card](https://goreportcard.com/badge/github.com/Comcast/tr18b1e)](https://goreportcard.com/report/github.com/Comcast/tr18b1e)

### [golang-discovery-client](https://github.com/Comcast/golang-discovery-client)

[![Build Status](https://travis-ci.org/Comcast/golang-discovery-client.svg?branch=master)](https://travis-ci.org/Comcast/golang-discovery-client) 
[![codecov.io](http://codecov.io/github/Comcast/golang-discovery-client/coverage.svg?branch=master)](http://codecov.io/github/Comcast/golang-discovery-client?branch=master) 
[![Go Report Card](https://goreportcard.com/badge/github.com/Comcast/golang-discovery-client)](https://goreportcard.com/report/github.com/Comcast/golang-discovery-client) 

# client support libraries

### nopoll
### [nopoll](https://github.com/Comcast/nopoll)

### [cimplog](https://github.com/Comcast/cimplog)

[![Build Status](https://travis-ci.org/Comcast/cimplog.svg?branch=master)](https://travis-ci.org/Comcast/cimplog)
[![codecov.io](http://codecov.io/github/Comcast/cimplog/coverage.svg?branch=master)](http://codecov.io/github/Comcast/cimplog?branch=master)
[![Coverity](https://img.shields.io/coverity/scan/11572.svg)]("https://scan.coverity.com/projects/comcast-cimplog)
[![Apache V2 License](http://img.shields.io/badge/license-Apache%20V2-blue.svg)](https://github.com/Comcast/cimplog/blob/master/LICENSE.txt)

### [seshat](https://github.com/Comcast/seshat)

[![Build Status](https://travis-ci.org/Comcast/seshat.svg?branch=master)](https://travis-ci.org/Comcast/seshat)
[![codecov.io](http://codecov.io/github/Comcast/seshat/coverage.svg?branch=master)](http://codecov.io/github/Comcast/seshat?branch=master)
[![Coverity](https://img.shields.io/coverity/scan/11941.svg)]("https://scan.coverity.com/projects/comcast-seshat)
[![Apache V2 License](http://img.shields.io/badge/license-Apache%20V2-blue.svg)](https://github.com/Comcast/seshat/blob/master/LICENSE.txt)

### [cjwt](https://github.com/Comcast/cjwt)

[![Build Status](https://travis-ci.org/Comcast/cjwt.svg?branch=master)](https://travis-ci.org/Comcast/cjwt)
[![codecov.io](http://codecov.io/github/Comcast/cjwt/coverage.svg?branch=master)](http://codecov.io/github/Comcast/cjwt?branch=master)
[![Coverity](https://img.shields.io/coverity/scan/11926.svg)]("https://scan.coverity.com/projects/comcast-cjwt)
[![Apache V2 License](http://img.shields.io/badge/license-Apache%20V2-blue.svg)](https://github.com/Comcast/cjwt/blob/master/LICENSE.txt)

### [cjson-extras](https://github.com/Comcast/cjson-extras)

### [libucresolv](https://github.com/Comcast/libucresolv)

### [wrp-c](https://github.com/Comcast/wrp-c)

[![Build Status](https://travis-ci.org/Comcast/wrp-c.svg?branch=master)](https://travis-ci.org/Comcast/wrp-c)
[![codecov.io](http://codecov.io/github/Comcast/wrp-c/coverage.svg?branch=master)](http://codecov.io/github/Comcast/wrp-c?branch=master)
[![Coverity](https://img.shields.io/coverity/scan/9155.svg)]("https://scan.coverity.com/projects/comcast-wrp-c)
[![Apache V2 License](http://img.shields.io/badge/license-Apache%20V2-blue.svg)](https://github.com/Comcast/wrp-c/blob/master/LICENSE.txt)

### [trower-base64](https://github.com/Comcast/trower-base64)

[![Build Status](https://travis-ci.org/Comcast/trower-base64.svg?branch=master)](https://travis-ci.org/Comcast/trower-base64) [![codecov.io](http://codecov.io/github/Comcast/trower-base64/coverage.svg?branch=master)](http://codecov.io/github/Comcast/trower-base64?branch=master)
[![coverity](https://img.shields.io/coverity/scan/9029.svg)](https://scan.coverity.com/projects/trower-base64)
