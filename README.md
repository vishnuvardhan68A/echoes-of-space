# Echoes of Space

Machines may stop. Their stories never do.

An interactive space museum where forgotten NASA hardware (Moon, Mars, Deep Space) tells its own story, with a talking character, 12 languages, simulators, quiz and insights.

Built for the NASA Space Apps Challenge 2026 (forgotten space hardware). Single file, no build step.

## Run it on GitHub Pages (free)
1. Create a repository and upload `index.html` and `.nojekyll`.
2. Settings > Pages > Deploy from branch > `main` / root.
3. Open `https://<your-name>.github.io/<repo>/`.

## AI chat and translation (Gemini free tier)
- Inside Claude the page uses Claude. On GitHub Pages it calls the Gemini API instead.
- On first use it asks for a Gemini API key (get one free from Google AI Studio). It is stored only in that browser.
- A key typed into a public web page can be seen by that visitor. For a public site, use a restricted key or put a small proxy in front. This path has not been tested against the live API yet: test it first.
- Without a key, chat falls back to offline answers (birth, mission, today, parts) and the interface still works in 12 languages.

## Class leaderboard (free Supabase)
1. Create a free Supabase project. Open SQL Editor and run `supabase.sql`.
2. In `index.html`, find `window.EOS_SUPABASE={url:"",key:""}` and paste your Project URL and the **anon public** key (Project Settings > API).
3. In the app: Missions & Simulators > Class Leaderboard. Students enter a class code and a nickname, then submit their XP.
- It is trust-based: students could edit each other's scores. Use nicknames only. Fine for a classroom, not for prizes.
- Tested only against a mocked Supabase endpoint, not a live project.

## Replace the procedural models with real NASA 3D models
The machines are built from code. For realistic graphics:
1. Download NASA's public 3D models (NASA 3D Resources) as `.glb`. Check each model's usage terms.
2. Put them in `models/` and load them with Three.js `GLTFLoader` where `MD[id]()` builds a model (a function that returns a THREE.Group).
3. Keep the face anchors in `FC` (eye and mouth positions) so the talking animation still works.

## Facts and sources
Each relic has a Truth Check badge. Verified entries link to NASA sources; entries marked with a warning are not verified yet. Verify before presenting.

## Truth Check status
Verified against NASA pages: Apollo 12 Intrepid, Surveyor 3, Opportunity, Sojourner/Pathfinder, Voyager 1. Spirit is checked against news reports only. The other relics show a warning badge: verify them before presenting.

## Known limits
- Deep Space has only Voyager 1. Adding Voyager 2 / Pioneer 10 needs changes to the 3D scene that were not tested here.
- Voice needs a device voice for the chosen language (Android: Settings > Text-to-speech).
- 3D tested only in desktop and phone browsers by hand; no automated 3D tests.
- Planned vs real lifetime numbers are approximate.
