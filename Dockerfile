FROM continuumio/miniconda3

RUN conda install --yes \
    numpy==1.16.1 \
    matplotlib==3.0.3  \
    h5py==2.9.0 \
    pillow \
    seaborn

RUN conda install pytorch-cpu torchvision-cpu -c pytorch