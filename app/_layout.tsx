import "../global.css";
import { Slot, useRouter, useSegments } from "expo-router";
import { useEffect } from "react";
import { AuthProvider, useAuth } from "@/components/AuthProvider";
import { View, ActivityIndicator } from "react-native";

function InitialLayout() {
    const { session, initialized } = useAuth();
    const segments = useSegments();
    const router = useRouter();

    useEffect(() => {
        if (!initialized) return;

        const inAuthGroup = segments[0] === "auth";

        if (session && inAuthGroup) {
            // Redirect to the home tab if logged in and trying to access auth screens
            router.replace("/(tabs)");
        } else if (!session && !inAuthGroup) {
            // Redirect to login if not logged in and not in the auth group
            router.replace("/auth/login");
        }
    }, [session, initialized, segments]);

    if (!initialized) {
        return (
            <View className="flex-1 justify-center items-center bg-background">
                <ActivityIndicator size="large" className="text-primary" />
            </View>
        );
    }

    return <Slot />;
}

export default function RootLayout() {
    return (
        <AuthProvider>
            <InitialLayout />
        </AuthProvider>
    );
}
