import { View, Text } from "react-native";
import { cn } from "@/lib/utils";

export default function Index() {
    return (
        <View className="flex-1 items-center justify-center bg-background">
            <Text className={cn("text-xl font-bold text-red-500")}>
                Hello Momentum
            </Text>
        </View>
    );
}
