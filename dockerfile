FROM ruby:2.3.1-alpine
RUN apk add --update build-base
RUN mkdir /app
WORKDIR /app

COPY Gemfile* /app/
RUN bundle install

COPY . /app/

CMD ["ruby", "app.rb"]
