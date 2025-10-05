-- migrate:up
CREATE TABLE testing (
  id UUID PRIMARY KEY DEFAULT uuidv7(),
  wow TEXT
);

-- migrate:down
DROP TABLE testing;
