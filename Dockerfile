FROM debian
MAINTAINER thomas steinbach aikq de

RUN apt-get update && apt-get install -y wget && apt-get clean
RUN mkdir /pmmp
WORKDIR /pmmp

ADD https://get.pmmp.io install.sh
RUN chmod +x install.sh

RUN useradd pmmp
RUN chown -R pmmp:pmmp /pmmp
USER pmmp

ADD start-docker.sh /usr/local/bin/start-docker.sh

CMD ["/usr/local/bin/start-docker.sh"]
