#!/usr/bin/env bash
# Copyright 2020 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -eu

source "$(dirname "$0")/../../lib/init.sh"
source module /ci/kokoro/lib/gcloud.sh
source module /ci/kokoro/lib/cache.sh
source module /ci/lib/io.sh

if [[ $# != 3 ]]; then
  echo "Usage: $(basename "$0") <cache-folder> <cache-name> <home-directory>"
  exit 1
fi

readonly CACHE_FOLDER="$1"
readonly CACHE_NAME="$2"
readonly HOME_DIR="$3"

if ! cache_upload_enabled; then
  exit 0
fi

maybe_dirs=(
  # This is where ccache stores its files, if present we want to back it up
  "${HOME_DIR}/.ccache"

  # Default location for vcpkg's binary cache.
  # https://vcpkg.readthedocs.io/en/latest/specifications/binarycaching/
  "${HOME_DIR}/.cache/vcpkg"

  # This dir may contain arbitrary things that our scripts want to cache.
  "${HOME_DIR}/.cache/google-cloud-cpp"
)

dirs=()
for dir in "${maybe_dirs[@]}"; do
  if [[ -d "${dir}" ]]; then dirs+=("${dir}"); fi
done

echo "================================================================"
io::log "Preparing cache tarball for ${CACHE_NAME}"
tar -zcf "${HOME_DIR}/${CACHE_NAME}.tar.gz" "${dirs[@]}"

cache_upload_tarball "${HOME_DIR}" "${CACHE_NAME}.tar.gz" "${CACHE_FOLDER}"

exit 0
