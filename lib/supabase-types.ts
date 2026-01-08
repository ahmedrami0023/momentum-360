export type Json =
    | string
    | number
    | boolean
    | null
    | { [key: string]: Json | undefined }
    | Json[]

export type Database = {
    // Allows to automatically instantiate createClient with right options
    // instead of createClient<Database, { PostgrestVersion: 'XX' }>(URL, KEY)
    __InternalSupabase: {
        PostgrestVersion: "14.1"
    }
    public: {
        Tables: {
            logs_food: {
                Row: {
                    calories: number
                    created_at: string | null
                    id: number
                    macros: Json | null
                    name: string
                    user_id: string
                }
                Insert: {
                    calories: number
                    created_at?: string | null
                    id?: number
                    macros?: Json | null
                    name: string
                    user_id: string
                }
                Update: {
                    calories?: number
                    created_at?: string | null
                    id?: number
                    macros?: Json | null
                    name?: string
                    user_id?: string
                }
                Relationships: [
                    {
                        foreignKeyName: "logs_food_user_id_fkey"
                        columns: ["user_id"]
                        isOneToOne: false
                        referencedRelation: "profiles"
                        referencedColumns: ["id"]
                    },
                ]
            }
            logs_workout: {
                Row: {
                    created_at: string | null
                    id: number
                    name: string
                    user_id: string
                    volume_load: number | null
                }
                Insert: {
                    created_at?: string | null
                    id?: number
                    name: string
                    user_id: string
                    volume_load?: number | null
                }
                Update: {
                    created_at?: string | null
                    id?: number
                    name?: string
                    user_id?: string
                    volume_load?: number | null
                }
                Relationships: [
                    {
                        foreignKeyName: "logs_workout_user_id_fkey"
                        columns: ["user_id"]
                        isOneToOne: false
                        referencedRelation: "profiles"
                        referencedColumns: ["id"]
                    },
                ]
            }
            profiles: {
                Row: {
                    id: string
                    momentum_score: number | null
                    settings: Json | null
                }
                Insert: {
                    id: string
                    momentum_score?: number | null
                    settings?: Json | null
                }
                Update: {
                    id?: string
                    momentum_score?: number | null
                    settings?: Json | null
                }
                Relationships: []
            }
        }
        Views: {
            [_ in never]: never
        }
        Functions: {
            [_ in never]: never
        }
        Enums: {
            [_ in never]: never
        }
        CompositeTypes: {
            [_ in never]: never
        }
    }
}
