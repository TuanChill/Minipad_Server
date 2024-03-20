postgre:
	docker run --name minipad -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=admin -d postgres

createdb:
	docker exec -it minipad createdb --username=root --owner=root minipad

dropdb:
	docker exec -it minipad dropdb minipad

migrateup:
	migrate -path db/migration -database "postgresql://root:admin@localhost:5432/minipad?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgresql://root:admin@localhost:5432/minipad?sslmode=disable" -verbose down

sqlcinit:
	sqlc init

sqlcgen:
	sqlc generate

test:
	go test -v cover ./...

.PHONY:  postgre createdb dropdb migrateup migratedown sqlcinit sqlcgen