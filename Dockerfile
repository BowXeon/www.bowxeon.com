FROM jekyll/jekyll:4
COPY . .
CMD jekyll serve
EXPOSE 4000