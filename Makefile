.PHONY: p1 p2 p3 bonus clean clean-cluster

p1:
	cd p1 && vagrant up

p2:
	cd p2 && vagrant up

p3:
	cd p3 && ./scripts/config.sh && sleep 10 && ./scripts/run.sh

bonus:
	cd bonus && ./scripts/config.sh && sleep 10 && ./scripts/run.sh

clean:	
	@echo -e "${YELLOW}Cleaning up Kubernetes resources...${ENDCOLOR}"	
	cd p1 && vagrant destroy -f
	cd p2 && vagrant destroy -f
	@echo -e "${YELLOW}=========================Done===========================${ENDCOLOR}"

clean-cluster:
	k3d cluster delete argocd
