FROM ubuntu:rolling

#SHELL [ "/bin/bash", "--login", "-c" ]

RUN apt-get -qq update && \
	apt-get -qq -y install curl bzip2 git vim && \
    apt-get -qq -y autoremove && \
    apt-get autoclean && \
    curl -sSL https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -o /tmp/miniconda.sh && \
    bash /tmp/miniconda.sh -bfp /usr/local && \
    rm -rf /tmp/miniconda.sh && \
    conda install -y python=3 && \
    conda update conda && \
    #apt-get -qq -y remove curl bzip2 && \
    conda clean --all --yes
    #&& rm -rf /var/lib/apt/lists/* /var/log/dpkg.log \

# Create a non-root user
ARG username=cconde
ARG uid=1000
ARG gid=1001
ENV USER $username
ENV UID $uid
ENV GID $gid
ENV HOME /home/$USER
RUN adduser --disabled-password \
    --uid $UID \
    --home $HOME \
    $USER

ADD .profile .bashrc .vimrc $HOME/
RUN chown $UID:$GID $HOME/.profile $HOME/.bashrc $HOME/.vimrc

USER $USER

# install miniconda
#ENV CONDA_DIR $HOME/miniconda3
RUN git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim && \
	conda config --add channels defaults && \
	conda config --add channels conda-forge && \
	conda config --add channels bioconda && \
	conda init bash
#	curl -sSL https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -o ~/miniconda.sh && \
#    chmod +x ~/miniconda.sh && \
#    ~/miniconda.sh -b -p $CONDA_DIR && \
#    rm ~/miniconda.sh

# make non-activate conda commands available
#ENV PATH=$CONDA_DIR/bin:$PATH
# make conda activate command available from /bin/bash --login shells && \
# make conda activate command available from /bin/bash --interative shells
#RUN echo ". $CONDA_DIR/etc/profile.d/conda.sh" >> ~/.profile && \
#	conda init bash && \
#	conda install -y python=3 && \
#	conda update conda && \
#	conda clean --all --yes && \

# create a project directory inside user home
ENV PROJECT_DIR $HOME/work
RUN mkdir $PROJECT_DIR
WORKDIR $PROJECT_DIR

#ENV PATH /opt/conda/bin:$PATH
ENV TERM xterm-256color

#CMD ["/bin/bash"]

#Run as daemon
# docker run -d -it --restart always -v /home/cconde/Docker/conda:/home/cconde/work --name conda conda bash

#SSHFS access in the container
# Requires the following steps:
#	uncomment user_allow_other in /etc/fuse.conf
#	unmount the FUSE filesystem
#	remount the FUSE filesystem with sshfs -o allow_other user@.... (making sure to include the -o allow_other option)
#	try starting the container again

#Enter the container
# docker attach conda -> restart the container when you leave it
# 	OR
# docker exec -it conda bash -> run always
