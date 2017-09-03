FROM gcc:7.2

COPY entrypoint.sh /
COPY build.sh /project/build

RUN apt-get update && apt-get install -y cmake

ENTRYPOINT ["/entrypoint.sh"]
