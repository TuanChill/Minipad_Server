CREATE TABLE "users" (
  "email" varchar PRIMARY KEY,
  "password" varchar NOT NULL,
  "avatar" varchar,
  "phone_number" varchar(10),
  "birthday" timestamptz,
  "full_name" varchar NOT NULL,
  "updated_at" timestamptz NOT NULL DEFAULT (now()),
  "create_at" timestamptz NOT NULL DEFAULT (now())
);

CREATE OR REPLACE FUNCTION trigger_set_timestamp()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER set_timestamp
BEFORE UPDATE ON "users"
FOR EACH ROW

EXECUTE PROCEDURE trigger_set_timestamp();