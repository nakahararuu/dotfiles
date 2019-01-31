FROM linuxbrew/linuxbrew

WORKDIR /workspace

# install packages
RUN brew update
RUN brew install git vim tmux fish 
RUN brew install docker-completion docker-compose-completion gradle-completion 
RUN brew install wget curl gron parallel
# RUN brew install docker docker-compose 
# RUN brew install python@2 jsawk mikutter

# install .tmux.conf
RUN cd && git clone https://github.com/gpakosz/.tmux.git && ln -s -f .tmux/.tmux.conf && cp .tmux/.tmux.conf.local .

# TODO git config
# TODO ssh config with lastpass
# TODO vim framework

ENTRYPOINT ["fish"]
# TODO fish_update_completions
# TODO vi mode

# TODO remove dependence of Docker
