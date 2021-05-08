FROM jekyll/jekyll:4
COPY . .
RUN jekyll build
CMD jekyll serve
EXPOSE 4000