-- This script was generated by the Schema Diff utility in pgAdmin 4
-- For the circular dependencies, the order in which Schema Diff writes the objects is not very sophisticated
-- and may require manual changes to the script to ensure changes are applied in the correct order.
-- Please report an issue for any failure with the reproduction steps.

CREATE TABLE IF NOT EXISTS public.user_stars
(
    id bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    user_id bigint NOT NULL,
    star_id bigint NOT NULL,
    recency_score numeric,
    issues bigint NOT NULL DEFAULT 0,
    stars bigint NOT NULL DEFAULT 0,
    repo_name text COLLATE pg_catalog."default",
    description text COLLATE pg_catalog."default",
    contributors text[] COLLATE pg_catalog."default" NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    CONSTRAINT user_stars_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.user_stars
    OWNER to postgres;

GRANT ALL ON TABLE public.user_stars TO anon;

GRANT ALL ON TABLE public.user_stars TO authenticated;

GRANT ALL ON TABLE public.user_stars TO postgres;

GRANT ALL ON TABLE public.user_stars TO service_role;
