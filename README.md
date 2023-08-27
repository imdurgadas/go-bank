# Bank application using Go

### Install go-migrate

```
wget https://github.com/golang-migrate/migrate/releases/download/v4.16.2/migrate.linux-amd64.tar.gz | tar xvf
tar -xvf migrate.linux-amd64.tar.gz
rm -rf LICENSE migrate.linux-amd64.tar.gz README.md
chmod 777 migrate
 mv migrate /usr/local/bin/migrate
sudo mv migrate /usr/local/bin/migrate

```

### Install sqlc

`go install github.com/sqlc-dev/sqlc/cmd/sqlc@latest`

### Migrations

### Generate Migration

```
migrate create -ext sql -dir db/migrations -seq init_schema
```

### Run Migration

```
migrate -path db/migrations -database "postgresql://root:secret@localhost:5432/bank?sslmode=disable" -verbose up
```