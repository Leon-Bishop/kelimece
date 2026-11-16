# Kelimece — Günlük Türkçe Kelime Oyunu

A distinctive daily Turkish word ritual built with **plain HTML, CSS, and JavaScript**. Its own warm paper-and-ink aesthetic, floral mark, rounded letter tiles, and optional vowel clue set it apart while keeping the beloved one-word-per-day puzzle format. No dependencies, build tools, database, or backend required.

## Files

- `index.html` — complete responsive game, styling, keyboard, animations, daily puzzle selection, save/resume, statistics, modes, and sharing.
- `words.js` — editable answer and valid-guess dictionaries, with a fixed shuffle seed.

The game currently has **764 scheduled daily answers** and **5,421 accepted five-letter guesses**. The expanded guesses were merged from the user-provided `words(1).js` on 2026-11-16, including its candidate answers as guesses only. The existing daily answer list and shuffle seed are unchanged, preserving the daily puzzle sequence and saved games. The uploaded source contained 5,581 guess entries and 2,133 potential answer entries; after Turkish NFC normalization, deduplication, and the game's 29-letter alphabet checks, the merged list contains 5,421 distinct playable guesses. This is **not yet 50,000**. It is an expanded but still unreviewed dictionary. Before a major public launch, have native speakers and/or a Turkish lexicographer review the entire answer list, add at least 1,500 common words, and improve the valid-guess coverage. Check licensing if you import data from a third-party source.

## Test on a Mac (Safari)

Unzip the project, open the `kelimece` folder, and **double-click `Start-Kelimece.command`**. It starts a temporary `localhost` server on the fixed address `http://127.0.0.1:8765/` using Python 3 and launches Safari automatically. Using a fixed port lets your Mac preserve the daily game between launches. Keep the Terminal window open while testing; press **Control+C** to stop. No npm or other project dependencies are required.

If macOS blocks a downloaded `.command` file, open Terminal, type `bash ` (including the space), drag `Start-Kelimece.command` onto the Terminal window, then press **Return**. If Python 3 isn't installed, the launcher falls back to opening `index.html` directly; some Safari versions restrict browser storage and sharing from local files. For browser-by-browser checks and a checklist, see `MAC-TEST-README.txt`.

## Run locally

For an immediate preview, open `index.html` in a browser. For more consistent browser APIs and local storage, serve the folder locally:

```bash
cd kelimece
python3 -m http.server 8000
```

Then open `http://localhost:8000`. Node.js alternatives such as `npx serve .` also work. The production site should use HTTPS for best clipboard and Web Share support.

## How today's answer is picked

The app reads the **calendar date in `Europe/Istanbul`**, not the player's local timezone. It calculates the number of whole calendar days since **2026-01-01**. The answer list is shuffled deterministically with a fixed `SHUFFLE_SEED = 20260101`, and the game's index is:

```js
const puzzleNumber = daysSince20260101 + 1;
const answerIndex = ((daysSince20260101 % shuffledAnswers.length)
                    + shuffledAnswers.length) % shuffledAnswers.length;
const answer = shuffledAnswers[answerIndex];
```

The game rolls over at midnight Istanbul time, even while the tab is open, and shows a live countdown when the day's puzzle is complete. The countdown uses Istanbul's actual day transition rather than assuming the player's timezone is UTC+3.

**Important:** Every player's computer clock must be reasonably accurate. A truly tamper-proof global game, cross-device synchronization, a leaderboard, or push reminders would require server-side services.

## Edit or expand the words

1. Open `words.js`.
2. Add easy, recognizable, **exactly five-letter** Turkish words to `ANSWER_TEXT`. No proper names, vulgar words, unreasonably obscure words, or awkward inflected forms. Be especially careful with **I/İ and ı/i**.
3. Add extra legitimate guesses to `EXTRA_GUESSES_TEXT`. This list can include less familiar words; they won't be selected as daily answers. Answers are automatically included in the `VALID_GUESSES` export.
4. Separate entries with whitespace. The loader applies Unicode NFC normalization, Turkish locale uppercasing, deduplication, and 29-letter alphabet / five-code-point filtering. The imported guess list lives in `IMPORTED_GUESSES_TEXT` and is accepted for guesses only. Entries using circumflex letters (â/î/û), unsupported by the agreed 29-letter alphabet, are excluded rather than rewritten.
5. Keep `SHUFFLE_SEED` fixed. **Do not reorder or add answers mid-day after launch without a planned migration:** changing the list changes the whole deterministic sequence, including today's answer. To expand later without breaking an existing schedule, consider a versioned answer schedule keyed by puzzle number, with published historic answers locked in.

