postgres:
	docker run --name pgsql -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres:15-alpine

createdb:
	docker exec -it pgsql createdb --username=root --owner=root bank

dropdb:
	docker exec -it pgsql dropdb bank

migrate:
	migrate -path db/migrations -database "postgresql://root:secret@localhost:5432/bank?sslmode=disable" -verbose up

migrate_down:
	migrate -path db/migrations -database "postgresql://root:secret@localhost:5432/bank?sslmode=disable" -verbose down


stop:
	docker stop pgsql

remove:
	docker rm pgsql

sqlc:
	sqlc generate

test:
	go test -v -cover ./...
	
.PHONY: postgres createdb  migrate sqlc migrate_down dropdb