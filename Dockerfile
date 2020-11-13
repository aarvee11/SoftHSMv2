FROM centos:7.7.1908

COPY softhsm-app/ /
RUN ls -la /*

WORKDIR /
RUN yum -y update && \
    yum -y install automake autoconf libtool \
        libtool-ltdl-devel pkg-config \
        openssl-devel gcc-c++ make
RUN sh autogen.sh
RUN ./configure
RUN make && make install