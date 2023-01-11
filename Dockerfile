FROM nvidia/cuda:11.3.0-cudnn8-devel-ubuntu20.04

#Get pip, vim, wget, git
RUN apt update && \
    apt-get install -y python3-pip vim wget git zip && \
    rm -rf /var/lib/apt/list/*

#Install python packaged
RUN python3 -m pip install --upgrade pip pillow
RUN pip3 install torch torchvision torchaudio torchsummary --extra-index-url https://download.pytorch.org/whl/cu113
RUN pip3 install dominate==2.6.0 visdom==0.1.8.9 wandb==0.12.14 dominate tqdm opencv-python-headless scikit-image
RUN pip3 install --upgrade protobuf==3.20.0

RUN pip3 install albumentations==0.4.3 opencv-python==4.1.2.30 \
    pudb==2019.2 \
    imageio==2.9.0 \
    imageio-ffmpeg==0.4.2 \
    pytorch-lightning==1.4.2 \
    omegaconf==2.1.1 \
    test-tube>=0.7.5 \
    streamlit>=0.73.1 \
    einops==0.3.0 \
    torch-fidelity==0.3.0 \
    transformers==4.3.1 
RUN pip3 install -e git+https://github.com/CompVis/taming-transformers.git@master#egg=taming-transformers
RUN pip3 install -e git+https://github.com/openai/CLIP.git@main#egg=clip

WORKDIR /workspace
RUN git config --global --add safe.directory /workspace
