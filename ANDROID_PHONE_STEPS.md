# Build APK using only an Android phone

1. Download the ZIP to **Downloads**. Install Termux from F-Droid (avoid outdated Play Store versions).
2. Open Termux, enter `pkg update && pkg install git unzip -y`.
3. Enter `termux-setup-storage` and grant permission.
4. Enter `bash ~/storage/downloads/UPLOAD_FROM_ANDROID.sh` **after extracting just this script to Downloads**, or use the commands below to extract it from the ZIP:

   ```sh
   cd ~/storage/downloads
   unzip -o HiLoLiveAnalyzer-GitHub-APK-Build.zip HiLoLiveAnalyzer/UPLOAD_FROM_ANDROID.sh
   bash HiLoLiveAnalyzer/UPLOAD_FROM_ANDROID.sh
   ```

5. Enter GitHub username, repository (`xzx`), and a GitHub fine-grained personal access token with **Contents: Read and write** for this repository. GitHub passwords do not work for Git push. Do not send your token to anyone.
6. If Git prompts again on push, use GitHub username and token as password. You can alternatively use GitHub CLI authentication.
7. Open the repo **Actions** tab. The `Build Android APK` workflow should run automatically on `main` or `master`. If not, use `Run workflow`.
8. After successful build, open the run, download `HiLoLiveAnalyzer-debug-APK`, extract and install `app-debug.apk`.

The project has not been compiled or device-tested. If it fails, open the failed job and capture the error log. This app performs on-device OCR and analysis; it does not place bets.
