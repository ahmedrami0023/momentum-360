# Momentum 360: Environment Setup Guide

Follow these steps to initialize your project environment.

> [!IMPORTANT]
> Do **NOT** skip the `.gitignore` step. We must protect your API keys.

## 1. GitHub Repository Setup

Open your terminal in the project root (`c:\Users\Ahmed\Desktop\Projects\Final\0`) and run these commands:

1.  **Initialize Git**:
    ```powershell
    git init
    ```

2.  **Protect Secrets (Create .gitignore)**:
    Create a file named `.gitignore` and add this line:
    ```
    .env
    ```

3.  **Commit Initial State**:
    ```powershell
    git add .
    git commit -m "Initial Setup: Environment config"
    ```

4.  **Create Remote Repo (using GitHub CLI)**:
    ```powershell
    gh repo create momentum-360 --public --source=. --remote=origin --push
    ```
    *(If you don't have `gh` installed, create the repository on github.com manually, then run the `git remote add origin ...` command shown there, followed by `git push -u origin main`)*.

---

## 2. Supabase Project Setup

1.  Go to [supabase.com](https://supabase.com) and Log in.
2.  Click **"New Project"**.
3.  **Organization**: Select your org (or create one).
4.  **Name**: `Momentum 360`
5.  **Database Password**: Generate a strong password and **SAVE IT** in your password manager.
6.  **Region**: Select the region closest to you (e.g., US East N. Virginia).
7.  Click **"Create new project"**.
8.  Wait ~2 minutes for the database to provision.

---

## 3. Get API Keys & Configure Environment

Once your Supabase project is ready (green "Active" status):

1.  Go to **Project Settings** (gear icon) -> **API**.
2.  Find these values:
    *   **Project URL**
    *   **Project API keys** -> `anon` `public`

3.  **Create `.env` File**:
    Create a new file named `.env` in the root of your project.

4.  **Paste Credentials**:
    Add the following lines (replace with your actual values):

    ```env
    EXPO_PUBLIC_SUPABASE_URL=https://your-project-id.supabase.co
    EXPO_PUBLIC_SUPABASE_ANON_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
    ```

    > [!NOTE]
    > We use `EXPO_PUBLIC_` prefix so Expo can access these variables in the app.

## 4. Tools & Next Steps

*   **Supabase**: We will use `Supabase-Mcp` for management.
*   **Design**: We will use standard `NativeWind` libraries directly.

## 5. Web Support (Skia/WASM)
If you plan to run the app on the web (`npx expo start --web`), you need to ensure Skia's WASM binary is accessible.

1.  **Create Public Folder**:
    Ensure a `public/` folder exists in the root.
2.  **Copy WASM**:
    Copy `canvaskit.wasm` from `node_modules/canvaskit-wasm/bin/full/canvaskit.wasm` to `public/canvaskit.wasm`.
    *(This is already handled if you used the agent's fix).*

**You are now ready to start Phase 3: Scaffolding!**
