# Remotion MCP vs CLI Video Project - Troubleshooting Guide

This document details common issues encountered while setting up and running the Remotion video project, along with their solutions.

---

## Issue 1: 'remotion' is not recognized as an internal or external command

### Symptoms
```
'remotion' is not recognized as an internal or external command,
operable program or batch file.
```

### Root Cause
The `@remotion/cli` package is missing from `package.json`. The core `remotion` package alone does not provide CLI commands.

### Solution
Add the CLI package to dependencies:

```json
{
  "dependencies": {
    "remotion": "^4.0.0",
    "@remotion/cli": "^4.0.0"
  }
}
```

Then reinstall:
```bash
npm install
```

This creates the necessary symlinks in `node_modules/.bin/remotion`.

---

## Issue 2: Waiting for registerRoot() to get called

### Symptoms
Browser shows:
```
Waiting for registerRoot() to get called.
Learn more: remotion.dev/docs/register-root
```

### Root Cause
The Remotion root component was defined but never registered with `registerRoot()`.

### Solution
In `src/index.tsx`, add the import and call:

```tsx
import { Composition, registerRoot } from 'remotion';

export const RemotionRoot: React.FC = () => {
  return (
    <Composition
      id="Main"
      component={Main}
      durationInFrames={1800}
      fps={30}
      width={1920}
      height={1080}
      defaultProps={{}}
    />
  );
};

// Add this line:
registerRoot(RemotionRoot);
```

---

## Issue 3: react-syntax-highlighter export error

### Symptoms
```
WARNING: 'SyntaxHighlighter' (imported as 'SyntaxHighlighter') 
was not found in 'react-syntax-highlighter'
```

### Root Cause
The package exports a default export, not a named export called `SyntaxHighlighter`.

### Solution
Change the import from named to default:

```tsx
// ❌ Wrong
import { SyntaxHighlighter } from 'react-syntax-highlighter';

// ✅ Correct
import SyntaxHighlighter from 'react-syntax-highlighter';
```

---

## Issue 4: Styles/Layout not rendering (Tailwind CSS incompatibility)

### Symptoms
- Page renders but content is invisible or looks wrong
- Tailwind CSS classes are ignored in Remotion components

### Root Cause
Remotion uses canvas rendering, not DOM. Tailwind CSS's `@tailwind` directives and class-based styling don't work inside Remotion compositions.

### Solution
**Remove Tailwind directives** from CSS files and use **inline styles** exclusively:

```css
/* src/index.css - BEFORE */
@tailwind base;
@tailwind components;
@tailwind utilities;

/* src/index.css - AFTER */
/* Remove all @tailwind directives - they cause issues with Remotion */
```

Convert all styled components to use `style` objects:

```tsx
// ❌ Wrong (Remotion)
<div className="flex items-center justify-center bg-gradient-to-br from-slate-900 to-black">
  <h1 className="text-6xl font-bold text-white">Title</h1>
</div>

// ✅ Correct (Remotion)
<div style={{
  display: 'flex',
  alignItems: 'center',
  justifyContent: 'center',
  background: 'linear-gradient(to bottom right, #0f172a, #000000)',
}}>
  <h1 style={{
    fontSize: '96px',
    fontWeight: 'bold',
    color: '#ffffff',
  }}>Title</h1>
</div>
```

---

## Issue 5: Content appears cut off or positioned to the left

### Symptoms
- Content renders but is squeezed to the left 1/4 of the screen
- Despite using `justify-content: center`, elements still appear misaligned

### Root Cause
The wrapper `div` in `SmoothFadeTransition` component lacked proper sizing and positioning. Without explicit `width: 100%` and `height: 100%`, child `AbsoluteFill` components couldn't properly calculate their positioning.

### Solution
Update the `SmoothFadeTransition` component to include full dimensions and absolute positioning:

```tsx
// In src/utils/transitions.tsx
const SmoothFadeTransition: React.FC<{
  children: React.ReactNode;
  durationInFrames: number;
}> = ({ children, durationInFrames }) => {
  const frame = useCurrentFrame();
  const progress = frame / durationInFrames;

  // ... fade/scale calculations ...

  return (
    <div
      style={{
        opacity,
        transform: `scale(${scale})`,
        transformOrigin: 'center',
        willChange: 'opacity, transform',
        width: '100%',        // ← Add this
        height: '100%',       // ← Add this
        position: 'absolute', // ← Add this
        top: 0,               // ← Add this
        left: 0,              // ← Add this
      }}
    >
      {children}
    </div>
  );
};
```

Also ensure the root `AbsoluteFill` has explicit dimensions:

```tsx
return (
  <AbsoluteFill style={{
    backgroundColor: '#000000',
    width: '100%',
    height: '100%',
    margin: 0,
    padding: 0,
  }}>
    {/* content */}
  </AbsoluteFill>
);
```

---

## Issue 6: No audio in preview

### Symptoms
- Video renders correctly but no sound
- Wondering if this is normal behavior

### Root Cause
Audio files are not present in the `public/audio/` directory, OR the `<Audio>` component is not being used in the composition.

### Solution

**A. Add audio files:**

Create the directory and add audio files:
```bash
mkdir -p videos/MCP_vs_CLI/public/audio/
```

Generate audio using edge-tts (requires Python and edge-tts package):
```bash
edge-tts --file "videos/MCP_vs_CLI/MCP_vs_CLI_Video_Script_TTS.txt" \
         --voice "en-GB-RyanNeural" \
         --write-media "videos/MCP_vs_CLI/public/audio/intro.mp3"
```

**B. Wire up audio in Composition:**

```tsx
import { Audio, Sequence } from 'remotion';

export const Main: React.FC = () => {
  return (
    <AbsoluteFill>
      {/* Audio tracks */}
      {audioSegments.map((segment) => {
        const startFrame = framePositions[segment.id];
        return (
          <Sequence key={`audio-${segment.id}`} from={startFrame}>
            <Audio src={segment.audioPath} />
          </Sequence>
        );
      })}

      {/* Visual tracks */}
      {audioSegments.map((segment) => {
        // ... visual rendering ...
      })}
    </AbsoluteFill>
  );
};
```

---

## Summary of Key Takeaways

| Issue | Cause | Fix |
|-------|-------|-----|
| CLI not found | Missing `@remotion/cli` | Add to dependencies, run `npm install` |
| No renderRoot | Forgot to call `registerRoot()` | Call `registerRoot(Component)` |
| Import errors | Wrong import syntax | Use default import for default exports |
| Styling broken | Tailwind CSS classes ignored | Use inline `style` objects only |
| Content misaligned | Missing `width/height/position` on wrapper | Set `width: 100%; height: 100%; position: absolute` |
| No audio | Audio files missing or not wired up | Add files to `public/audio/` and use `<Audio>` component |

---

## References

- [Remotion Documentation](https://remotion.dev)
- [Register Root Guide](https://remotion.dev/docs/register-root)
- [Audio in Remotion](https://remotion.dev/docs/audio)
- [AbsoluteFill Component](https://remotion.dev/docs/absolute-fill)
