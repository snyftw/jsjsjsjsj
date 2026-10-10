# Build an APK with only an Android phone

This project includes `.github/workflows/build-apk.yml`. GitHub Actions compiles the Android app in the cloud. **No PC needed.**

1. In Chrome on Android, sign in at https://github.com and create a **private** repository named `HiLoLiveAnalyzer`. Do not initialize it with a README.
2. Upload the **contents** of the `HiLoLiveAnalyzer` folder to the repository root, including the hidden `.github/workflows/build-apk.yml` file. On a phone, the simplest reliable approach is a Git client with folder upload and hidden-file support, or GitHub's web upload in Desktop site mode. The repo root must contain `settings.gradle`, `build.gradle`, `app/`, and `.github/`.
3. If your upload tool does not show hidden folders, create `.github/workflows/build-apk.yml` using GitHub's **Add file → Create new file** and paste the workflow from the ZIP.
4. Open your repository → **Actions** → **Build Android APK** → **Run workflow** (or wait for the automatic build on push).
5. Open the completed run → **Artifacts** → `HiLoLiveAnalyzer-debug-APK`. Download and extract that artifact ZIP; inside is `app-debug.apk`.
6. Tap `app-debug.apk` on your phone. Allow installation from your browser/file manager if Android asks. Grant screen-capture consent only when you want the analyzer to run.

If the build fails, open the red build run, expand **Build debug APK**, and copy the error text. The source has not been compiled or tested here, so errors are possible. GitHub may require Actions to be enabled on new repositories. The APK is a debug build signed with an automatically generated debug key, not a Play Store release.

**Privacy:** Use a private repository. Do not upload Stake credentials, screenshots of your account, or secrets. The app analyzes the screen locally and does not place bets. Never treat its probability display as a prediction of a random card.
