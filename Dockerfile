FROM gcc:7.2

COPY entrypoint.sh /
COPY build.sh /project/build

RUN mkdir -p /tmp/cmake && cd /tmp/cmake
RUN wget https://cmake.org/files/v3.9/cmake-3.9.1.tar.gz && tar -xzvf cmake-3.9.1.tar.gz
RUN cd cmake-3.9.1/ && ./bootstrap && make install
RUN cd && rm -rf /tmp/cmake

ENTRYPOINT ["/entrypoint.sh"]
