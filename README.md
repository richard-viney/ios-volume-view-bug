# iOS MPVolumeView Bug

This small app shows a suspected bug with iOS' `MPVolumeView` where the system volume UI will show on press of volume up/down even when there is an `MPVolumeView` on the screen. The `MPVolumeView` should suppress the default system volume UI when the volume up/down buttons are pressed, but it doesn't.

Everything works correctly on load, but after presenting and dismissing an `AVPlayerViewController`, the default system volume UI starts appearing in addition to the `MPVolumeView`'s UI.

Repro steps:

- Boot app.
- Press the device's volume up/down buttons.
- Note that the `MPVolumeView` changes, as expected, and no other UI is shown.
- Press "Show AVPlayerViewController" to have an `AVPlayerViewController` instance shown on-screen for two seconds.
- Once back at the main screen, press the device's volume up/down buttons again.
- Note that the `MPVolumeView` changes, as expected, but the default system volume change UI is *also* shown. This shouldn't be happening.
