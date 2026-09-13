# Better AoD 2026

This is a fork of [Better AoD 2024](https://github.com/Jhaego/Better-AoD-2024) by Jhaego, which was itself a fork of the [original Better AoD](https://runeapps.org/forums/viewtopic.php?id=1324) Alt1 plugin by JamieS1211.

Compared to the original, this version *should* properly track number of kills and average kill time, and now correctly detects and reads the in-game chatbox again as well as when the player re-enters the instance for a new kill.

## Installation

To install this plugin copy & paste this link into your browser:
`alt1://addapp/https://cuddlyzebra.github.io/Better-AoD-2026/public/appconfig.json`

If you do not already have Alt1 Toolkit installed you can [download it from runeapps.org](https://runeapps.org/alt1).

Ensure the in-game Interface Scaling is set to 100%. Change text size to 12px or higher, to ensure minion order is captured correctly. 

## Update 13-09-2026: minion order fix, known pool detection issue

Spent today tracking down a couple of long-standing bugs. Sharing the findings here in case anyone wants to pick up where I left off, or just wants to understand why pool detection doesn't work reliably.

**Minion order fix:** If minions were dying in the wrong order in your kill log (especially when several die close together), this was caused by font size. Alt1's OCR needs enough pixel detail per character to read text reliably, and anything below 12px font doesn't give it enough to work with consistently — smaller fonts caused occasional misreads that threw off detected order. **Setting your in-game chat font size to 14px (or at least 12px) fixes this.** This isn't something the app can compensate for in code; it's a font legibility limit inherent to how Alt1 reads text.

**Pool detection is currently broken, and after a full day of investigation I don't believe it's fixable without changes to the Alt1 library itself:**

- The pool cast message's text colour appears to genuinely vary between attempts — screenshots taken of the exact same message at different times sampled meaningfully different RGB values, suggesting this specific line may use an animated/pulsing colour effect rather than a fixed one.
- Even after adding the *entire* official `defaultcolors` list from the alt1 library (dozens of colours, covering effectively every colour the game uses elsewhere) on top of a wide spread of custom shades, the line still reads back with **zero characters** every single time — not a wrong colour, just nothing captured at all.
- A related dialogue line that plays at the same moment ("Nex: Even I can not control the element of smoke...") also partially fails to read, even though its exact colour is confirmed present in the reader's colour list.
- The Alt1 chatbox reader library exposes no debug information beyond the final read result (no attempted-colour list, no failure reason), so this can't be diagnosed further without patching the compiled library itself — a fragile, invasive approach that would need to be redone on every dependency update.

Given Alt1 Toolkit is being phased out later this year in favour of the game's own official plugin API, I don't think it's worth sinking further time into this specific issue. Everything else — kill start/end, both smoke directions, bomb, player death, and minion order — works correctly. Pool's on-screen warning and countdown just won't reliably fire, and unfortunately that's a limitation I'm leaving as-is.

## Update 12-09-2026: forked and fixed

The 2024 version was left unsupported as of November 2025, with the author noting he could no longer confirm it still worked. As of September 2026 it had indeed stopped detecting chat correctly, so this fork exists to get it working again. No mechanics-tracking features were changed — this is purely a maintenance fork to restore functionality.

