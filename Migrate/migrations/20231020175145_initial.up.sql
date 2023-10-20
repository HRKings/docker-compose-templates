CREATE TABLE IF NOT EXISTS ulid_test (
    id ulid PRIMARY KEY DEFAULT gen_ulid()
);