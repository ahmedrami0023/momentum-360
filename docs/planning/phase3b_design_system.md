# Phase 3b: Design System Implementation (Liquid Glass)

## Goal
Implement the "Liquid Glass" Design System: Aurora Backgrounds (Skia), Glassmorphism (Blur), Inter font, and Material Icons.

## Proposed Changes

### 1. Dependencies [NEW]
- **Core**: `@expo-google-fonts/inter`, `@expo/vector-icons`.
- **Effects**: `expo-blur`, `@shopify/react-native-skia`.
- **Animation**: `react-native-reanimated` (Required for Skia animations).

### 2. Global Styling [MODIFY]
#### `tailwind.config.js`
- **Colors**: Add 5-Pillar Palette.
- **Font**: Set `Inter` default.
- **Radius**: `3xl`, `full`.

### 3. Components [NEW]
#### `components/ui/AuroraBackground.tsx`
- **Tech**: Skia `<Canvas>` with `<Circle>` blobs and `<Blur>` effect.
- **Logic**: Accepts `variant` (nutrition/workout/etc.) to change blob colors via `derivations`.

#### `components/ui/GlassCard.tsx`
- **Tech**: `BlurView` (Expo) + NativeWind.
- **Props**: `intensity`, `children`, `className`.
- **Style**: `overflow-hidden`, `rounded-3xl`, `border-white/10`.

#### `components/ui/PillButton.tsx`
- **Tech**: `Pressable` + Moti (Scale on press).
- **Style**: `rounded-full`, `h-12`.

### 4. Layout Integration [MODIFY]
#### `app/_layout.tsx`
- Wrap the entire app (or specific screens) in `<AuroraBackground>`.
- Use Context/Zustand to drive the Background Color based on the Route.

## Verification Plan
1.  **Visual Check**:
    - Verify Background moves smoothly (60fps).
    - Verify Glass Card blurs content behind it.
2.  **Performance**:
    - Check JS FPS frame drops on Android (Skia runs on UI thread, should be fine).
3.  **Theme Check**:
    - Toggle Light/Dark -> Verify Aurora colors adapt (Brighter for Light, Deeper for Dark).
