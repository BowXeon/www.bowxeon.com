FROM jekyll/jekyll:4 AS builder
COPY . .
RUN sed -i 's/# EXCLUDE_IN_DOCKER//' _config.yml \
    && sed -i '/# EXCLUDE_IN_GITEE_PAGES/d' _config.yml \
    && copy_year=$(date | awk '{print $NF}') \
    && sed -i "s/COPYRIGHT_YEAR/$copy_year/" _config.yml \
    && echo "---" > index.md \
    && echo "layout: default" >> index.md \
    && echo "title: {{ site.slogan }}" >> index.md \
    && echo "sitemap: false" >> index.md \
    && echo "---" >> index.md \
    && echo "" >> index.md \
    && echo "{% include portal.html %}" >> index.md \
    && jekyll clean \
    && jekyll build \
    && mv _site /html

FROM nginx:1.16-alpine
COPY --from=builder /html /usr/share/nginx/html
EXPOSE 80
