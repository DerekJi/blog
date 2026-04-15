---
mode: agent
description: Generate a Remotion React project for a video script
---
Using the video script at `content/{slug}/video/script.md`, generate a complete Remotion React project at `content/{slug}/video/remotion/`.

Requirements:
- Use Remotion v4 with TypeScript.
- Include `@remotion/cli` in dependencies.
- One composition per major scene section.
- Use `@remotion/media-utils` for audio sync if audio files exist in `../audio/`.
- Avoid Tailwind CSS (known incompatibility). Use inline styles or CSS modules.
- Export final composition as `MainVideo` in `src/index.tsx`.

File structure to generate:
```
remotion/
├── package.json
├── tsconfig.json
├── remotion.config.ts
└── src/
    ├── index.tsx          ← registerRoot + composition list
    ├── MainVideo.tsx      ← top-level composition
    ├── scenes/            ← one file per scene
    └── components/        ← shared components
```

After generating, provide the commands to preview and render:
```bash
cd content/{slug}/video/remotion
npm install
npx remotion preview   # preview in browser
npx remotion render MainVideo out/video.mp4  # render
```
