# xmidt

Xmidt (pronounced "transmit") is a combination of a server cluster and client that provide a highly available data path to devices deployed all over the world.

# tl;dr summary

A device connects to the xmidt cloud via the xmidt client.  Cloud based services can use the xmidt cloud api to send and receive messages from the devices without needing to worry about where the device is in the world or in the network.  Push and pull data from the device with ease.

# the xmidt servers

### caduceus

Caduceus provides the pub-sub message delivery mechanism for xmidt.

[![Build Status](https://travis-ci.org/Comcast/caduceus.svg?branch=master)](https://travis-ci.org/Comcast/caduceus) 
[![codecov.io](http://codecov.io/github/Comcast/caduceus/coverage.svg?branch=master)](http://codecov.io/github/Comcast/caduceus?branch=master)
[![Go Report Card](https://goreportcard.com/badge/github.com/Comcast/caduceus)](https://goreportcard.com/report/github.com/Comcast/caduceus)
[![Code Climate](https://codeclimate.com/github/Comcast/caduceus/badges/gpa.svg)](https://codeclimate.com/github/Comcast/caduceus)
[![Issue Count](https://codeclimate.com/github/Comcast/caduceus/badges/issue_count.svg)](https://codeclimate.com/github/Comcast/caduceus)
[![Apache V2 License](http://img.shields.io/badge/license-Apache%20V2-blue.svg)](https://github.com/Comcast/caduceus/blob/master/LICENSE)


### scytale

Scytale accepts the inbound requests, fans out across data centers and delivers the messages to the Talaria machines that could be hosting the device connection.

[![Build Status](https://travis-ci.org/Comcast/scytale.svg?branch=master)](https://travis-ci.org/Comcast/scytale) 
[![codecov.io](http://codecov.io/github/Comcast/scytale/coverage.svg?branch=master)](http://codecov.io/github/Comcast/scytale?branch=master)
[![Go Report Card](https://goreportcard.com/badge/github.com/Comcast/scytale)](https://goreportcard.com/report/github.com/Comcast/scytale)
[![Code Climate](https://codeclimate.com/github/Comcast/scytale/badges/gpa.svg)](https://codeclimate.com/github/Comcast/scytale)
[![Issue Count](https://codeclimate.com/github/Comcast/scytale/badges/issue_count.svg)](https://codeclimate.com/github/Comcast/scytale)
[![Apache V2 License](http://img.shields.io/badge/license-Apache%20V2-blue.svg)](https://github.com/Comcast/scytale/blob/master/LICENSE)


### talaria

Talaria maintains the secure websocket connections from the device and passes the messages from or to the device.

[![Build Status](https://travis-ci.org/Comcast/talaria.svg?branch=master)](https://travis-ci.org/Comcast/talaria) 
[![codecov.io](http://codecov.io/github/Comcast/talaria/coverage.svg?branch=master)](http://codecov.io/github/Comcast/talaria?branch=master)
[![Go Report Card](https://goreportcard.com/badge/github.com/Comcast/talaria)](https://goreportcard.com/report/github.com/Comcast/talaria)
[![Code Climate](https://codeclimate.com/github/Comcast/talaria/badges/gpa.svg)](https://codeclimate.com/github/Comcast/talaria)
[![Issue Count](https://codeclimate.com/github/Comcast/talaria/badges/issue_count.svg)](https://codeclimate.com/github/Comcast/talaria)
[![Apache V2 License](http://img.shields.io/badge/license-Apache%20V2-blue.svg)](https://github.com/Comcast/talaria/blob/master/LICENSE)


### petasos

Petasos helps reduce the load on the Talaria machines during mass reboot cases by calculating which specific Talaria a device should connect to & redirecting the incoming request.

[![Build Status](https://travis-ci.org/Comcast/petasos.svg?branch=master)](https://travis-ci.org/Comcast/petasos) 
[![codecov.io](http://codecov.io/github/Comcast/petasos/coverage.svg?branch=master)](http://codecov.io/github/Comcast/petasos?branch=master)
[![Go Report Card](https://goreportcard.com/badge/github.com/Comcast/petasos)](https://goreportcard.com/report/github.com/Comcast/petasos)
[![Code Climate](https://codeclimate.com/github/Comcast/petasos/badges/gpa.svg)](https://codeclimate.com/github/Comcast/petasos)
[![Issue Count](https://codeclimate.com/github/Comcast/petasos/badges/issue_count.svg)](https://codeclimate.com/github/Comcast/petasos)
[![Apache V2 License](http://img.shields.io/badge/license-Apache%20V2-blue.svg)](https://github.com/Comcast/petasos/blob/master/LICENSE)


# the xmidt client

### parodus

Parodus is the light weight client that reaches out to the xmidt cloud to establish the connection.

[![Build Status](https://travis-ci.org/Comcast/parodus.svg?branch=master)](https://travis-ci.org/Comcast/parodus)
[![codecov.io](http://codecov.io/github/Comcast/parodus/coverage.svg?branch=master)](http://codecov.io/github/Comcast/parodus?branch=master)
[![Coverity](https://img.shields.io/coverity/scan/11192.svg)](https://scan.coverity.com/projects/comcast-parodus)
[![Apache V2 License](http://img.shields.io/badge/license-Apache%20V2-blue.svg)](https://github.com/Comcast/parodus/blob/master/LICENSE)

# server support libraries

### webpa-common
### kratos

# client support libraries

### 
