DROP TABLE transactions;
DROP TABLE merchants;
DROP TABLE users;

CREATE TABLE users(
  id SERIAL4 primary key,
  user_name VARCHAR(255),
  funds INT
);

CREATE TABLE merchants(
  id SERIAL4 primary key,
  merchant_name VARCHAR(255),
  category VARCHAR(255)
);

CREATE TABLE transactions(
  id SERIAL4 primary key,
  transaction_time TIMESTAMP,
  amount INT,
  user_id INT REFERENCES users(id) ON DELETE CASCADE,
  merchant_id INT REFERENCES merchants(id) ON DELETE CASCADE
);
