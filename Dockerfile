FROM ubuntu:18.04 

RUN apt-get update && \
  apt-get install -y sudo wget gnupg2 

RUN wget -O - https://facebook.github.io/mcrouter/debrepo/bionic/PUBLIC.KEY | sudo apt-key add
RUN echo "deb https://facebook.github.io/mcrouter/debrepo/bionic bionic contrib" >> /etc/apt/sources.list

RUN apt-get update && \
  apt-get install -y mcrouter && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 11211

CMD ["/usr/bin/mcrouter"]



