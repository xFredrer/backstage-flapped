#!/bin/bash
set -e
# Uso:
#   bash makecontinuous.sh REPO_NAME BRANCH
#
# Por defecto:
#   - NO hace make clean
#   - NO ejecuta la build normal
#   - Solo compila HLE
#
# Para forzar una compilación limpia:
#   CLEAN_BUILD=1 bash makecontinuous.sh REPO_NAME BRANCH
HASH_STAMP="$(echo "H$(cat .git/refs/heads/$2)" | cut -c1-7 | tr '[:lower:]' '[:upper:]')"
JOBS="$(nproc)"
# ============================================================
# BUILD NORMAL
# ============================================================
# La build normal queda preparada aquí, pero está desactivada.
#
# Si alguna vez quieres volver a generar la versión normal,
# descomenta este bloque.
#
# make -j"$JOBS"
#
# printf "$HASH_STAMP" | dd \
#   of=build/jp/sm64.jp.z64 \
#   bs=1 seek=42 count=7 conv=notrunc
#
# tools/sm64tools/n64cksum build/jp/sm64.jp.z64
#
# cp build/jp/sm64.jp.z64 "$1-$2.z64"
# ============================================================
# OPCIONAL: CLEAN BUILD
# ============================================================
if [ "${CLEAN_BUILD:-0}" = "1" ]; then
    echo "Performing clean build..."
    make clean
fi
# ============================================================
# HLE BUILD
# ============================================================
echo "Building HLE..."
make -j"$JOBS" GRUCODE=f3d_20E
printf "$HASH_STAMP" | dd \
  of=build/jp/sm64.jp.z64 \
  bs=1 seek=42 count=7 conv=notrunc
tools/sm64tools/n64cksum build/jp/sm64.jp.z64
cp build/jp/sm64.jp.z64 "$1-$2-hle.z64"
echo "HLE build complete: $1-$2-hle.z64"
