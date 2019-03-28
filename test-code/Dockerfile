FROM ubuntu:latest
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y \ 
	python-setuptools \
	python-dev \
	build-essential \
	curl \
	vim \
	wget \
	mlocate \
	zip \
	bash-completion
RUN rm -rf /var/lib/apt/lists/*
RUN curl -O https://bootstrap.pypa.io/get-pip.py && python get-pip.py --user
ENV PATH=/root/.local/bin/:$PATH
RUN pip install awscli --upgrade --user
#RUN complete -C aws_completer aws
RUN export PATH=/usr/local/aws/bin:$PATH
ENV PS1="[\u@\h \W]\$ "
RUN wget https://releases.hashicorp.com/terraform/0.11.7/terraform_0.11.7_linux_amd64.zip > /dev/null && unzip terraform_0.11.7_linux_amd64.zip && mv terraform /usr/bin/
# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

CMD ["tail", "-f", "/dev/null"]
