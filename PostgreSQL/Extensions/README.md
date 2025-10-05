# PostgreSQL with extensions

This custom dockerfile contains some extensions that might be useful in production or development, also activates [pg_contrib_modules](https://www.postgresql.org/docs/current/contrib.html) and some custom functions

## Current extensions

- [ULID](https://github.com/pksunkara/pgx_ulid): 128-bit sortable IDs compatible with the existing UUID.
  - **Note:** PostgreSQL 18 introduced UUIDv7, which works basically the same way of an ULID, but respects the format of the traditional UUID, unlike ULID's Crockford's base32 encoding
  - ULID and UUID can be converted back and forth like so: `SELECT '01K6RVKMF8FV8R5J5GA84GMKKH'::ulid::uuid;` and `SELECT '0199b1b9-d1e8-7ed1-82c8-b052090a4e71'::uuid::ulid;`
  - I still recommend ULID because I find it easier to read and having a more compact representation. But, that said, UUIDv7 is more widespread and people tend to like more things that are in the standard library of software.

## Postgres Contrib Modules

- [pg_stat_statements](https://www.postgresql.org/docs/current/pgstatstatements.html): view various statistics of the database
- [pgrowlocks](https://www.postgresql.org/docs/current/pgrowlocks.html): show row locking information for a specified table
- [unaccent](https://www.postgresql.org/docs/current/unaccent.html): remove accents and diacritics from words
- [tablefunc](https://www.postgresql.org/docs/current/tablefunc.html): crosstab and random normal distribution
- [hstore](https://www.postgresql.org/docs/current/hstore.html): store key/value pairs on a column
- [fuzzystrmatch](https://www.postgresql.org/docs/current/fuzzystrmatch.html): provides fuzzy string matching and distance based string search
- [tsm_system_rows](https://www.postgresql.org/docs/current/tsm-system-rows.html): allows the `TABLESAMPLE` select clause to return a specific amount of rows

## Custom functions

### ULID date matching

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

### Check if a give timestamp is from a day

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

### Compact conditional

Basically a CASE statement/expression but condensed into a single function

```sql
SELECT iif(true, 'EQUAL', 'NOT EQUAL'); -- This will return 'EQUAL'
```

```sql
SELECT iif(false, 'EQUAL'); -- This will return NULL, note that the else condition that would return NULL is omitted
```
