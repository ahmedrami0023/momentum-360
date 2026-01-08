# Momentum 360 - MVP Feature Scope (V1 Only)

> **Goal**: A functional, cloud-synced, "Single Player" fitness OS.

## 1. Nutrition Pillar (Fuel)
- [ ] **Food Logger**: Search OpenFoodFacts (Packaged) and USDA (Raw).
- [ ] **Barcode Scanner**: Web-based scanner (`html5-qrcode`) hitting OFF API.
- [ ] **Custom Food Builder**:
    - Fields: Name, Brand, Calories, Protein, Carbs, Fat.
    - Save to "My Foods" (Local Cache).
- [ ] **Daily Dashboard**:
    - Progress Bar for Calories.
    - Donut Chart for Macros (Protein/Carb/Fat).
- [ ] **Quick Tools**:
    - "Quick Add" (Enter just numbers).
    - "Copy Yesterday" button.
- [ ] **Logic**: Total Carbs tracked (Fiber hidden detail).

## 2. Workout Pillar (Movement)
- [ ] **Hybrid Logger UI**:
    - "Fly Mode": Start empty, add exercises as you go.
    - "Routine Mode": Start from a pre-made template.
- [ ] **Exercise Database**:
    - Integration with ExerciseDB (Images/GIFs).
    - Fallback: Manual creations.
- [ ] **Set Tracking**:
    - Fields: Weight (kg/lbs), Reps, RPE (1-10).
    - Auto-Rest Timer.
- [ ] **Scheduler**:
    - Calendar View: Assign Routines to specific days.
    - Checkmark visual when completed.

## 3. Momentum Pillar (Engagement)
- [ ] **The "Velocity" Gauge**: 0-100% visualization.
- [ ] **Logic**:
    - Daily Hit (+10%).
    - Daily Miss (-20%) -> *Non-zero reset*.
- [ ] **Rings/Trifecta Visual**:
    - 🔵 Movement Ring (Workout completed).
    - 🟢 Fuel Ring (Calories within target).
    - 🟣 Recovery Ring (Habits checked).

## 4. Habits Pillar (Recovery)
- [ ] **The Habit Store**:
    - Curated JSON library (Mind, Body, Nutrition, Output).
- [ ] **Custom Builder**:
    - Emoji + Name + Frequency (Daily/Weekly).
- [ ] **Tracking**:
    - Simple Checkbox UI.
    - Streak count per habit.

## 5. System & Tech
- [ ] **Auth**: Login (Email/Password) to save data to Cloud.
- [ ] **Offline Mode**: App works 100% offline, syncs when online.
- [ ] **PWA**: Installable on Home Screen.
