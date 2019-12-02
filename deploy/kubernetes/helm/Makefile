
#TODO  change this to xmidt
REPO_USER := xmidt

# download xmidt-cloud dependencies to local folder ./charts
.PHONY: charts
dependencies: 
	@-rm -rf charts
	@-rm -rf .tmp
	@mkdir -p charts
	@mkdir -p .tmp
	@cd .tmp && git clone https://github.com/${REPO_USER}/tr1d1um
	@cd charts && helm package ../.tmp/tr1d1um/deploy/helm/tr1d1um
	@cd .tmp && git clone https://github.com/${REPO_USER}/scytale
	@cd charts && helm package ../.tmp/scytale/deploy/helm/scytale
	@cd .tmp && git clone https://github.com/${REPO_USER}/petasos
	@cd charts && helm package ../.tmp/petasos/deploy/helm/petasos
	@cd .tmp && git clone https://github.com/${REPO_USER}/talaria
	@cd charts && helm package ../.tmp/talaria/deploy/helm/talaria
	@cd .tmp && git clone https://github.com/${REPO_USER}/caduceus
	@cd charts && helm package ../.tmp/caduceus/deploy/helm/caduceus

# update helm chart (xmidt-cloud) with latest dependecies from xmidt-* services
update-latest: dependencies
	@-rm xmidt-cloud/charts/tr1d1um* 
	@cp charts/tr1d1um* xmidt-cloud/charts/
	@-rm xmidt-cloud/charts/scytale* 
	@cp charts/scytale* xmidt-cloud/charts/
	@-rm xmidt-cloud/charts/petasos*
	@cp charts/petasos* xmidt-cloud/charts/
	@-rm xmidt-cloud/charts/talaria*
	@cp charts/talaria* xmidt-cloud/charts/
	@-rm xmidt-cloud/charts/caduceus*
	@cp charts/caduceus* xmidt-cloud/charts/