Your definitive launch dictionary should ideally contain 1,500+ hand-vetted answer words and a substantially larger, licensed and reviewed valid-guess dictionary. Turkish lexicographic sources may use circumflex marks (â, î, û); the current game intentionally accepts only the specified **29-letter Turkish alphabet**.

## Publish for free

### Option A — Netlify Drop (easiest)

1. Unzip this project.
2. Visit <https://app.netlify.com/drop>.
3. Drag the **`kelimece` folder** into the upload area, making sure `index.html` is at the site's root.
4. Open the provided HTTPS URL.

Official guide: <https://docs.netlify.com/deploy/create-deploys/>

### Option B — GitHub Pages

1. Create a GitHub repository, e.g. `kelimece`.
2. Upload `index.html`, `words.js`, and optionally this README **to the root**.
3. Go to **Settings → Pages → Build and deployment → Deploy from a branch**.
4. Choose your main branch and `/ (root)`, then save.
5. Use the URL `https://YOUR-USERNAME.github.io/kelimece/`. The Share action automatically uses the correct site path.

Official guide: <https://docs.github.com/en/pages/getting-started-with-github-pages/configuring-a-publishing-source-for-your-github-pages-site>

### Option C — Cloudflare Pages

1. Go to **Workers & Pages → Create application → Pages**.
2. Choose **Direct Upload** to drag the folder/ZIP (or Git integration for automatic deployments).
3. Deploy the directory containing `index.html` and `words.js` at its top level.
4. Use the provided HTTPS `pages.dev` address.

Official guide: <https://developers.cloudflare.com/pages/framework-guides/deploy-anything/>

**No build command** is needed for any of these options.

## Features included

- Six guesses of five Unicode-NFC Turkish letters; two-pass duplicate-letter scoring.
- Exact Turkish Q on-screen keyboard; physical keyboard support, including dotted/dotless I.
- Flip, typing pop, shake and win bounce animations, with reduced-motion support.
- Answer chosen once per Istanbul calendar day; automatic midnight rollover.
- Day-specific `localStorage` save/resume and completed-game lock.
- Statistics, consecutive-win streaks, maximum streak, daily guess distribution highlight.
- Shareable spoiler-free emoji grid with browser sharing and clipboard fallback.
- First-visit instructions; hard mode; dark mode; orange/blue high-contrast mode.
- **Ses İzi**: an optional **once-a-day** clue showing the *number* of vowel letters in today's answer. It does not reveal the vowels or spend a guess; the daily game remains one word and six guesses. Hint use is saved and disclosed in the share text.
- **İz Şeridi**: six small daily-progress stamps that track attempts, including stronger/solved guesses.
- **Günün Mührü**: a Turkish-language accomplishment stamp on completion, included in the spoiler-free share text.
- **Son 7 Günün İzi**: seven-day result strip in statistics showing past plays without revealing answers. History is retained locally for 60 days from the latest completed game (older data isn't reconstructed).
- Original editorial visual design with its own palette and typography, not a direct Wordle UI reproduction.
- Semantic controls, keyboard focus styles, screen reader announcements and labelled tiles.

## Things to do to grow daily users

1. **Improve the dictionary and puzzle fairness** before promoting the game. Add a correction/report form, community feedback, and an editorial review process.
2. **Set up a custom domain**, canonical URL, sitemap, robots.txt, and Google Search Console. Publish a compelling Turkish landing/FAQ page that introduces the daily challenge.
3. **Design a 1200×630 Open Graph image** and add `og:image` and `twitter:card` metadata so shared links look great on messaging and social networks.
4. **Make it installable as a PWA** with a web app manifest, properly sized icons, and a service worker that caches `index.html` and `words.js` for offline use. Plan cache invalidation carefully at day rollover.
5. **Add optional daily reminders**. For reliable reminders after closing the tab, browser push needs opt-in permission plus a push sending service/server or managed provider. Don't request notification permission on the first visit.
6. **Measure return behavior** with privacy-friendly analytics (DAU, D1/D7 retention, share taps, finish rate, difficulty by answer) and don't collect raw guesses unless users consent.
7. **Drive community sharing** with a launch hashtag, shareable results, creator/community partnerships, and a one-tap 'play tomorrow' reminder option.
8. **Improve accessibility and QA** using native Turkish-speaker testing, screen-reader audits, iOS Safari/Android Chrome testing, and long-running schedule/release tests.

## Browser storage and privacy

The project stores game state and statistics **locally in the current browser** and does not send personal information anywhere. Clearing browser storage will reset progress. Data does not sync between devices. The full answer dictionary is publicly visible in the browser as expected for a static client-only game.