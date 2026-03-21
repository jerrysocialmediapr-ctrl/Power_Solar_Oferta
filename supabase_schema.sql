-- Power Solar PR Supabase Schema
-- Guarda los leads que llegan desde el landing page

CREATE TABLE IF NOT EXISTS public.leads (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    nombre TEXT NOT NULL,
    telefono TEXT NOT NULL,
    municipio TEXT NOT NULL,
    necesidad TEXT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);

-- Habilitar Row Level Security (RLS)
ALTER TABLE public.leads ENABLE ROW LEVEL SECURITY;

-- Politica para que cualquier persona pueda guardar sus datos desde el landing
CREATE POLICY "Permitir inserciones publicas" ON public.leads
    FOR INSERT
    TO public
    WITH CHECK (true);

-- Politica para que el administrador pueda ver los datos guardados
CREATE POLICY "Permitir lectura a autenticados" ON public.leads
    FOR SELECT
    TO authenticated
    USING (true);
