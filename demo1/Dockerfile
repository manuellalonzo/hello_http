FROM debian 
RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y install gcc
RUN apt-get -y install git
RUN apt-get -y install bash

ADD dummy_serv.c /home
WORKDIR /home
RUN gcc -o dummyserv dummy_serv.c

EXPOSE 12344 

ENTRYPOINT ["/home/dummyserv"]
#CMD ["/bin/bash", "-c" ,"git --version && python3.7 --version && ./dummyserv"]
#CMD ["./dummyserv"]
#CMD ["./dummyserv","-D","FOREGROUND"] 



