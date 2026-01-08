import React, { useState } from 'react';
import { View, Text, Alert, TextInput, TouchableOpacity } from 'react-native';
import { Link, useRouter } from 'expo-router';
import { supabase } from '@/lib/supabase';
import { Mail, Lock, AlertCircle } from 'lucide-react-native';

export default function Login() {
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    const [loading, setLoading] = useState(false);
    const [errorMsg, setErrorMsg] = useState<string | null>(null);
    const router = useRouter();

    async function signInWithEmail() {
        setLoading(true);
        setErrorMsg(null); // Clear previous errors

        const { error } = await supabase.auth.signInWithPassword({
            email,
            password,
        });

        if (error) {
            console.log('Login Error:', error.message);
            if (error.message.includes('Email not confirmed')) {
                setErrorMsg('Please verify your email address. Check your inbox.');
            } else if (error.message.includes('Invalid login credentials')) {
                setErrorMsg('Invalid email or password. Please try again.');
            } else {
                setErrorMsg(error.message);
            }
        }
        setLoading(false);
    }

    return (
        <View className="flex-1 justify-center items-center bg-black p-4">
            <View className="w-full max-w-sm gap-6">
                <View>
                    <Text className="text-3xl font-bold text-white mb-2 text-center">Momentum 360</Text>
                    <Text className="text-zinc-400 text-center mb-4">Sign in to your account</Text>
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

                    <View className="items-end">
                        <Link href="/auth/forgot-password" asChild>
                            <TouchableOpacity>
                                <Text className="text-zinc-400 text-sm">Forgot Password?</Text>
                            </TouchableOpacity>
                        </Link>
                    </View>
                </View>

                <TouchableOpacity
                    onPress={signInWithEmail}
                    disabled={loading}
                    className={`bg-white rounded-lg p-4 items-center justify-center mt-2 ${loading ? 'opacity-70' : ''}`}
                >
                    <Text className="text-black font-bold text-base">
                        {loading ? 'Signing in...' : 'Sign In'}
                    </Text>
                </TouchableOpacity>

                {/* Social Auth Placeholders */}
                <View className="gap-4 mt-4">
                    <View className="flex-row items-center gap-4">
                        <View className="flex-1 h-[1px] bg-zinc-800" />
                        <Text className="text-zinc-500 text-xs uppercase">Or continue with</Text>
                        <View className="flex-1 h-[1px] bg-zinc-800" />
                    </View>
                    <View className="flex-row gap-4">
                        <TouchableOpacity className="flex-1 bg-zinc-900 border border-zinc-800 p-4 rounded-lg items-center justify-center">
                            <Text className="text-white font-bold">Google</Text>
                        </TouchableOpacity>
                        <TouchableOpacity className="flex-1 bg-zinc-900 border border-zinc-800 p-4 rounded-lg items-center justify-center">
                            <Text className="text-white font-bold">Apple</Text>
                        </TouchableOpacity>
                    </View>
                </View>

                <View className="flex-row justify-center mt-6">
                    <Text className="text-zinc-500 mr-2">Don't have an account?</Text>
                    <Link href="/auth/register" asChild>
                        <TouchableOpacity>
                            <Text className="text-white font-bold">Sign Up</Text>
                        </TouchableOpacity>
                    </Link>
                </View>
            </View>
        </View>
    );
}
