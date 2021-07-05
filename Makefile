BUCKET=arimiura-glue-sample-data

bucket:
	aws s3api create-bucket --create-bucket-configuration LocationConstraint=ap-northeast-1 --acl private --bucket $(BUCKET) 

sync-01:
	aws s3 sync data s3://$(BUCKET) --exclude '2021/07/05/02/*'

#data with new col
sync-02:
	aws s3 sync data s3://$(BUCKET) --exclude '2021/07/05/01/*'

clean:
	aws s3 rm --recursive s3://$(BUCKET) 