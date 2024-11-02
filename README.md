# go-mail-sender-api

Simple e-mail send backend api for internal use.

## setup

### install

```
go mod download
go mod tidy
```

### set env

```
cp .env.example .env
```

### run

```
go run cmd/api/main.go
```

### build and run

```
# ビルド
go build -o bin/api cmd/api/main.go

# 実行
./bin/api
```
