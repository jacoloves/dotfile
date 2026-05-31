#!/bin/bash

set -euo pipefail

DOWNLOAD_DIR="$HOME/Downloads"
BACKUP_DIR="$HOME/backup"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
TARBALL_NAME="downloads_backup_${TIMESTAMP}.tar.gz"
TARBALL_PATH="${BACKUP_DIR}/${TARBALL_NAME}"

log() {
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1"
}

error_exit() {
  log "error: $1"
  exit 1
}

log "Downloadクリーンアップスクリプトを開始します"

if [ ! -d "$DOWNLOAD_DIR" ]; then
  error_exit "Downloadディレクトリが見つかりません: $DOWNLOAD_DIR"
fi

if [ -z "$(ls -A "$DOWNLOAD_DIR" 2>/dev/null)" ]; then
  log "Downloadディレクトリは既に空です: $DOWNLOAD_DIR"
  exit 0
fi

log "backupディレクトリを確認/作成中: $BACKUP_DIR"
mkdir -p "$BACKUP_DIR" || error_exit "backupディレクトリの作成に失敗しました"

log "Downloadディレクトリを圧縮中: $DOWNLOAD_DIR -> $TARBALL_PATH"
if ! tar -czf "$TARBALL_PATH" -C "$HOME" "Downloads" 2>/dev/null; then
  error_exit "tarball作成に失敗しました"
fi

if [ ! -f "$TARBALL_PATH" ]; then
  error_exit "tarballが正常に作成されませんでした: $TARBALL_PATH"
fi

TARBALL_SIZE=$(du -h "$TARBALL_PATH" | cut -f1)
log "tarball作成完了: $TARBALL_NAME (size: $TARBALL_SIZE)"

log "Downloadディレクトリをクリーンアップ中"
if ! rm -rf "${DOWNLOAD_DIR:?}"/* "${DOWNLOAD_DIR:?}"/.[^.]* 2>/dev/null; then
  log "警告: 一部のファイルの削除に失敗した可能性があります"
fi

REMAINING_FILES=$(ls -la "$DOWNLOAD_DIR" 2>/dev/null | wc -l)
if [ "$REMAINING_FILES" -le 2 ]; then
  log "Downloadディレクトリのクリーンアップが完了しました"
else
  log "警告: Downloadディレクトリにファイルが残っている可能性があります"
fi

log "クリーンアップスクリプトが正常に完了しました"
log "バックアップ場所: $TARBALL_PATH"
