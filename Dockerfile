FROM golang as build
WORKDIR /src
COPY src .
RUN CGO_ENABLED=0 GOOS=linux go build -o app

FROM scratch
ADD ./html /html
COPY --from=build /src/app .
ENTRYPOINT [ "/app" ]
EXPOSE 8080
