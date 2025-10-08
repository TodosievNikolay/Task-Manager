FROM ubuntu:22.04

RUN apt-get update && apt-get install -y g++

WORKDIR /app

COPY main.cpp .

RUN g++ main.cpp -o my_app

CMD ["./my_app"]
