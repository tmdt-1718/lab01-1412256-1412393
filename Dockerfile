FROM ruby:2.3.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /myblog
WORKDIR /myblog
ADD Gemfile /myblog/Gemfile
ADD Gemfile.lock /myblog/Gemfile.lock
RUN bundle install
ADD . /myblog