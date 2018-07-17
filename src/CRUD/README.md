## CRUD
Utility to perform parodus CRUD operations for a particular device mac.

To build with just go:
```
export GOPATH=`pwd`
cd src
glide install
cd src/CRUD
go build

```

## Authentication
export WEBPA_SAT=<SAT_Token>

### Example :

### Create
```
./CRUD -messageType=Create -payload='{ "expires" : 12345}' -mac=14cfe2142XXX -source="tag-update" -dest="parodus/tag/test1" -transId="bd4ad2d1-5c9c-486f-8e25-52c242b38" -contentType="application/json"

```

### Retrieve
```
./CRUD -messageType=Retrieve -mac=14cfe2142XXX -source="tag-update" -dest="parodus/tag/test1" -transId="bd4ad2d1-5c9c-486f-8e25-52c242b38" -contentType="application/json"

```


### Update
```
./CRUD -messageType=Update -payload='{ "expires" : 12345}' -mac=14cfe2142XXX -source="tag-update" -dest="parodus/tag/test1" -transId="bd4ad2d1-5c9c-486f-8e25-52c242b38" -contentType="application/json"

```

### Delete
```
./CRUD -messageType=Delete -mac=14cfe2142XXX -source="tag-update" -dest="parodus/tag/test1" -transId="bd4ad2d1-5c9c-486f-8e25-52c242b38" -contentType="application/json"

```

