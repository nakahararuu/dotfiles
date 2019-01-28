FROM linuxbrew/linuxbrew

WORKDIR /workspace

# install packages
RUN brew update
RUN brew install git vim tmux fish docker-completion docker-compose-completion gradle-completion docker docker-compose wget curl gron parallel
# TODO python@2 jsawk mikutter

# install .tmux.conf
RUN cd && git clone https://github.com/gpakosz/.tmux.git && ln -s -f .tmux/.tmux.conf && cp .tmux/.tmux.conf.local .

# TODO git config
COPY git /home/linuxbrew/.git

# TODO ssh config with lastpass
COPY ssh /home/linuxbrew/.ssh

# TODO vim framework

ENTRYPOINT ["fish"]
# TODO fish_update_completions
# TODO vi mode

# TODO remove dependence of Docker
