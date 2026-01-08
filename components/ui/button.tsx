import { TouchableOpacity, Text, TouchableOpacityProps, View } from 'react-native';
import { cn } from 'nativewind/theme';
import { useThemeColor } from '@/lib/useThemeColor';

interface ButtonProps extends TouchableOpacityProps {
    variant?: 'default' | 'outline' | 'ghost';
    size?: 'default' | 'sm' | 'lg';
    label: string;
    className?: string; // Text className
}

export function Button({
    variant = 'default',
    size = 'default',
    label,
    className,
    style,
    ...props
}: ButtonProps) {
    const themeColor = useThemeColor(); // "nutrition", "workout", etc.

    // Base layout: Pill shape (rounded-full), Flex centered
    const baseStyle = "flex-row items-center justify-center rounded-full active:opacity-90";

    // Size variants
    const sizeStyle = {
        default: "h-12 px-6",
        sm: "h-9 px-4",
        lg: "h-14 px-8"
    };

    // Text Base
    const textBaseStyle = "font-semibold text-base";

    // Dynamic coloring based on variant & theme
    // We construct the className string dynamically to leverage the tailwind config colors
    let variantStyle = "";
    let textStyle = "";

    if (variant === 'default') {
        // Solid colored background
        // nativewind doesn't support dynamic class construction easily like `bg-${themeColor}`, 
        // so we use inline style or mapped classes if possible. 
        // For simplicity and performance with the configured tailwind colors, we can map:
        const bgMap: Record<string, string> = {
            nutrition: "bg-nutrition",
            workout: "bg-workout",
            momentum: "bg-momentum",
            progress: "bg-progress",
            profile: "bg-profile",
            primary: "bg-primary"
        };
        variantStyle = bgMap[themeColor] || "bg-primary";
        textStyle = "text-white";
    } else if (variant === 'outline') {
        variantStyle = "border-2 border-slate-200 dark:border-slate-800 bg-transparent";
        textStyle = "text-slate-900 dark:text-slate-50";
        // Could also tint the text with the theme color
    } else if (variant === 'ghost') {
        variantStyle = "bg-transparent";
        textStyle = "text-slate-900 dark:text-slate-50";
    }

    return (
        <TouchableOpacity
            className={cn(baseStyle, sizeStyle[size], variantStyle, props.className)}
            style={style}
            {...props}
        >
            <Text className={cn(textBaseStyle, textStyle, className)}>
                {label}
            </Text>
        </TouchableOpacity>
    );
}
