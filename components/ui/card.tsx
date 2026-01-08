import { View, ViewProps } from 'react-native';
import { cn } from 'nativewind/theme';
import { useThemeColor } from '@/lib/useThemeColor';

interface CardProps extends ViewProps {
    variant?: 'default' | 'accent';
    padded?: boolean;
}

export function Card({ 
    variant = 'default', 
    padded = true,
    className, 
    children, 
    ...props 
}: CardProps) {
    const themeColor = useThemeColor();

    // Base: Rounded-3xl, background colors
    const baseStyle = "rounded-3xl bg-white dark:bg-slate-900 overflow-hidden";
    const shadowStyle = "shadow-sm shadow-slate-200/50 dark:shadow-none"; // Crisp shadow in light, none in dark
    const borderStyle = "border border-slate-100 dark:border-slate-800";
    
    // Accent logic: Add a left border of the theme color
    const accentStyle = variant === 'accent' ? "border-l-4" : "";
    
    // Hard to do dynamic border-color via class names without a map, 
    // but Nativewind allows inline styles for dynamic values easily.
    // For 'accent', we'll apply the border color via style prop if needed or class map.
    const borderColorMap: Record<string, string> = {
        nutrition: "border-l-nutrition",
        workout: "border-l-workout",
        momentum: "border-l-momentum",
        progress: "border-l-progress",
        profile: "border-l-profile",
        primary: "border-l-primary"
    };

    const finalAccentClass = variant === 'accent' ? borderColorMap[themeColor] : "";
    const paddingClass = padded ? "p-5" : "";

    return (
        <View 
            className={cn(baseStyle, shadowStyle, borderStyle, accentStyle, finalAccentClass, paddingClass, className)} 
            {...props}
        >
            {children}
        </View>
    );
}
