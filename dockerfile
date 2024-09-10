FROM ruby:3.2.1

RUN apt-get update -qq && apt-get install -y \
  nodejs \
  yarn \
  postgresql-client \
  build-essential \
  libpq-dev

WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

RUN bundle install

COPY . /app

ENV RAILS_ENV=development
ENV RACK_ENV=development
ENV PORT 5000

EXPOSE ${PORT}

CMD ["rails", "server", "-b", "0.0.0.0"]
