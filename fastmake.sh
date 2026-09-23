#!/bin/bash
set -e
export GTA_VC_RE_DIR="/home/shiraishi/Projects/hez-gta-re3/gtavc"
# go to repo root (fails if not inside a git repo)
REPO_ROOT="$(git rev-parse --show-toplevel)"
cd "$REPO_ROOT"

#git submodule sync --recursive
#git submodule update --init --remote --force --recursive

rm -rf build bin

./premake5Linux --with-librw --use-wayland --buggy gmake2
./printHash.sh src/extras/GitSHA1.cpp

make -C build config=release_linux-amd64-librw_gl3_glfw-oal -j"$(nproc)"
