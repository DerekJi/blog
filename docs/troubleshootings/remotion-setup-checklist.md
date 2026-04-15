# Quick Checklist: Setting Up Remotion MCP vs CLI Video Project

Use this checklist when starting a new Remotion project or when things aren't working.

## Pre-Flight Checks

- [ ] Node.js 18+ installed
- [ ] `npm install` completed successfully
- [ ] `ls node_modules/.bin/remotion` shows CLI is present
- [ ] Run `npm start` without errors

## Essential Files Configuration

### package.json
```json
{
  "dependencies": {
    "remotion": "^4.0.0",
    "@remotion/cli": "^4.0.0",
    "react": "^18.2.0",
    "react-dom": "^18.2.0"
  }
}
```

### src/index.tsx
```tsx
// ✅ Must have:
import { registerRoot } from 'remotion';

registerRoot(RemotionRoot);  // ← Critical!
```

### src/Composition.tsx
```tsx
// ✅ Must use inline styles, not Tailwind classes
style={{
  display: 'flex',
  justifyContent: 'center',
  alignItems: 'center',
}}

// ✅ Wrapper divs must have full dimensions
<div style={{
  width: '100%',
  height: '100%',
  position: 'absolute',
  top: 0,
  left: 0,
}}>

// ✅ Audio must be explicitly rendered
<Sequence from={startFrame}>
  <Audio src={audioPath} />
</Sequence>
```

### src/index.css
```css
/* ✅ Remove Tailwind - it doesn't work with Remotion */
/* @tailwind base;
@tailwind components;
@tailwind utilities; */

/* Use only vanilla CSS */
body {
  margin: 0;
  padding: 0;
}
```

## Directory Structure Required

```
videos/MCP_vs_CLI/
├── public/
│   └── audio/              ← Audio files go here
│       ├── intro.mp3
│       ├── outro.mp3
│       └── ...
├── src/
│   ├── index.tsx          ← registerRoot() call
│   ├── Composition.tsx    ← All inline styles, Audio components
│   ├── index.css          ← No @tailwind directives
│   ├── components/
│   ├── utils/
│   │   └── transitions.tsx ← width/height/position set
│   └── ...
├── package.json            ← Must include @remotion/cli
└── remotion.json
```

## Common Errors & Fixes

| Error | What to do |
|-------|-----------|
| `'remotion' is not recognized` | Run `npm install` (missing CLI package) |
| `Waiting for registerRoot()` | Add `registerRoot(RemotionRoot)` to index.tsx |
| `export SyntaxHighlighter not found` | Use `import SyntaxHighlighter from` (not `{ }`) |
| Content invisible/broken styling | Convert all `className` to `style` objects |
| Content pushed to left | Check wrapper div has `width: 100%; height: 100%; position: absolute` |
| No audio | Add audio files to `public/audio/` and wire up with `<Audio>` component |

## Audio Setup

### Generate audio files:
```bash
# Single file
edge-tts --file "script.txt" \
         --voice "en-GB-RyanNeural" \
         --write-media "public/audio/intro.mp3"
```

### Reference in Composition:
```tsx
const audioSegments = [
  {
    id: 'intro',
    audioPath: './public/audio/intro.mp3',  // ← Path format
    // ...
  }
];

// Render:
<Sequence from={startFrame}>
  <Audio src={segment.audioPath} />
</Sequence>
```

## Testing Workflow

1. **Start development**
   ```bash
   npm start
   ```

2. **Check preview at** `http://localhost:3000`

3. **If missing content**: 
   - Open DevTools (F12)
   - Check Console for errors
   - Verify Remotion zoom is set to "Fit" not "1x"

4. **If no audio**:
   - Check `public/audio/` directory exists with `.mp3` files
   - Verify `<Audio src={...} />` is in code
   - Browser may require click-to-play for audio

5. **Render final video**:
   ```bash
   npm run build-video
   ```

## Performance Tips

- Keep video at 1920x1080, 30 FPS for standard web
- Use `AbsoluteFill` for layout (not nested divs)
- Memoize expensive calculations with `useMemo`
- Avoid re-renders with proper key props on lists
