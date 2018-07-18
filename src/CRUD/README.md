## CRUD
Utility to perform parodus CRUD operations for a particular device mac.

To build with just go:
```
export GOPATH=`pwd`
cd src
glide install
cd CRUD
go build

```

## Authentication
export WEBPA_SAT=<SAT_Token>

### Example :

### Create
```
./CRUD -messageType=5 -source="tag-update" -dest="mac:14cfe21421xx/parodus/tag/test1" -transId="bd4ad2d1-5c9c-486f-8e25-52c242b38" -contentType="application/json" -payload='{ "expires" : 12345}'
```

### Retrieve
```
./CRUD -messageType=6 -source="tag-update" -dest="mac:14cfe21421xx/parodus/tag/test1" -transId="bd4ad2d1-5c9c-486f-8e25-52c242b38" -contentType="application/json"

```


### Update
```
./CRUD -messageType=7 -source="tag-update" -dest="mac:14cfe21421xx/parodus/tag/test1" -transId="bd4ad2d1-5c9c-486f-8e25-52c242b38" -contentType="application/json" -payload='{ "expires" : 12345}'

```

### Delete
```
./CRUD -messageType=8 -source="tag-update" -dest="mac:14cfe21421xx/parodus/tag/test1" -transId="bd4ad2d1-5c9c-486f-8e25-52c242b38" -contentType="application/json"

```

