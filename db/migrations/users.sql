-- ============================================================================
-- users.sql  ·  EdgeOne Pages Agent · Auth schema (Neon Postgres)
-- ----------------------------------------------------------------------------
-- Run this in Neon's SQL Editor, or via psql:
--   psql "$DATABASE_URL" -f db/migrations/users.sql
--
-- ============================================================================

CREATE EXTENSION IF NOT EXISTS pgcrypto;  -- needed for gen_random_uuid()

CREATE TABLE IF NOT EXISTS users (
  id            UUID         PRIMARY KEY DEFAULT gen_random_uuid(),
  username      VARCHAR(64)  NOT NULL,
  password_hash VARCHAR(255) NOT NULL,
  created_at    TIMESTAMPTZ  NOT NULL DEFAULT NOW()
);

CREATE UNIQUE INDEX IF NOT EXISTS users_username_lower_uniq
  ON users (LOWER(username));

CREATE INDEX IF NOT EXISTS users_created_at_idx
  ON users (created_at DESC);
