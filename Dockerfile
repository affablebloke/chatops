from node:0.12.7-wheezy
RUN apt-get update \
    && apt-get install -y git libexpat1-dev
RUN groupadd -r hubot && useradd -r -g hubot hubot
RUN mkdir -p /home/hubot && chown hubot:hubot /home/hubot \
      && usermod -d /home/hubot hubot
RUN mkdir /hubot && cd /hubot && chown hubot:hubot /hubot
COPY . /hubot
WORKDIR /hubot
RUN npm install
CMD ["bin/hubot", "-a", "hipchat"]
