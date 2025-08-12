DOCKER_BUILDKIT=1 docker build \
    --build-arg FA_REPO="https://github.com/ROCm/flash-attention.git" \
    --build-arg FA_BRANCH="e9e96d3d1ab66a6f815d77ef11398f637de3e4f4" \
    --build-arg PYTORCH_ROCM_ARCH="gfx1100" \
    -f docker/Dockerfile.rocm_base \
    -t ge-vllm-rocm-base-0-9-1 \
    .

DOCKER_BUILDKIT=1 docker build \
    --build-arg BASE_IMAGE="ge-vllm-rocm-base" \
    -f docker/Dockerfile.rocm \
    -t ge-vllm-rocm-0-9-1 \
    .

