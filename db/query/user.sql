-- name: GetUser :one
SELECT * FROM users
WHERE email = $1 LIMIT 1;

-- name: CreateUser :one
INSERT INTO users (
  email, password, full_name
) VALUES (
  $1, $2, $3
)
RETURNING *;

-- name: UpdateUser :exec
UPDATE users
  set 
  full_name = $2,
  birthday = $3,
  phone_number = $4
WHERE email = $1;

-- name: UpdatePassword :exec
UPDATE users
set
password = $2
WHERE email = $1;

-- name: DeleteUser :exec
DELETE FROM users
WHERE email = $1;