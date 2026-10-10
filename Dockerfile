FROM debian:trixie-slim

ENV DEBIAN_FRONTEND=noninteractive
WORKDIR /app

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       ca-certificates cmake g++ make libdrogon-dev libjsoncpp-dev libcurl4-openssl-dev libpq-dev \
    && rm -rf /var/lib/apt/lists/*

COPY . .
RUN cmake -S . -B build -DCMAKE_BUILD_TYPE=Release \
    && cmake --build build --parallel 2

EXPOSE 8080
CMD ["./build/LokeshMart"]
