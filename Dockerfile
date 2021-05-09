FROM jekyll/jekyll:4 AS builder
COPY . .
RUN jekyll clean \
    && jekyll build \
    && mv _site /html

FROM nginx:1.16-alpine
COPY --from=builder /html /usr/share/nginx/html
EXPOSE 80