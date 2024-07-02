VOLUMES?=-v $(shell pwd):$(shell pwd)
WORKDIR?=-w $(shell pwd)
NAME?=pytorch3d
UID?=-u $(shell id -u ${USER}):$(shell id -g ${USER})
NET_IPC?=--net=host --ipc=host
COMMAND?=bash
JUPYTER?=jupyter notebook --NotebookApp.token='' --port=8765

.PHONY: build
build:
	docker build -t $(NAME) .


.PHONY: jupyter
jupyter:
	nvidia-docker run -it --rm \
				$(WORKDIR) \
				$(NET_IPC) \
				$(UID) \
				$(VOLUMES) \
				$(NAME) \
				$(JUPYTER)

.PHONY: run
run:
	nvidia-docker run -it --rm \
				$(WORKDIR) \
				$(NET_IPC) \
				$(UID) \
				$(VOLUMES) \
				$(NAME) \
				$(COMMAND)
