# Momentum 360 - Product Roadmap

> **Vision**: To be the single "Operating System" for the user's health, combining Movement, Fuel, and Recovery into a unified Momentum Score.

---

## 🏁 Phase 1: The Foundation (Single Player MVP)
*Goal: Build a "Sticky" Single-User Experience. Data entry must be faster than any competitor.*

### 🛠️ Core Pillars
- **Unified Dashboard**: "Momentum Rings" (Activity, Fuel, Habits) + Velocity Gauge.
- **Nutrition**:
    - OpenFoodFacts API Search + Barcode Scanner.
    - Custom Food Creation.
    - Quick Add & "Copy Yesterday".
- **Workouts**:
    - Hybrid Logger (Fly Mode + Routines).
    - ExerciseDB Integration (GIFs).
    - Calendar Scheduler.
- **Habits**:
    - "Habit Store" (Curated Library).
    - Custom Habit Builder.
- **System**:
    - **Cloud First**: Cloud Backend (e.g. Supabase/Firebase) (ready for Sync).
    - **Offline Support**: Local caching for instant UI.

---

## 🚀 Phase 2: Community & Connectivity (Growth)
*Goal: Add "Multiplayer" features and automated data ingestion to reduce friction.*

- **Social Layer**:
    - **Friend Leaderboards**: Weekly Momentum competition.
    - **Squads**: Create groups (e.g., "Office Challenge").
    - **Feed**: "Ahmed just hit a 220lb Bench Press PR!" (Privacy controls enabled).
- **Device Sync (The Source of Truth)**:
    - **Apple Health / Google Fit Integration**: Auto-import Steps, Sleep, and Weight.
    - *Why Wait?*: Requires complex data merging logic (`source: manual` vs `device`).
- **Data Deep Dives**:
    - Weekly/Monthly Trends (Volume lifted, Calories avg).
    - "Momentum History" Heatmap.

---

## 🧠 Phase 3: The Ecosystem (AI & Intelligence)
*Goal: Shift from "Tracking" to "Coaching".*

- **AI Personal Trainer**:
    - "Generate a Push Day based on my past lifts."
    - "Adjust my calories: I'm plateauing."
- **Computer Vision**:
    - Form Check (Camera analyzes Squat depth).
    - Meal Scan (Photo to Macros).
- **Advanced Health**:
    - Lab Result Storage.
    - Supplement Cycle Tracking.

---

## 🛡️ Technical Future-Proofing (Decided for V1)
1.  **Strict Schemas**: All data is JSON-typed now to support AI reading later.
2.  **Auth Ready**: User IDs attached to every record (Supabase) to enable seamless Social later.
3.  **Source Fields**: `manual` vs `device` fields exist in DB from Day 1.
