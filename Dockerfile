FROM linuxbrew/linuxbrew

# working dir
WORKDIR /workspace
RUN sudo chown linuxbrew /workspace

# install packages
RUN brew update
RUN brew install git vim tmux wget curl gron parallel docker docker-compose fish

# tmux conf
RUN cd && git clone https://github.com/gpakosz/.tmux.git && ln -s -f .tmux/.tmux.conf && cp .tmux/.tmux.conf.local .
# TODO change default shell to fish

# git conf
RUN git config --global user.name nakahararuu
RUN git config --global user.email repika02@gmail.com

# vim conf
RUN curl -sLf https://spacevim.org/install.sh | bash

# fish conf
RUN git clone https://github.com/oh-my-fish/oh-my-fish && cd oh-my-fish && bin/install --offline --noninteractive
RUN mkdir -p /home/linuxbrew/.config/fish
RUN echo fish_vi_key_bindings >> /home/linuxbrew/.config/fish/config.fish

# TODO ssh config via lastpass

ENTRYPOINT ["fish"]
# TODO remove dependence of Docker
