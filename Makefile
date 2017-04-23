VERSION = 0.1.0
NAMESPACE = cloudyparts
IMAGE = macos-socat

.PHONY: build tag push release

build:
	docker build --tag $(NAMESPACE)/$(IMAGE) --rm .

tag:
	docker tag $(NAMESPACE)/$(IMAGE) $(NAMESPACE)/$(IMAGE):$(TAG)

push:
	TAG=$(TAG) make --no-print-directory tag
	docker push $(NAMESPACE)/$(IMAGE):$(TAG)

release:
	VERSION=$(VERSION) make --no-print-directory build
	TAG=$(VERSION) make --no-print-directory push
	TAG=latest make --no-print-directory push
