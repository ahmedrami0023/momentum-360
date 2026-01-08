# Momentum 360 - Design System (v3.1)

> **Design Philosophy**: "Liquid, Organic, Kinetic". A living interface where the background breathes (Aurora) and content floats on premium glass layers.

---

## 1. Aesthetic Direction: "Liquid Glass"
*   **Vibe**: High-End, Alive, "Pro" Health.
*   **The Stack**:
    *   **Background**: Deep fluid gradients (Aurora) powered by **Skia**.
    *   **Surface**: Frosted Glass (`BlurView`) for cards and navigation.
*   **Modes**:
    *   **Light**: White/Silver Aurora + Frosted Glass.
    *   **Dark**: Deep Slate/Midnight Aurora + Smoked Glass.

---

## 2. Typography
**Font Family**: **Inter** (Google Font)
*   **Scale**:
    *   Headings: `Inter_700Bold`
    *   Body: `Inter_400Regular`
    *   Numbers: `Inter_600SemiBold` + `tabular-nums`

---

## 3. Color Palette: "The 5 Pillars"
Used in the **Aurora Gradients** and **Active States**.

### 🥗 Nutrition (Green)
*   **Base**: `#00BF20` (Vibrant Leaf)

### 🔥 Workout (Crimson)
*   **Base**: `#990033` (Deep Cardinal)
*   *Dark Mode*: `#E11D48`

### 🥇 Momentum (Gold)
*   **Base**: `#BF8000` (Trophy Gold)

### 📉 Progress (Azure)
*   **Base**: `#0080FF` (Science Blue)

### 👤 Profile (Indigo)
*   **Base**: `#3333FF` (Electric Indigo)

### The Shell (Neutrals)
*   **Light**: Bg `#FFFFFF`, Text `#0F172A`
*   **Dark**: Bg `#020617`, Text `#F8FAFC`

---

## 4. Visual Effects (The "Liquid" Magic)

### Aurora Background
A subtle, slow-moving mesh gradient behind the app.
*   **Technique**: `@shopify/react-native-skia` Canvas.
*   **Logic**: Colors shift based on the Active Tab.
*   **Web Implementation**: Requires `public/canvaskit.wasm` and lazy-loading via `WithSkiaWeb`.

### Glass Cards
*   **Technique**: `expo-blur`.
*   **Intensity**: `tint="systemMaterial"` (Adapts to Light/Dark).
*   **Border**: `border-white/10` (Subtle 1px rim).

---

## 5. Iconography & Shapes
*   **Set**: **Material Symbols (Rounded & Filled)**.
*   **Shapes**:
    *   **Buttons**: Pill (`rounded-full`).
    *   **Cards**: Organic (`rounded-3xl` / 24px).

---

## 6. Implementation Strategy
1.  **Dependencies**: Install `Skia`, `Reanimated`, `Expo Blur`, `Inter`.
2.  **Components**:
    *   `AuroraBackground`: Skia Canvas with moving blobs.
    *   `GlassCard`: `BlurView` wrapper with border and padding.
    *   `PillButton`: Standard Pressable with Contextual Color.
