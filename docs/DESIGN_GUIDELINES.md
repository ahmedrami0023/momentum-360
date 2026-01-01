# Momentum 360 - Design Guidelines

## Purpose
This document defines the visual design system for Momentum 360, ensuring consistent UI/UX across all features. Inspired by iOS 26 Liquid Glass and Apple's Human Interface Guidelines, customized for our fitness app.

## Design Principles

1. **Clarity** - Content is paramount. UI enhances, doesn't compete
2. **Depth** - Strategic use of Liquid Glass and neomorphic shadows
3. **Context** - Section colors help users know where they are
4. **Simplicity** - Progressive complexity - easy to start, grows with user

---

## Visual Style

### Liquid Glass (iOS 26 Inspired)

**When to Use:**
- Navigation bars (bottom tab bar)
- Modal overlays and dialogs
- Floating action buttons

**Implementation:**
```dart
GlassMorphism.medium(
  child: content,
  borderRadius: BorderRadius.circular(16),
)
```

**Don't Overuse:**
- Limit to 2-3 glass elements per screen
- Avoid for content-heavy cards (readability)

### Neomorphism

**When to Use:**
- Content cards
- Buttons
- Input fields
- List items

**Implementation:**
```dart
NeomorphicStyle.medium(
  backgroundColor: AppColors.cardBackgroundLight,
  borderRadius: BorderRadius.circular(12),
)
```

**Characteristics:**
- Soft dual shadows (light + dark)
- Subtle depth (2-8dp elevation)
- Rounded corners (8-16px)

---

## Color System

### Section Colors

**Workout - Energetic**
- Primary: `#FF6B35` (Orange-Red)
- Secondary: `#FF8E53`
- Use: Workout cards, buttons, charts

**Nutrition - Fresh**
- Primary: `#4CAF50` (Green)
- Secondary: `#66BB6A`
- Use: Nutrition cards, meal logging, macros

**Progress - Powerful**
- Primary: `#7C4DFF` (Purple)
- Secondary: `#536DFE`
- Use: Analytics, progress indicators, PRs

**Neutral Colors**
- Background: `#F5F5F5`
- Card Background: `#FAFAFA`
- Text Primary: `#212121`
- Text Secondary: `#757575`

### Color Rules

1. **Never mix section colors** - Workout cards use only workout colors
2. **60-30-10 rule** - 60% neutral, 30% section color, 10% accent
3. **Ensure contrast** - Minimum 4.5:1 for WCAG AA
4. **Gradients sparingly** - Only for hero elements

---

## Typography

**Font:** Google Fonts - Inter (copyright-safe)

### Hierarchy

| Style | Size | Weight | Use Case |
|-------|------|--------|----------|
| Display | 32-40px | Bold (700) | Screen titles, hero numbers |
| Headline | 24-28px | Semibold (600) | Section headers |
| Title | 18-20px | Medium (500) | Card titles |
| Body | 14-16px | Regular (400) | Paragraph text |
| Label | 12-14px | Medium (500) | Input labels, metadata |
| Caption | 10-12px | Regular (400) | Timestamps |

### Rules

- Max 3 font sizes per screen
- Line height 1.4-1.6 for body
- Ellipsis for long text, never shrink below 12px

---

## Spacing System (8px Grid)

| Token | Value | Use Case |
|-------|-------|----------|
| XS | 4px | Icon padding, tight spacing |
| SM | 8px | List padding, small gaps |
| MD | 16px | Card padding, standard gaps |
| LG | 24px | Section spacing |
| XL | 32px | Screen padding |
| XXL | 48px | Hero spacing, empty states |

**Rule:** Always use multiples of 8px

---

## Components

### Buttons

**Primary Button**
- Neomorphic with section color
- Height: 48px
- Border Radius: 12px
- Font: Label (14px, Medium)
- States: Default, Pressed (inset), Disabled (0.5 opacity)

**Secondary Button**
- Outlined neomorphic
- Border: section color, 2px
- Transparent fill

**Text Button**
- No background
- Section color text

### Cards

**Glass Card**
- Semi-transparent white + blur
- Border: 1px white, 20% opacity
- Padding: 16-24px
- Border Radius: 16px
- Use: Floating summaries, modals

**Neomorphic Card**
- Soft double shadow
- Padding: 16px
- Border Radius: 12px
- Use: Content containers, list items

### Input Fields

- Neomorphic inset style
- Height: 48px
- Border Radius: 10px
- Padding: 12px horizontal
- States: Default, Focused (section color), Error (red)

### Navigation

**Bottom Tab Bar**
- Liquid Glass with blur
- Height: 56px + safe area
- 5 tabs: Home, Nutrition, Workout, Progress, Profile
- Active: Section color icon + label
- Inactive: Gray icon only

---

## Animations

### Transitions
- Duration: 300ms
- Curve: easeInOut
- Style: Slide from right (push), fade (modal)

### Micro-interactions
- Button Press: Scale 0.95 + inset (100ms)
- Card Tap: Scale 0.98 (80ms)
- Loading: Circular, section color

---

## Accessibility

### Contrast
- Text on background: 4.5:1 minimum
- Large text (18px+): 3:1 minimum

### Touch Targets
- Minimum: 44x44px (Apple HIG)
- Ideal: 48x48px
- Spacing: 8px between targets

### Motion
- Respect `reduceMotion` setting
- Settings toggle for glass effects (eye strain)

### Screen Readers
- Semantic labels on all interactive elements
- Meaningful descriptions for icons

---

## Copyright Compliance

### Safe to Use ✅
- Design principles from Apple HIG
- Layout patterns
- Google Fonts (Inter, Manrope)
- Material Icons or custom icons
- Our own Liquid Glass implementation

### Must Avoid ❌
- Apple SF Pro font
- Apple SF Symbols
- Apple logos/trademarks
- Pixel-perfect copies of Apple apps
- Proprietary Apple animations

---

## Implementation Examples

### Screen Composition
```dart
Scaffold(
  backgroundColor: AppColors.backgroundLight,
  body: SingleChildScrollView(
    padding: EdgeInsets.all(AppConstants.spacingMD),
    child: Column(
      children: [
        // Title
        Text('Screen Title', style: theme.displaySmall),
        SizedBox(height: AppConstants.spacingXL),
        
        // Cards with section colors
        NeomorphicCard(
          child: content,
        ),
      ],
    ),
  ),
  bottomNavigationBar: AppBottomNavBar(...),
)
```

### Card with Section Color
```dart
NeomorphicCard(
  child: Row(
    children: [
      Icon(Icons.fitness_center, color: AppColors.workoutPrimary),
      SizedBox(width: AppConstants.spacingMD),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Title', style: theme.titleLarge),
          Text('Subtitle', style: theme.bodyMedium),
        ],
      ),
    ],
  ),
)
```

---

## Updating Guidelines

When adding new patterns:
1. Document here first
2. Implement in code
3. Update `lib/core/theme/` files
4. Review for consistency

**Consistency is key!** When in doubt, refer to this document.

---

**Last Updated:** January 1, 2026  
**Version:** 1.0.0

