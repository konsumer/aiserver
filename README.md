This is my combo AI server, designed to make it easy to chat/get images on your own self-hosted service.

## setup

You will need an nvidia GPU on host. You can definitely do this stuff with other GPUs, but this is what I have, so it's setup like this. You will also need docker installed. On linux, setup nvidia driver, and do this:

```
# install host stuff

sudo apt-get update && sudo apt-get install -y docker-compose nvidia-container-toolkit
sudo systemctl restart docker

# test it
docker run --rm --gpus all nvidia/cuda:12.2.0-base-ubuntu22.04 nvidia-smi
```

You should see your video card, like this:

```
Wed Jan 17 07:26:12 2024
+---------------------------------------------------------------------------------------+
| NVIDIA-SMI 545.29.06              Driver Version: 545.29.06    CUDA Version: 12.3     |
|-----------------------------------------+----------------------+----------------------+
| GPU  Name                 Persistence-M | Bus-Id        Disp.A | Volatile Uncorr. ECC |
| Fan  Temp   Perf          Pwr:Usage/Cap |         Memory-Usage | GPU-Util  Compute M. |
|                                         |                      |               MIG M. |
|=========================================+======================+======================|
|   0  NVIDIA GeForce RTX 4060 Ti     Off | 00000000:01:00.0 Off |                  N/A |
|  0%   33C    P8               6W / 160W |   2434MiB /  8188MiB |      0%      Default |
|                                         |                      |                  N/A |
+-----------------------------------------+----------------------+----------------------+

+---------------------------------------------------------------------------------------+
| Processes:                                                                            |
|  GPU   GI   CI        PID   Type   Process name                            GPU Memory |
|        ID   ID                                                             Usage      |
|=======================================================================================|
+---------------------------------------------------------------------------------------+
```

## run it

```
docker-compose up
```