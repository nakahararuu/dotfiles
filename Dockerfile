FROM linuxbrew/linuxbrew

WORKDIR /workspace

# install packages
RUN brew update
RUN brew install git vim tmux wget curl gron parallel docker docker-compose fish 

# install .tmux.conf
RUN cd && git clone https://github.com/gpakosz/.tmux.git && ln -s -f .tmux/.tmux.conf && cp .tmux/.tmux.conf.local .

# TODO git config
# TODO ssh config with lastpass
# TODO vim framework

ENTRYPOINT ["fish"]
# TODO fish_update_completions
# TODO vi mode

# TODO remove dependence of Docker
