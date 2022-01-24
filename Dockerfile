FROM imageflutterweb as builder

RUN mkdir /app/

COPY /jjtest /app/
COPY /.pub-cache /root/.pub-cache
WORKDIR /app/
RUN flutter build web

FROM nginx:1.21.1-alpine
COPY --from=builder /app/build/web /usr/share/nginx/html

# pub get on docker file and pub get on container again not work maybe pub get different place
# copy cache to container OK
# mount while run docker OK
# ln -s /home/jjchin/.pub-cache /home/jjchin/testaction/.pub-cache not work
# cp -r /home/jjchin/.pub-cache /home/jjchin/testaction
