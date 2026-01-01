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

## Option 2: Automated Deployment via GitHub Actions

We can set up a GitHub Action that builds and deploys automatically. This requires:
1. Vercel token as a GitHub secret
2. GitHub Action workflow file

Would you like me to set this up?

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

