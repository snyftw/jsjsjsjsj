#!/data/data/com.termux/files/usr/bin/bash
set -e
printf '\nHiLo Android project uploader\n'
printf 'GitHub username: '; read -r GHUSER
printf 'Repository name [xzx]: '; read -r REPO
REPO=${REPO:-xzx}
printf 'GitHub personal access token (Contents: Read and write): '; read -rs TOKEN; printf '\n'
SOURCE="$HOME/storage/downloads/HiLoLiveAnalyzer-GitHub-APK-Build.zip"
if [ ! -f "$SOURCE" ]; then echo "ZIP not found at $SOURCE. Put the downloaded ZIP in Downloads."; exit 1; fi
WORK="$HOME/hilo-upload-work"
mkdir -p "$WORK"
cd "$WORK"
rm -rf project repo
mkdir project
unzip -oq "$SOURCE" -d project
AUTH="AUTHORIZATION: basic $(printf '%s' "$GHUSER:$TOKEN" | base64 | tr -d '\n')"
GIT_TERMINAL_PROMPT=0 git -c credential.helper= -c http.extraHeader="$AUTH" clone "https://github.com/$GHUSER/$REPO.git" repo
unset TOKEN
cp -R project/HiLoLiveAnalyzer/. repo/
cd repo
git config user.name "$GHUSER"
git config user.email "$GHUSER@users.noreply.github.com"
git add -A
git commit -m 'Add complete HiLo Android source and APK build workflow' || true
git -c credential.helper= -c http.extraHeader="$AUTH" push origin HEAD
unset AUTH
printf '\nUploaded. Visit https://github.com/%s/%s/actions\n' "$GHUSER" "$REPO"
