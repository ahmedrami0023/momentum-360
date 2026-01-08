import { View, Text, TouchableOpacity, Alert } from 'react-native';
import { supabase } from '@/lib/supabase';
import { useAuth } from '@/components/AuthProvider';
import { User, LogOut } from 'lucide-react-native';

export default function Profile() {
    const { user } = useAuth();

    async function handleSignOut() {
        const { error } = await supabase.auth.signOut();
        if (error) {
            Alert.alert('Error signing out', error.message);
        }
    }

    return (
        <View className="flex-1 bg-black p-6">
            <View className="mt-12 items-center">
                <View className="h-24 w-24 bg-zinc-900 rounded-full items-center justify-center mb-4 border border-zinc-800">
                    <User size={40} color="#fff" />
                </View>
                <Text className="text-white text-xl font-bold">{user?.email}</Text>
                <Text className="text-zinc-500 text-sm mt-1">Free Plan</Text>
            </View>

            <View className="mt-12 gap-4">
                <TouchableOpacity
                    onPress={handleSignOut}
                    className="flex-row items-center bg-zinc-900 p-4 rounded-xl border border-zinc-800"
                >
                    <LogOut size={20} color="#ef4444" />
                    <Text className="text-red-500 font-bold ml-3">Log Out</Text>
                </TouchableOpacity>
            </View>
        </View>
    );
}
