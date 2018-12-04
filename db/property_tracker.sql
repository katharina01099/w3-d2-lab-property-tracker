DROP TABLE IF EXISTS property_trackers;

CREATE TABLE property_trackers (
  id SERIAL4 PRIMARY KEY,
  adress VARCHAR(255),
  value INT2,
  no_bedrooms INT2,
  year INT2,
  square_footage INT2,
  build VARCHAR(255)
);
