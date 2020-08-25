AWS_ACCESS_KEY_ID=accessKey AWS_SECRET_ACCESS_KEY=secretKey aws dynamodb  --endpoint-url http://localhost:8000 create-table \
    --table-name gifnoc \
    --attribute-definitions \
        AttributeName=bucket,AttributeType=S \
        AttributeName=id,AttributeType=S \
    --key-schema \
        AttributeName=bucket,KeyType=HASH \
        AttributeName=id,KeyType=RANGE \
    --provisioned-throughput \
        ReadCapacityUnits=10,WriteCapacityUnits=5 \
    --stream-specification StreamEnabled=true,StreamViewType=NEW_AND_OLD_IMAGES \
    --region us-east-2


AWS_ACCESS_KEY_ID=accessKey AWS_SECRET_ACCESS_KEY=secretKey aws dynamodb  --endpoint-url http://localhost:8000 --region us-east-2 update-time-to-live --table-name gifnoc --time-to-live-specification "Enabled=true, AttributeName=expires"
