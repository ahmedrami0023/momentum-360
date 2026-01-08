# Architecture & Implementation Plan - Momentum 360

> **Vision**: A "Universal" Health Operating System (Mobile + Web) that combines Movement, Fuel, and Recovery into a unified Momentum Score.

## 1. Core Technology Stack (The "Lovable Mobile" Stack)

| Function | Tool | Rationale |
| :--- | :--- | :--- |
| **Framework** | **Expo SDK 52+** | Universal React Native. Compiles to iOS/Android Apps + Web PWA. |
| **Navigation** | **Expo Router v4** | File-based routing (Next.js style). Ensures SEO and deep linking. |
| **Language** | **TypeScript** | Strict type safety for AI readiness. |
| **Styling** | **NativeWind v4** | Tailwind CSS for Mobile. Shared `className` syntax with Web. |
| **UI Components** | **React Native Reusables** | Shadcn UI port. Accessible, copy-paste ownership. |
| **Animations** | **Moti** | 60fps Native animations (Powered by Reanimated). |
| **Icons** | **Lucide React Native** | Consistent iconography across platforms. |

## 2. Data & State Management

| Function | Tool | Description |
| :--- | :--- | :--- |
| **Backend** | **Supabase** | PostgreSQL Database + Auth. Relational data model. |
| **Fetching** | **TanStack Query** | Async state, caching, optimistic updates. |
| **Offline** | **MMKV** | High-performance sync storage (30x faster than AsyncStorage). |
| **Validation** | **Zod** | Runtime schema validation (API + Forms). |
| **Forms** | **React Hook Form** | Manages input state and validation rules. |
| **Charts** | **Victory Native** | Universal charting for "Momentum Velocity" & Macros. |

## 3. Directory Structure

```text
/momentum-360
├── /app                   # Expo Router Pages
│   ├── /(tabs)            # Main App Layout
│   │   ├── index.tsx      # Dashboard (Velocity Gauge)
│   │   ├── nutrition.tsx  # Food Log
│   │   ├── workout.tsx    # Workout Log
│   │   └── habits.tsx     # Habit Tracker
│   ├── /auth              # Login/Register
│   ├── /modal             # Universal Modals
│   ├── _layout.tsx        # Root Provider Setup
│   └── global.css         # Tailwind Entry
├── /components
│   ├── /ui                # React Native Reusables (Button, Card, Text)
│   ├── /features          # Domain Components (FoodSearch, ExerciseCard)
├── /lib
│   ├── supabase.ts        # Supabase Client
│   ├── query-client.ts    # TanStack Query Setup
│   └── icons.ts           # Lucide Mappings
├── /db
│   ├── schema.ts          # Zod Schemas for DB Types
│   └── habits.json        # The "Momentum Collection" (Default Habits)
└── /hooks                 # Custom Logic (useVelocity, useScanner)
```

## 4. Implementation Phases

### Phase 1: The Foundation ("Hello World")
- [ ] Initialize Expo project with TypeScript + NativeWind v4 template.
- [ ] Setup Supabase Project (Tables: `profiles`, `foods,` `workouts`).
- [ ] Configure `React Native Reusables` (Shadcn theme).
- [ ] Implement Auth Flow (Email/Password) with Supabase Auth.

### Phase 2: Core Pillars (MVP)
- [ ] **Nutrition**: Connect OpenFoodFacts API. Build Search UI. Implement "Quick Add".
- [ ] **Workouts**: Build "Fly Mode" Logger (Sets/Reps). Integrate ExerciseDB JSON.
- [ ] **Habits**: Load `habits.json`. Build "Toggle" UI with optimistic updates.

### Phase 3: The Momentum Engine
- [ ] Build the **Velocity Algorithm** (Logic for +10% / -20%).
- [ ] Implement **Victory Charts** for the Dashboard Gauge.
- [ ] Polish Animations with **Moti** (Entry effects, success states).

### Phase 4: Verification & Polish
- [ ] **Web Check**: Verify Responsive Grid (`md:grid-cols-2`).
- [ ] **Mobile Check**: precise "safe area" handling.
- [ ] **Performance**: Verify MMKV loading speed.

## 5. Database Schema (Supabase)

### `profiles`
- `id` (uuid, PK)
- `momentum_score` (int, default 0)
- `settings` (jsonb)

### `logs_food`
- `id`, `user_id`
- `name` (text), `calories` (int), `macros` (jsonb)
- `created_at` (timestamptz)

### `logs_workout`
- `id`, `user_id`
- `name` (text, e.g. "Push Day")
- `volume_load` (int)

### `logs_habit`
- `id`, `user_id`
- `habit_id` (text, matches JSON)
- `completed` (boolean)

> **Next Step**: Await user approval to begin Phase 1 setup.
