# Vercel Deployment Guide

## Prerequisites

Before deploying to Vercel, you need to build the Flutter web app locally or via CI/CD.

## Option 1: Deploy Pre-built Files (Recommended)

### Step 1: Build the Flutter Web App

```bash
cd momentum_360
flutter pub get
flutter build web --release --base-href /
```

This creates the `build/web` directory with all static files.

### Step 2: Deploy to Vercel

**Using Vercel CLI:**
```bash
# Install Vercel CLI if you haven't
npm i -g vercel

# Deploy from the project root
cd momentum_360
vercel --prod
```

**Using Vercel Dashboard:**
1. Go to [vercel.com](https://vercel.com)
2. Import your GitHub repository
3. **Important:** In project settings:
   - **Framework Preset:** Other
   - **Root Directory:** `momentum_360`
   - **Build Command:** Leave empty (files are pre-built)
   - **Output Directory:** `build/web`
   - **Install Command:** Leave empty

## Option 2: Automated Deployment via GitHub Actions (Recommended)

The project is configured to automatically build and deploy to Vercel on every push to the `main` branch using GitHub Actions.

### Setup Instructions

1. **Get your Vercel Token:**
   - Go to [Vercel Settings > Tokens](https://vercel.com/account/tokens)
   - Click "Create Token"
   - Give it a name (e.g., "GitHub Actions Deployment")
   - Copy the token (you won't see it again)

2. **Get your Vercel Project ID (optional but recommended):**
   - Go to your project settings in Vercel dashboard
   - The Project ID is shown in the project settings or URL

3. **Get your Vercel Organization/Team ID (optional):**
   - Can be found in your Vercel team/organization settings
   - Or inferred automatically from the token

4. **Add GitHub Secrets:**
   - Go to your GitHub repository
   - Navigate to **Settings > Secrets and variables > Actions**
   - Click **New repository secret**
   - Add the following secrets:
     - `VERCEL_TOKEN` - Your Vercel token from step 1
     - `VERCEL_PROJECT_ID` - Your project ID (optional, but recommended)
     - `VERCEL_ORG_ID` - Your organization ID (optional)

5. **Configure Vercel Dashboard (Optional):**
   - You can disable automatic deployments in Vercel dashboard since GitHub Actions will handle deployments
   - Or keep both enabled (GitHub Actions will deploy on push)

### How It Works

- The workflow builds the Flutter web app on every push to `main`
- After successful build, it automatically deploys to Vercel production
- Pull requests will build and test but won't deploy
- Deployments are tracked in both GitHub Actions and Vercel dashboard

## Option 3: Build on Vercel (Advanced)

Vercel doesn't natively support Flutter, but you can use a custom build script:

1. Create a `build.sh` script (already created)
2. In Vercel project settings:
   - **Build Command:** `bash build.sh`
   - **Output Directory:** `build/web`

**Note:** This requires Flutter to be installed in Vercel's build environment, which may not work reliably.

## Troubleshooting

### 404 Errors

If you're getting 404 errors:
1. Make sure `vercel.json` is in the repository root (`momentum_360/vercel.json`)
2. Verify the `outputDirectory` points to `build/web`
3. Check that `build/web/index.html` exists after building

### Routing Issues

The `vercel.json` file includes rewrites to handle Flutter's client-side routing. All routes should redirect to `index.html` for proper navigation.

### Build Directory Not Found

If Vercel can't find the build directory:
- Make sure you've built the app: `flutter build web --release`
- Verify `build/web` exists and contains `index.html`
- Check that the `outputDirectory` in `vercel.json` matches your build output

