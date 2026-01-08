import { View, Text } from 'react-native';
import { AuroraBackground } from '@/components/ui/aurora-background';
import { GlassCard } from '@/components/ui/glass-card';
import { AnimatedEntry } from '@/components/ui/animated-entry';
import { MotiText } from 'moti';

export default function HomeScreen() {
    return (
        <AuroraBackground>
            <View className="flex-1 items-center justify-center p-6">

                <AnimatedEntry delay={300}>
                    <GlassCard className="w-full max-w-sm p-8 items-center gap-4" intensity={80}>
                        {/* Title */}
                        <MotiText
                            from={{ opacity: 0, scale: 0.9 }}
                            animate={{ opacity: 1, scale: 1 }}
                            transition={{ delay: 500, type: 'spring' }}
                            className="text-4xl font-bold text-white text-center"
                        >
                            Momentum
                        </MotiText>

                        {/* Subtitle */}
                        <Text className="text-white/70 text-center text-lg">
                            Liquid Glass UI System
                        </Text>

                        {/* Content Button Demonstration */}
                        <View className="w-full h-12 bg-white/10 rounded-full mt-4 items-center justify-center border border-white/20">
                            <Text className="text-white font-medium">Get Started</Text>
                        </View>
                    </GlassCard>
                </AnimatedEntry>

            </View>
        </AuroraBackground>
    );
}
