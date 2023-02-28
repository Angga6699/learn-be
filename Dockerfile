FROM golang:1.16.7 AS staging
WORKDIR /usr/src/app
COPY . .

FROM golang:1.16.7 AS production
WORKDIR /usr/src/app
COPY --from=staging /usr/src/app /usr/src/app/
EXPOSE 5000
CMD ["go", "run", "main.go"]
