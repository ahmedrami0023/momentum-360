import React from 'react';
import { ViewProps } from 'react-native';
import { MotiView } from 'moti';

interface AnimatedEntryProps extends ViewProps {
    delay?: number;
}

export function AnimatedEntry({ children, delay = 0, style, ...props }: AnimatedEntryProps) {
    return (
        <MotiView
            from={{ opacity: 0, translateY: 20 }}
            animate={{ opacity: 1, translateY: 0 }}
            transition={{
                type: 'timing',
                duration: 800,
                delay
            }}
            style={style}
            {...props}
        >
            {children}
        </MotiView>
    );
}
