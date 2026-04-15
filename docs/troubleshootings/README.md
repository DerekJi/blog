# Remotion Troubleshooting Documentation

This directory contains comprehensive guides for troubleshooting the Remotion MCP vs CLI video project.

## Documents

### [remotion-setup-issues.md](remotion-setup-issues.md)
**Detailed problem breakdown with solutions**

Covers these issues:
1. 'remotion' command not recognized
2. registerRoot() not called
3. react-syntax-highlighter export error
4. Tailwind CSS incompatibility
5. Content positioning issues (shifted left)
6. Missing audio in preview

Each issue includes:
- Symptoms description
- Root cause analysis
- Step-by-step solution
- Code examples

**Read this when:** You're debugging a specific issue or learning why something failed.

---

### [remote-setup-checklist.md](remote-setup-checklist.md)
**Quick reference and verification guide**

Contains:
- Pre-flight checklist
- Essential configuration templates
- Directory structure requirements
- Common errors quick-fix table
- Audio setup short guide
- Testing workflow

**Read this when:** Starting a new project, verifying configuration, or quickly looking up a solution.

---

## TL;DR - Most Common Issues

| Problem | Solution |
|---------|----------|
| CLI not found | `npm install` (add @remotion/cli) |
| Page blank | Call `registerRoot()` in src/index.tsx |
| Styles broken | Replace `className` with `style={{}}` inline objects |
| Content left-aligned | Check wrapper divs have `width/height: 100%; position: absolute` |
| No sound | Add audio files to `public/audio/`, wire up with `<Audio>` component |

---

## Questions?

Check the [Remotion official docs](https://remotion.dev/docs) for:
- Advanced features
- CLI options
- Performance optimization
- Deployment guides
