# PostgreSQL with extensions

This custom dockerfile contains some extensions that might be useful in production or development

# Current extensions

- [ULID](https://github.com/HRKings/pgx_ulid): 128-bit sortable IDs compatible with the existing UUID. ([currently forked for compatibility with PG16](https://github.com/pksunkara/pgx_ulid))

# Postgres Contrib Modules

- [pg_stat_statements](https://www.postgresql.org/docs/current/pgstatstatements.html): view various statistics of the database
- [pgrowlocks](https://www.postgresql.org/docs/current/pgrowlocks.html): show row locking information for a specified table
- [unaccent](https://www.postgresql.org/docs/current/unaccent.html): remove accents and diacritics from words
- [tablefunc](https://www.postgresql.org/docs/current/tablefunc.html): crosstab and random normal distribution
- [hstore](https://www.postgresql.org/docs/current/hstore.html): store key/value pairs on a column
- [fuzzystrmatch](https://www.postgresql.org/docs/current/fuzzystrmatch.html): provides fuzzy string matching and distance based string search

