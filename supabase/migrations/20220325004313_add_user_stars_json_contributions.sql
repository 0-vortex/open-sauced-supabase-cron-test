ALTER TABLE public.user_stars
  ADD COLUMN contributions jsonb DEFAULT '[]' NOT NULL
