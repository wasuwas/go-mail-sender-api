# ビルドステージ
FROM golang:1.21.3-alpine AS builder

WORKDIR /app

# 依存関係のコピーとダウンロード
COPY go.mod go.sum ./
RUN go mod download

# ソースコードのコピー
COPY . .

# アプリケーションのビルド
RUN CGO_ENABLED=0 GOOS=linux go build -o main ./cmd/api

# 実行ステージ
FROM alpine:latest

WORKDIR /app

# ビルドしたバイナリをコピー
COPY --from=builder /app/main .
COPY --from=builder /app/configs ./configs

# 必要なシステムパッケージのインストール
RUN apk --no-cache add ca-certificates tzdata

# タイムゾーンの設定
ENV TZ=Asia/Tokyo

EXPOSE 8080

CMD ["./main"]
