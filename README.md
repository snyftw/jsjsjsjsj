# HiLo Live Analyzer — Android source project

An educational, locally running Android screen analyzer. **No gambling-site integration, no betting automation, no claim of predicting random cards.**

## Build and install
1. Install Android Studio (with Android SDK 35 and JDK 17).
2. Open this folder as a project; let Gradle sync and download the bundled ML Kit Latin OCR model.
3. Connect an Android 8+ device (tested build target: Android 15; designed for Android 16), enable USB debugging, then press **Run**.
4. Or select **Build > Build APK(s)**, then install the generated `app/build/outputs/apk/debug/app-debug.apk` on your phone.
5. Open the app, optionally grant **Display over other apps**, tap **Start screen capture**, and accept Android's screen-capture consent. Choose entire screen for stable crop coordinates.
6. Open the game. Adjust **Left, Top, Width, Height** in the analyzer until the crop contains only the large card rank; tap **Apply crop**. A floating readout should appear if overlay permission was granted.
7. Enter the **total** Higher, Lower and current cashout multipliers shown by the game; tap Recalculate. Multipliers are manual because OCR of payouts is highly layout-dependent.
8. Use **Manual card override** if OCR mistakes a card. Share session report using the Android share sheet.

## Features
- Android MediaProjection foreground service, explicit screen consent, 1.1-second OCR sampling.
- ML Kit on-device Latin OCR for current rank, two consecutive detections for stabilization.
- Adjustable crop; floating overlay with card and probabilities.
- Higher/same and Lower/same probability model (13 uniformly distributed ranks; edge Ace and King handled as strict-only).
- One-step expected-value analysis against current cashout using user-entered *total* multipliers.
- Card history, elapsed session, independent-draw warning, manual override, share report.

## Limitations / safety
- **Unverified source build:** This project has not been compiled or device-tested in this environment. It is source code, not a signed APK.
- OCR of stylized cards, suit icons, landscape games and variable layouts can fail; manually verify every reading.
- Screen sharing may be restricted by Android or a particular app, or show black frames for protected content.
- The current version reads the card rank only; payout multipliers are manually entered. It does not automatically detect actual wins, losses, wager amount or profit, so the session dashboard tracks cards and time, not monetary P/L.
- The floating overlay may be captured in the screen feed; position it outside the crop.
- Previous card frequencies are not a valid predictor of independent draws. Assumes the rules described in the code; verify against the actual game.
- Do not share screenshots showing credentials, balances, account IDs or private information.
- No network or storage permission; images and OCR text are processed in memory and not uploaded.
- Do not use this as an automated recommendation for real-money wagering.

## Formula
For each option: `p(win) × displayed_next_total_multiplier / current_total_multiplier − 1`. Cashout has zero additional EV. This assumes a losing prediction forfeits the current cashout amount and a win pays the specified total multiplier.

## Suggested future improvements
- User-configurable separate card/payout OCR regions and calibration preview.
- Manual win/loss tracking, persistence, CSV export, explicit session limits and stop alerts.
- Layout-specific recognition validated against screenshots supplied with sensitive details removed.

## Android-only build (GitHub Actions)
See [ANDROID_ONLY_BUILD.md](ANDROID_ONLY_BUILD.md). This package includes `.github/workflows/build-apk.yml` to compile and upload a debug APK from GitHub Actions, without a computer.
