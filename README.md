# Update 12-09-2026: forked and fixed

This is a fork of [Better AoD 2024](https://github.com/Jhaego/Better-AoD-2024) by Jhaego, which was itself a fork of the [original Better AoD](https://runeapps.org/forums/viewtopic.php?id=1324) Alt1 plugin by JamieS1211.

The 2024 version was left unsupported as of November 2025, with the author noting he could no longer confirm it still worked. As of September 2026 it had indeed stopped detecting chat correctly, so this fork exists to get it working again. No mechanics-tracking features were changed — this is purely a maintenance fork to restore functionality.

# Better AoD 2026

Compared to the original, this version *should* properly track number of kills and average kill time, and now correctly detects and reads the in-game chatbox again as well as when the player re-enters the instance for a new kill.

## Installation

To install this plugin copy & paste this link into your browser:
`alt1://addapp/https://cuddlyzebra.github.io/Better-AoD-2026/public/appconfig.json`

If you do not already have Alt1 Toolkit installed you can [download it from runeapps.org](https://runeapps.org/alt1).

Ensure the in-game Interface Scaling is set to 100%. Disable Interface Transparency - set to opaque, no transparency. Close all but 1 chat window if multiple are open. You may need to apply [the DPI fix](https://runeapps.org/forums/viewtopic.php?id=1614) for High Resolution (4k) Monitors OR if Windows Scaling is not set to 100% (eg. most Laptops).

## Troubleshooting

*Having issues detecting things?*

This plugin requires you to have gamechat in either the "on" or "filtered" settings and the chatbox to be scrolled completely to the bottom. The plugin also reads each line separately so issues may occur if your chat box is so small that certain messages that are scanned for split on multiple lines, i.e. *try making your chatbox wider*. Please ensure your *font size is 12 or larger* (14 is best) as font 10 has significant detection issues.

*Double reading things?*

This can happen for several reasons around messages in the chatbox being obscured. This can be caused by: scrolling up, changing chat window, loading screens (when you teleport to Nex bank) or the floating monster HP bar covering the chat box.
