BUCKET=arimiura-glue-sample-data
PQ_BUCKET=arimiura-glue-sample-data-pq

all:init

init:
	terraform -chdir=terraform init

bucket:
	aws s3api create-bucket --create-bucket-configuration LocationConstraint=ap-northeast-1 --acl private --bucket $(BUCKET) 

bucket-pq:
	aws s3api create-bucket --create-bucket-configuration LocationConstraint=ap-northeast-1 --acl private --bucket $(PQ_BUCKET) 

sync-01:
	aws s3 sync data s3://$(BUCKET) --exclude '2021/07/05/02/*'

sync-02:
	aws s3 sync data s3://$(BUCKET) --exclude '2021/07/05/01/*'

plan:
	terraform -chdir=terraform plan

clean-sample-data:
	aws s3 rm --recursive s3://$(BUCKET) 
	aws s3 rm --recursive s3://$(PQ_BUCKET) 