{pkgs}:
with pkgs; [
  cudaPackages.cuda_cccl
  cudaPackages.cuda_cudart
  cudaPackages.cuda_cuobjdump
  cudaPackages.cuda_cupti
  cudaPackages.cuda_cuxxfilt
  cudaPackages.cuda_gdb
  cudaPackages.cuda_documentation
  cudaPackages.cuda_nsight
  cudaPackages.cuda_nvcc
  cudaPackages.cuda_nvdisasm
  cudaPackages.cuda_nvml_dev
  cudaPackages.cuda_nvprof
  cudaPackages.cuda_nvprune
  cudaPackages.cuda_nvrtc
  cudaPackages.cuda_nvtx
  cudaPackages.cuda_nvvp
  cudaPackages.cuda_opencl
  cudaPackages.cuda_profiler_api
  cudaPackages.cuda_sanitizer_api
  cudaPackages.cudatoolkit
  cudaPackages.cudnn
  cudaPackages.cutensor
  # cudaPackages.fabricmanager
  cudaPackages.libcublas
  cudaPackages.libcufft
  cudaPackages.libcufile
  cudaPackages.libcurand
  cudaPackages.libcusolver
  cudaPackages.libcusparse
  cudaPackages.libnpp
  cudaPackages.libnvidia_nscq
  cudaPackages.libnvjitlink
  cudaPackages.libnvjpeg
  # cudaPackages.nsight_systems
  # cudaPackages.nsight_compute
  cudaPackages.nccl
  cudaPackages.nvidia_fs
  # cudaPackages.tensorrt
  cudaPackages.saxpy
]
