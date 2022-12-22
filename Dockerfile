FROM jekyll/jekyll:4 AS builder
COPY . .
RUN mv gitee_pages/_config.yml _config.yml \
    && sed -i 's/#DOCKER//' _config.yml \
    && copy_year=$(date | awk '{print $NF}') \
    && sed -i "s/COPYRIGHT_YEAR/$copy_year/" _config.yml \
    && mkdir assets \
    && jekyll clean \
    && jekyll build \
    && mv _site /html

FROM nginx:1.16-alpine
COPY --from=builder /html /usr/share/nginx/html
EXPOSE 80
