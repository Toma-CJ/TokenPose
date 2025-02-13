# base image
FROM python:3.10.16-bookworm

# get deb utils, pip, setup tools, wget and curl
RUN apt-get -y update && apt-get install -y --no-install-recommends build-essential curl wget \
&& pip install --upgrade pip setuptools \
&& rm -rf /var/lib/apt/lists/*

# set working directory
WORKDIR /app

# copy files into image
COPY . .

# install requirements
RUN pip install -r requirements.txt  

# Set the default command to run bash
CMD ["bash"]