import { View, Text } from 'react-native';

export default function Dashboard() {
    return (
        <View className="flex-1 bg-black justify-center items-center">
            <Text className="text-white text-3xl font-bold">Velocity Gauge</Text>
            <Text className="text-zinc-400 mt-2">Momentum: 0%</Text>
        </View>
    );
}
