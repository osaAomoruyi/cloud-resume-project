.PHONY: build

build:
	sam build

deploy-infra:
	sam build && aws-vault exec my-user --no-session -- sam deploy

deploy-sites:   #syncing the local resume site directory with the s3 buckey
	aws-vault exec my-user --no-session -- aws s3 sync ./resume-site s3://mydevops-resume-website

invoke-get:
	sam build && aws-vault exec my-user --no-session -- sam local invoke GetFunction	

invoke-put:
	sam build && aws-vault exec my-user --no-session -- sam local invoke PutFunction	
