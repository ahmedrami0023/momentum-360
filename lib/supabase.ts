import { AppState, Platform } from 'react-native';
import 'react-native-url-polyfill/auto';
import { createClient } from '@supabase/supabase-js';
import AsyncStorage from '@react-native-async-storage/async-storage';
import { Database } from './supabase-types';

let storage: any;

if (Platform.OS === 'web') {
    storage = {
        getItem: (key: string) => {
            if (typeof localStorage === 'undefined') {
                return null;
            }
            return localStorage.getItem(key);
        },
        setItem: (key: string, value: string) => {
            if (typeof localStorage === 'undefined') {
                return;
            }
            localStorage.setItem(key, value);
        },
        removeItem: (key: string) => {
            if (typeof localStorage === 'undefined') {
                return;
            }
            localStorage.removeItem(key);
        },
    }
} else {
    // Only import MMKV on native platforms
    const { MMKV } = require('react-native-mmkv');
    const mmkv = new MMKV();
    storage = {
        getItem: (key: string) => mmkv.getString(key),
        setItem: (key: string, value: string) => mmkv.set(key, value),
        removeItem: (key: string) => mmkv.delete(key),
    };
}

export const supabase = createClient<Database>(
    process.env.EXPO_PUBLIC_SUPABASE_URL!,
    process.env.EXPO_PUBLIC_SUPABASE_ANON_KEY!,
    {
        auth: {
            storage,
            autoRefreshToken: true,
            persistSession: true,
            detectSessionInUrl: false,
        },
    }
);

AppState.addEventListener('change', (state) => {
    if (state === 'active') {
        supabase.auth.startAutoRefresh();
    } else {
        supabase.auth.stopAutoRefresh();
    }
});
