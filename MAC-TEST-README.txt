KELIMECE — TRY ON YOUR MAC
==========================

Mac website test (Safari / Chrome). This is a WEBSITE, not a Mac desktop app.

QUICKEST
1. Unzip the Kelimece download.
2. Open the kelimece folder.
3. Double-click Start-Kelimece.command.
4. Safari opens automatically on localhost. If macOS blocks the launcher,
   open Terminal, type: bash (with a space afterward), drag Start-Kelimece.command
   into Terminal and press Return.
5. Keep the Terminal window open while playing. Press Control+C to stop.

This uses Python 3 if present, on the fixed URL http://127.0.0.1:8765/
(the same URL each time helps Safari retain your daily progress).
It requires no npm, dependencies, or internet.
If Python 3 is unavailable, the launcher opens index.html directly. Basic
play works in that mode, but some Safari versions restrict local-file storage
or clipboard APIs. Installing Python 3 provides the full localhost preview.

You can always open index.html directly in Safari or Chrome for a quick look.

TEST CHECKLIST
[ ] The first-visit 'Nasıl Oynanır' popup opens.
[ ] The game shows a 5 x 6 board and the Turkish Q keyboard.
[ ] Pressing i on the Mac keyboard enters İ, and ı enters I.
[ ] Make one valid guess, refresh the page and check the guess is preserved.
[ ] Tap 'Ses İzi' and confirm the number of vowels is shown once; your six guesses are unchanged.
[ ] 'İz Şeridi' stamps update after a valid guess.
[ ] Settings: enable dark mode and high-contrast mode.
[ ] Once today's word is solved (or six guesses used), no extra games are allowed.
[ ] The next-word countdown appears. The next puzzle begins at midnight Istanbul time.
[ ] Stats show the seven-day trail and today's result stamp.
[ ] 'Paylaş' works after finishing and includes the result stamp and whether Ses İzi was used.

Notes:
- There is exactly ONE daily word for all players (not one for each refresh).
- Game progress is stored in this browser on this Mac, not shared with other devices.
- All words are in words.js; don't change it after publishing without a schedule migration.
- For a permanent public URL, see README.md (Netlify / GitHub Pages / Cloudflare Pages).
