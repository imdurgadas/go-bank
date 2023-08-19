# Bank application using Go

# Migrations

### Generate Migration

```
migrate create -ext sql -dir db/migrations -seq init_schema
```

### Run Migration

```
migrate -path db/migrations -database "postgresql://root:secret@localhost:5432/bank?sslmode=disable" -verbose up
```