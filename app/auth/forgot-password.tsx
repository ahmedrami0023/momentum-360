import React, { useState } from 'react';
import { View, Text, Alert, TextInput, TouchableOpacity } from 'react-native';
import { Link, useRouter } from 'expo-router';
import { supabase } from '@/lib/supabase';
import { ArrowLeft } from 'lucide-react-native';

export default function ForgotPassword() {
    const [email, setEmail] = useState('');
    const [loading, setLoading] = useState(false);
    const router = useRouter();

    async function sendResetPasswordEmail() {
        if (!email) {
            Alert.alert('Error', 'Please enter your email address');
            return;
        }

        setLoading(true);
        const { error } = await supabase.auth.resetPasswordForEmail(email, {
            redirectTo: 'momentum360://auth/update-password', // Deep link to app
        });

        if (error) {
            Alert.alert('Error', error.message);
        } else {
            Alert.alert(
                'Check your email',
                'We have sent a password reset link to your email address.'
            );
            router.back();
        }
        setLoading(false);
    }

    return (
        <View className="flex-1 justify-center items-center bg-black p-4">
            <View className="w-full max-w-sm gap-6">
                <TouchableOpacity onPress={() => router.back()} className="absolute top-12 left-0 z-10 p-2">
                    <ArrowLeft color="white" size={24} />
                </TouchableOpacity>

                <View>
                    <Text className="text-3xl font-bold text-white mb-2 text-center mt-12">Reset Password</Text>
                    <Text className="text-zinc-400 text-center">Enter your email to receive a reset link</Text>
                </View>

                <View className="gap-4">
                    <TextInput
                        autoCapitalize="none"
                        placeholder="Email"
                        placeholderTextColor="#71717a"
                        onChangeText={setEmail}
                        value={email}
                        className="bg-zinc-900 border border-zinc-800 text-white rounded-lg p-4 text-base"
                    />
                </View>

                <TouchableOpacity
                    onPress={sendResetPasswordEmail}
                    disabled={loading}
                    className={`bg-white rounded-lg p-4 items-center justify-center mt-2 ${loading ? 'opacity-70' : ''}`}
                >
                    <Text className="text-black font-bold text-base">
                        {loading ? 'Sending Link...' : 'Send Reset Link'}
                    </Text>
                </TouchableOpacity>

                <View className="flex-row justify-center mt-4">
                    <Link href="/auth/login" asChild>
                        <TouchableOpacity>
                            <Text className="text-white font-bold">Back to Login</Text>
                        </TouchableOpacity>
                    </Link>
                </View>
            </View>
        </View>
    );
}
