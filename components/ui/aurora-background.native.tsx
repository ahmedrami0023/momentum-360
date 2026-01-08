import React, { useEffect } from 'react';
import { useWindowDimensions, View, Platform, Text } from 'react-native';
import { Canvas, Rect, Blur, Circle } from '@shopify/react-native-skia';
import { useSharedValue, withRepeat, withTiming, withSequence, Easing } from 'react-native-reanimated';

// -----------------------------------------------------------------------------
// Component Implementation
// -----------------------------------------------------------------------------
export function AuroraContent({ children }: { children?: React.ReactNode }) {
    const { width, height } = useWindowDimensions();
    const scale1 = useSharedValue(1);
    const scale2 = useSharedValue(1);

    useEffect(() => {
        scale1.value = withRepeat(
            withSequence(
                withTiming(1.2, { duration: 4000, easing: Easing.inOut(Easing.ease) }),
                withTiming(1, { duration: 4000, easing: Easing.inOut(Easing.ease) })
            ),
            -1,
            true
        );
        scale2.value = withRepeat(
            withSequence(
                withTiming(0.8, { duration: 5000, easing: Easing.inOut(Easing.ease) }),
                withTiming(1.1, { duration: 5000, easing: Easing.inOut(Easing.ease) })
            ),
            -1,
            true
        );
    }, []);

    return (
        <View style={{ flex: 1, backgroundColor: '#000000' }}>
            <Canvas style={{ position: 'absolute', width, height }}>
                <Rect x={0} y={0} width={width} height={height} color="#020617" />
                <Circle cx={0} cy={0} r={width * 0.8} color="#3333FF" opacity={0.4}>
                    <Blur blur={60} />
                </Circle>
                <Circle cx={width} cy={height} r={width * 0.6} color="#990033" opacity={0.3}>
                    <Blur blur={80} />
                </Circle>
                <Circle cx={width / 2} cy={height / 2} r={width * 0.4} color="#00BF20" opacity={0.1}>
                    <Blur blur={100} />
                </Circle>
            </Canvas>
            <View style={{ flex: 1 }}>{children}</View>
        </View>
    );
}

// -----------------------------------------------------------------------------
// Platform Loading Logic
// -----------------------------------------------------------------------------
export function AuroraBackground(props: { children?: React.ReactNode }) {
    // Web: Skia loads automatically with the latest versions, 
    // but just in case of crash, we can render directly using the new arch.
    // If specific "WithSkiaWeb" lazy loading is needed, likely the user needs to 
    // update index.html, but Expo 50+ usually handles it.

    if (Platform.OS === 'web') {
        // Setup for web if needed, for now standard render.
        // If this fails, we might need a Suspense fallback.
        return (
            <React.Suspense fallback={<View style={{ flex: 1, backgroundColor: '#000' }}>{props.children}</View>}>
                <AuroraContent {...props} />
            </React.Suspense>
        );
    }

    return <AuroraContent {...props} />;
}
