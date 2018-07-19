## CRUD
Utility to perform parodus CRUD operations for a particular device mac.

To build with just go:
```
export GOPATH=`pwd`
cd src
glide install
cd xmidt
go build

```

## Authentication
export WEBPA_SAT=<SAT_Token>

### Example :

### Create
```
./xmidt -messageType=5 -source="tag-update" -dest="mac:14cfe21421xx/parodus/tag/test1" -transId="bd4ad2d1-5c9c-486f-8e25-52c242b38" -contentType="application/json" -payload='{ "expires" : 12345}'
```

### Retrieve
```
./xmidt -messageType=6 -source="tag-update" -dest="mac:14cfe21421xx/parodus/tag/test1" -transId="bd4ad2d1-5c9c-486f-8e25-52c242b38" -contentType="application/json"

```


### Update
```
./xmidt -messageType=7 -source="tag-update" -dest="mac:14cfe21421xx/parodus/tag/test1" -transId="bd4ad2d1-5c9c-486f-8e25-52c242b38" -contentType="application/json" -payload='{ "expires" : 12345}'

```

### Delete
```
./xmidt -messageType=8 -source="tag-update" -dest="mac:14cfe21421xx/parodus/tag/test1" -transId="bd4ad2d1-5c9c-486f-8e25-52c242b38" -contentType="application/json"

```

