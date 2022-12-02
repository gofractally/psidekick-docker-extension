FROM ubuntu:20.04

# Prettify terminal, git completion
ENV SHELL /bin/bash
SHELL ["/bin/bash", "-c"]
RUN echo $'\n\
parse_git_branch() {\n\
  git branch 2> /dev/null | sed -e "/^[^*]/d" -e "s/* \\(.*\\)/ (\\1)/"\n\
} \n\
export PS1="\u@\h \W\[\\033[32m\\]\\$(parse_git_branch)\\[\\033[00m\\] $ "\n\
if [ -f ~/.git-completion.bash ]; then\n\
  . ~/.git-completion.bash\n\
fi\n\
 \n\
alias ll="ls -alF"\n\
alias ls="ls --color=auto"\n\
' >> /root/.bashrc

RUN mkdir -p \
    /root/deps \
    /root/projects

# Install deps
RUN export DEBIAN_FRONTEND=noninteractive   \
    && apt-get update                       \
    && apt-get install -yq                  \
        curl                                \
        gnupg                               \
        wget                                \
        xz-utils                            \
    && apt-get clean -yq                    \
    && rm -rf /var/lib/apt/lists/*

# Wasi & psidk
WORKDIR /root/deps
RUN wget https://github.com/WebAssembly/wasi-sdk/releases/download/wasi-sdk-14/wasi-sdk-14.0-linux.tar.gz \
    && tar xf wasi-sdk-14.0-linux.tar.gz \
    && rm wasi-sdk-14.0-linux.tar.gz     \
    && wget https://github.com/gofractally/psibase/releases/download/rolling-release/psidk-linux.tar.gz \
    && tar xf psidk-linux.tar.gz         \
    && rm psidk-linux.tar.gz
ENV WASI_SDK_PREFIX=/root/deps/wasi-sdk-14.0

# Node
ARG NODEVERSION="v16.17.0"
ENV PATH=/opt/node-${NODEVERSION}-linux-x64/bin:$PATH
WORKDIR /opt
RUN curl -LO https://nodejs.org/dist/${NODEVERSION}/node-${NODEVERSION}-linux-x64.tar.xz \
    && tar xf node-${NODEVERSION}-linux-x64.tar.xz \
    && rm node-${NODEVERSION}-linux-x64.tar.xz \
    && npm i -g yarn

# Install deps
WORKDIR /root
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN export DEBIAN_FRONTEND=noninteractive    \
    && apt-get update                        \
    && apt-get install -yq                   \
        binaryen                             \
        cmake                                \
        git                                  \
        yarn                                 \
    && apt-get clean -yq                     \
    && rm -rf /var/lib/apt/lists/*

# Add some tools
ADD app-generator /root/app-generator

# Update path
ENV PSIDK_PREFIX=/root/deps/psidk
ENV PATH=$PSIDK_PREFIX/bin:$WASI_SDK_PREFIX/bin:/root/app-generator/scripts:$PATH
