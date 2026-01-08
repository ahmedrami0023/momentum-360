import React from 'react';
import { View, ViewProps, Platform } from 'react-native';
import { BlurView } from 'expo-blur';
import { cn } from '@/lib/utils';
import { cssInterop } from "nativewind";

// Enable Tailwind styling for BlurView
cssInterop(BlurView, {
    className: "style",
});

interface GlassCardProps extends ViewProps {
    intensity?: number;
    tint?: 'light' | 'dark' | 'default' | 'systemMaterial' | 'systemThinMaterial' | 'systemChromeMaterial';
    className?: string;
}

export function GlassCard({
    children,
    intensity = 50,
    tint = "systemMaterial",
    className,
    style,
    ...props
}: GlassCardProps) {
    // On Android, simpler implementation or fallback if needed. 
    // Expo BlurView works on Android but can be expensive.

    return (
        <View
            className={cn(
                "overflow-hidden rounded-3xl border border-white/20",
                className
            )}
            style={style}
            {...props}
        >
            <BlurView
                intensity={intensity}
                tint={tint}
                className="absolute inset-0"
            />
            <View className="z-10 relative">
                {children}
            </View>
        </View>
    );
}
