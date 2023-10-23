# PostgreSQL with extensions

This custom dockerfile contains some extensions that might be useful in production or development, also activates [pg_contrib_modules](https://www.postgresql.org/docs/current/contrib.html) and some custom functions

# Current extensions

- [ULID](https://github.com/HRKings/pgx_ulid): 128-bit sortable IDs compatible with the existing UUID. ([currently forked for compatibility with PG16](https://github.com/pksunkara/pgx_ulid))

# Postgres Contrib Modules

- [pg_stat_statements](https://www.postgresql.org/docs/current/pgstatstatements.html): view various statistics of the database
- [pgrowlocks](https://www.postgresql.org/docs/current/pgrowlocks.html): show row locking information for a specified table
- [unaccent](https://www.postgresql.org/docs/current/unaccent.html): remove accents and diacritics from words
- [tablefunc](https://www.postgresql.org/docs/current/tablefunc.html): crosstab and random normal distribution
- [hstore](https://www.postgresql.org/docs/current/hstore.html): store key/value pairs on a column
- [fuzzystrmatch](https://www.postgresql.org/docs/current/fuzzystrmatch.html): provides fuzzy string matching and distance based string search

# Custom functions

## ULID date matching
A custom function that can match ULIDs based only on the date. For example, to match all ULIDs created on `2000-01-01` usually one would need to run this query:

```sql
SELECT * FROM example_table 
WHERE ulid_column >= '2000-01-01'::timestamp::ulid AND ulid_column < '2000-01-02'::timestamp::ulid;
```

With the custom function this becomes:
```sql
SELECT * FROM example_table WHERE is_ulid_within_day(ulid_column, '2000-01-01'::date);
```

A function to generate an ULID based only on a date is also provided:
```sql
SELECT get_ulid_from_timestamp_day('2000-01-01'::date);
```

## Check if a give timestamp is from a day
A custom function that can match timestamps based only on the date. For example, to match all timestamps created on `2000-01-01` usually one would need to run this query:

```sql
SELECT * FROM example_table 
WHERE timestamp_column >= '2000-01-01'::timestamp AND timestamp_column < '2000-01-02'::timestamp;
```

With the custom function this becomes:
```sql
SELECT * FROM example_table WHERE is_timestamp_within_day(timestamp_column, '2000-01-01'::date);
```

This works on both timestamp with and without timezone
