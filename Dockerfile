FROM resin/armv7hf-node

RUN echo "Hi"
RUN apt-get update && apt-get install -y time curl

RUN time apt-get install -y alsa-utils libasound2-dev

RUN mkdir /app
COPY . /app/

RUN cd /app && time npm install

# Measure time for fetching a repo from git
RUN time curl -L https://github.com/raspberrypi/linux/archive/rpi-3.18.y.tar.gz > linux.tar.gz

RUN chmod +x /app/start

CMD cd /app && ./start
