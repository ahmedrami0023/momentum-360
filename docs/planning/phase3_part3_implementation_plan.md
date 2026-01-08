# Phase 3 Part 3: Database & Auth Implementation Plan

## Goal
Implement the Database Layer (Schema & Types) and Authentication (Logic & UI) for Momentum 360, enabling users to Sign Up and Log In.

## Status
**[COMPLETED]** - All core objectives achieved.

## User Review Required
> [!IMPORTANT]
> This plan involves creating new tables in your Supabase project (`gpxmnybtipzivthcooqp`). Please ensure you have no conflicting tables or important data in this project.

## Proposed Changes

### 1. Database Schema (Supabase) [DONE]
We will apply the following schema using `supabase-mcp`:

#### `profiles` Table
- `id`: UUID (Primary Key, references `auth.users` with `on delete cascade`)
- `momentum_score`: Integer (default: 0)
- `settings`: JSONB (default: `{}`)
- **RLS**: Enable. Policy: Users can insert/select/update their own profile.

#### [IMPROVED] Profile Creation Trigger
- Instead of manual insertion on the client, we will create a Postgres Function and Trigger `on auth.users` insert. This ensures every user (via Email, Apple, Google) gets a profile automatically.

#### `logs_food` Table
- `id`: BigInt (Primary Key, Identity)
- `user_id`: UUID (Foreign Key to `profiles.id`)
- `name`: Text
- `calories`: Integer
- `macros`: JSONB
- `created_at`: Timestamptz (default: `now()`)
- **RLS**: Enable. Policy: Users can select/insert their own logs.

#### `logs_workout` Table
- `id`: BigInt (Primary Key, Identity)
- `user_id`: UUID (Foreign Key to `profiles.id`)
- `name`: Text (e.g., "Push Day")
- `volume_load`: Integer
- `created_at`: Timestamptz (default: `now()`)
- **RLS**: Enable. Policy: Users can select/insert their own logs.

### 2. Type Generation & Client [DONE]
#### [NEW] `lib/supabase-types.ts`
- Will contain the auto-generated TypeScript definitions from Supabase.

#### [NEW] `lib/supabase.ts`
- Initialize Supabase client.
- **[IMPROVED] Storage**: Use `react-native-mmkv` adapter instead of `AsyncStorage` for instant auth state loading and better performance.

### 3. Authentication Logic [DONE]
#### [NEW] `components/AuthProvider.tsx`
- React Context to manage `session`, `user`, and `initialized` state.

#### [MODIFY] `app/_layout.tsx`
- Wrap the root layout with `AuthProvider`.
- **[IMPROVED] Protection**: Implement `useSegments` and `router.replace` logic to automatically redirect unauthenticated users to `/auth/login` and authenticated users to `/(tabs)`.

### 4. Authentication UI [DONE]
#### [NEW] `app/auth/_layout.tsx`
- Stack navigator for auth screens. Included `headerShown: false`.

#### [NEW] `app/auth/login.tsx`
- Minimalist Dark Mode UI using `React Native Reusables`.
- Fields: Email, Password.
- Actions: Log In.
- **Enhancements**: Inline Error Messaging, Forgot Password Link.

#### [NEW] `app/auth/register.tsx`
- Minimalist Dark Mode UI.
- Fields: Email, Password, Confirm Password.
- Actions: Sign Up.
- **Enhancements**: Inline Error Messaging (Email Used, Password Mismatch).

## Verification Plan

### Automated Verification
- Run `npx expo type-check`.

### Manual Verification (Simulator/Device)
1. **Sign Up Flow**:
   - Create new account.
   - **Verify Trigger**: Check `profiles` table in Supabase; ensure row exists immediately after signup.
   - Verify redirect to Dashboard.
   - **Note on "Email Already Used"**: Supabase's "User Enumeration Protection" may return a success response (fake email sent) instead of an error if attempting to register with an existing email, unless specific project settings are disabled.

2. **Login Flow**:
   - Log out -> Restart App.
   - Verify fast load (MMKV) -> Session persists.
   - Attempt to access protected route (e.g., `/nutrition`) while logged out -> Verify redirect to login.
