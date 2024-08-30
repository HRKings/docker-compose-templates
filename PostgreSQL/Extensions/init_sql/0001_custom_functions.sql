-- Easy filtering for ULIDs using dates
CREATE OR REPLACE FUNCTION get_ulid_from_timestamp_day(DATE)
RETURNS ulid AS $$
  SELECT $1::timestamp::ulid
$$ LANGUAGE SQL IMMUTABLE PARALLEL SAFE;
COMMENT ON FUNCTION get_ulid_from_timestamp_day IS 'This function returns a zeroed ULID generated only from the DATE part of the timestamp';

CREATE OR REPLACE FUNCTION is_ulid_within_day(ulid, DATE)
RETURNS bool AS $$
  SELECT $1 >= get_ulid_from_timestamp_day($2)
    AND $1 <= get_ulid_from_timestamp_day(($2 + INTERVAL '1 day')::DATE)
$$ LANGUAGE SQL IMMUTABLE PARALLEL SAFE;
COMMENT ON FUNCTION is_ulid_within_day IS 'This function checks if a given ULID timestamp DATE part is the same of the provided timestamp';

-- Easy filter of timestamps by one day
CREATE OR REPLACE FUNCTION is_timestamp_within_day(TIMESTAMP WITHOUT TIME ZONE, DATE)
RETURNS bool AS $$
  SELECT $1 >= $2
    AND $1 < ($2 + INTERVAL '1 day')
$$ LANGUAGE SQL IMMUTABLE PARALLEL SAFE;
COMMENT ON FUNCTION is_timestamp_within_day(TIMESTAMP WITHOUT TIME ZONE, DATE) IS 'This function checks if a given timestamp DATE part is the same of the provided timestamp';

CREATE OR REPLACE FUNCTION is_timestamp_within_day(TIMESTAMP WITH TIME ZONE, DATE)
RETURNS bool AS $$
  SELECT $1 >= $2
    AND $1 < ($2 + INTERVAL '1 day')
$$ LANGUAGE SQL IMMUTABLE PARALLEL SAFE;
COMMENT ON FUNCTION is_timestamp_within_day(TIMESTAMP WITH TIME ZONE, DATE) IS 'This function checks if a given timestamp DATE part is the same of the provided timestamp';

-- Easy filter of timestamps by interval
CREATE OR REPLACE FUNCTION is_timestamp_within_interval(TIMESTAMP WITHOUT TIME ZONE, TIMESTAMP WITHOUT TIME ZONE, INTERVAL)
    RETURNS bool AS
$$
SELECT $1 >= $2
    AND $1 < ($2 + $3);
$$ LANGUAGE SQL IMMUTABLE PARALLEL SAFE;
COMMENT ON FUNCTION is_timestamp_within_interval(TIMESTAMP WITHOUT TIME ZONE, TIMESTAMP WITHOUT TIME ZONE, INTERVAL) IS 'This function checks if a given timestamp is within the interval starting on provided timestamp';

CREATE OR REPLACE FUNCTION is_timestamp_within_interval(TIMESTAMP WITH TIME ZONE, TIMESTAMP WITH TIME ZONE, INTERVAL)
    RETURNS bool AS
$$
SELECT $1 >= $2
    AND $1 < ($2 + $3);
$$ LANGUAGE SQL IMMUTABLE PARALLEL SAFE;
COMMENT ON FUNCTION is_timestamp_within_interval(TIMESTAMP WITH TIME ZONE, TIMESTAMP WITH TIME ZONE, INTERVAL) IS 'This function checks if a given timestamp is within the interval starting on provided timestamp';
