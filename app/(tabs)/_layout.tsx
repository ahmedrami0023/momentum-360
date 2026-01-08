import { Tabs } from 'expo-router';
import { Chrome, Utensils, Dumbbell, Zap, PieChart, User } from 'lucide-react-native';

export default function TabLayout() {
    return (
        <Tabs
            screenOptions={{
                headerShown: false,
                tabBarStyle: {
                    backgroundColor: '#09090b', // zinc-950
                    borderTopColor: '#27272a', // zinc-800
                    height: 88,
                    paddingTop: 8,
                },
                tabBarActiveTintColor: '#fff',
                tabBarInactiveTintColor: '#71717a',
                tabBarLabelStyle: {
                    fontSize: 12,
                    marginBottom: 8,
                    fontWeight: '600',
                }
            }}
        >
            <Tabs.Screen
                name="nutrition"
                options={{
                    title: 'Fuel',
                    tabBarIcon: ({ color }) => <Utensils size={24} color={color} />,
                }}
            />
            <Tabs.Screen
                name="workout"
                options={{
                    title: 'Train',
                    tabBarIcon: ({ color }) => <Dumbbell size={24} color={color} />,
                }}
            />
            <Tabs.Screen
                name="index"
                options={{
                    title: 'Momentum',
                    tabBarIcon: ({ color }) => (
                        <Chrome size={32} color={color} strokeWidth={2.5} />
                    ),
                    // Highlight the center button slightly?
                }}
            />
            <Tabs.Screen
                name="progress"
                options={{
                    title: 'Progress',
                    tabBarIcon: ({ color }) => <PieChart size={24} color={color} />,
                }}
            />
            <Tabs.Screen
                name="profile"
                options={{
                    title: 'Profile',
                    tabBarIcon: ({ color }) => <User size={24} color={color} />,
                }}
            />
        </Tabs>
    );
}
