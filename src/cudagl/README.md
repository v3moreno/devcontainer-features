
# CUDA + OpenGL (cudagl)

CUDA is a parallel computing platform and programming model invented by NVIDIA. CUDAGL, extends the CUDA feature by adding support for OpenGL through libglvnd.

## Example Usage

```json
"features": {
    "ghcr.io/v3moreno/devcontainer-features/cudagl:1": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| installCudnn | Additionally install CUDA Deep Neural Network (cuDNN) shared library | boolean | false |
| installCudnnDev | Additionally install CUDA Deep Neural Network (cuDNN) development libraries and headers | boolean | false |
| installNvtx | Additionally install NVIDIA Tools Extension (NVTX) | boolean | false |
| installToolkit | Additionally install NVIDIA CUDA Toolkit | boolean | false |
| cudaVersion | Version of CUDA to install | string | 12.2 |
| cudnnVersion | Version of cuDNN to install | string | 8.9.6.50 |



---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/v3moreno/devcontainer-features/blob/main/src/cudagl/devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
