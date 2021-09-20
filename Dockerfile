FROM ubuntu:latest
WORKDIR /root
RUN apt-get update > /dev/null
RUN apt-get install sudo > /dev/null
RUN apt-get install acl -y > /dev/null
RUN apt-get install members > /dev/null
RUN apt-get install -y wget > /dev/null

#Copying commands aliasing files into root directory of container
COPY generalCommands.sh /root/generalCommands.sh
RUN chmod +rwx /root/generalCommands.sh

COPY headCommands.sh /root/headCommands.sh
RUN chmod +rwx /root/headCommands.sh

#Copying all the scripts into root directory of container
COPY genUser.sh /root/genUser.sh
RUN chmod +rwx /root/genUser.sh

COPY permit.sh /root/permit.sh
RUN chmod +rwx /root/permit.sh

COPY schedule.sh /root/schedule.sh
RUN chmod +rwx /root/schedule.sh

COPY attendance.sh /root/attendance.sh
RUN chmod +rwx /root/attendance.sh

COPY genMom.sh /root/genMom.sh
RUN chmod +rwx /root/genMom.sh

COPY getMom.sh /root/getMom.sh
RUN chmod +rwx /root/getMom.sh
