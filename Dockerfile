FROM ruby:3.1.3

WORKDIR /app

RUN gem install bundler

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . .

# RUN chmod +x run_config.sh

# ENTRYPOINT [ "ruby", "config.rb" ]