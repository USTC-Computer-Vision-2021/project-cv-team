#!/bin/bash
cd ./lib/correlation_package
./make.sh
cd ../resample2d_package 
./make.sh
cd ../channelnorm_package 
./make.sh
cd ../../models/correlation_package
./make.sh
cd ../../../
export PATH=/usr/local/cuda-9.0/bin:/usr/local/cuda-9.0/bin:/opt/conda/envs/py35/bin:/usr/local/cuda-9.0/bin:/opt/conda/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
export CPATH=/usr/local/cuda-9.0/include:/usr/local/cuda-9.0/include:
export export LD_LIBRARY_PATH=/usr/local/cuda-9.0/lib64:/usr/local/cuda-9.0/lib64:/usr/local/cuda-9.0/lib64:/usr/local/nvidia/lib:/usr/local/nvidia/lib64
export CUDA_PATH=/usr/local/cuda/
export export CXXFLAGS=-std=c++11
export CFLAGS=-std=c99
export CXXFLAGS=-std=c++11
