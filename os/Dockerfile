FROM ubuntu:22.04

#ENV username : "user"
WORKDIR /home

COPY . .
ARG user="alma"

ENV user=$user
# those 2 work

# get update and upgrade 
#RUN ["apt","update"]
#RUN ["apt","upgrade"]

# getting devices drivers and outputting it (to exploit it later) in drivert.txt file
#RUN ["ubuntu-drivers","devices",">>","drivers.txt"]


CMD ["/bin/bash","./script.sh"]
#CMD ["/bin/bash"]

#CMD ["echo",username]
#CMD ["ADD", "user",username]
# find drivers

# create user

#CMD ["ls","~"]

