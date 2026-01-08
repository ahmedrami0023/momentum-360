import React from 'react';
import { View } from 'react-native';
import { WithSkiaWeb } from '@shopify/react-native-skia/lib/module/web';

export function AuroraBackground(props: { children?: React.ReactNode }) {
    return (
        <WithSkiaWeb
            getComponent={() => import('./aurora-background.native').then((m) => ({ default: m.AuroraContent }))}
            fallback={<View style={{ flex: 1, backgroundColor: '#000' }}>{props.children}</View>}
            opts={{ locateFile: () => '/canvaskit.wasm' }}
            componentProps={props}
        />
    );
}

// -----------------------------------------------------------------------------
// NOTE: WithSkiaWeb usually takes a "getComponent" prop for lazy loading
// the entire bundle. But if we import Skia symbols top-level, they might crash
// before WithSkiaWeb runs if WASM isn't hot.
// Safe pattern: The content component should be lazy or defined in a way
// that doesn't trigger Skia Access calls immediately.
// However, importing the symbols themselves (Canvas, etc) is usually fine.
// The crash "CanvasKit not defined" happens when RENDER occurs.
// WithSkiaWeb delays render until WASM is loaded.
// -----------------------------------------------------------------------------
