import { View, Text } from 'react-native';

export default function Progress() {
    return (
        <View className="flex-1 bg-black justify-center items-center">
            <Text className="text-white text-2xl font-bold">Your Progress</Text>
            <Text className="text-zinc-500 mt-2">Charts and stats coming soon</Text>
        </View>
    );
}
