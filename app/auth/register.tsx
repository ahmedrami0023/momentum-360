import React, { useState } from 'react';
import { View, Text, Alert, TextInput, TouchableOpacity } from 'react-native';
import { Link, useRouter } from 'expo-router';
import { supabase } from '@/lib/supabase';
import { Mail, Lock, AlertCircle } from 'lucide-react-native';

export default function Register() {
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    const [confirmPassword, setConfirmPassword] = useState('');
    const [loading, setLoading] = useState(false);
    const [errorMsg, setErrorMsg] = useState<string | null>(null);
    const router = useRouter();

    async function signUpWithEmail() {
        setErrorMsg(null); // Clear previous errors

        if (password !== confirmPassword) {
            setErrorMsg('Passwords do not match. Please try again.');
            return;
        }

        setLoading(true);
        const {
            data: { session },
            error,
        } = await supabase.auth.signUp({
            email,
            password,
        });

        if (error) {
            console.log('Register Error:', error.message);
            if (error.message.includes('User already registered')) {
                setErrorMsg('This email is already registered. Please log in instead.');
            } else if (error.message.includes('invalid')) {
                setErrorMsg(error.message);
            } else {
                setErrorMsg(error.message);
            }
        } else {
            if (!session) {
                Alert.alert(
                    'Verification Sent',
                    'We have sent a verification link to your email.\n\nPlease verify your account to log in.'
                );
                router.replace('/auth/login');
            }
        }
        setLoading(false);
    }

    return (
        <View className="flex-1 justify-center items-center bg-black p-4">
            <View className="w-full max-w-sm gap-6">
                <View>
                    <Text className="text-3xl font-bold text-white mb-2 text-center">Create Account</Text>
                    <Text className="text-zinc-400 text-center mb-4">Start your momentum journey</Text>
                </View>

                {/* Inline Error Message */}
                {errorMsg && (
                    <View className="bg-red-500/10 border border-red-500/50 p-4 rounded-lg flex-row items-center">
                        <AlertCircle size={20} color="#ef4444" />
                        <Text className="text-red-500 ml-3 flex-1">{errorMsg}</Text>
                    </View>
                )}

                <View className="gap-4">
                    <View className="relative">
                        <View className="absolute left-4 top-4 z-10">
                            <Mail size={20} color={errorMsg ? "#ef4444" : "#a1a1aa"} />
                        </View>
                        <TextInput
                            autoCapitalize="none"
                            placeholder="Email"
                            placeholderTextColor="#71717a"
                            onChangeText={(text) => { setEmail(text); setErrorMsg(null); }}
                            value={email}
                            className={`bg-zinc-900 border text-white rounded-lg py-4 pl-12 pr-4 text-base ${errorMsg ? 'border-red-500' : 'border-zinc-800'}`}
                        />
                    </View>

                    <View className="relative">
                        <View className="absolute left-4 top-4 z-10">
                            <Lock size={20} color={errorMsg ? "#ef4444" : "#a1a1aa"} />
                        </View>
                        <TextInput
                            secureTextEntry
                            autoCapitalize="none"
                            placeholder="Password"
                            placeholderTextColor="#71717a"
                            onChangeText={(text) => { setPassword(text); setErrorMsg(null); }}
                            value={password}
                            className={`bg-zinc-900 border text-white rounded-lg py-4 pl-12 pr-4 text-base ${errorMsg ? 'border-red-500' : 'border-zinc-800'}`}
                        />
                    </View>

                    <View className="relative">
                        <View className="absolute left-4 top-4 z-10">
                            <Lock size={20} color={errorMsg ? "#ef4444" : "#a1a1aa"} />
                        </View>
                        <TextInput
                            secureTextEntry
                            autoCapitalize="none"
                            placeholder="Confirm Password"
                            placeholderTextColor="#71717a"
                            onChangeText={(text) => { setConfirmPassword(text); setErrorMsg(null); }}
                            value={confirmPassword}
                            className={`bg-zinc-900 border text-white rounded-lg py-4 pl-12 pr-4 text-base ${errorMsg ? 'border-red-500' : 'border-zinc-800'}`}
                        />
                    </View>
                </View>

                <TouchableOpacity
                    onPress={signUpWithEmail}
                    disabled={loading}
                    className={`bg-white rounded-lg p-4 items-center justify-center mt-2 ${loading ? 'opacity-70' : ''}`}
                >
                    <Text className="text-black font-bold text-base">
                        {loading ? 'Creating account...' : 'Sign Up'}
                    </Text>
                </TouchableOpacity>

                <View className="flex-row justify-center mt-4">
                    <Text className="text-zinc-500 mr-2">Already have an account?</Text>
                    <Link href="/auth/login" asChild>
                        <TouchableOpacity>
                            <Text className="text-white font-bold">Log In</Text>
                        </TouchableOpacity>
                    </Link>
                </View>
            </View>
        </View>
    );
}
