FROM ruby:2.6.3

RUN mkdir /app
WORKDIR /app

# Install dependencies
COPY Gemfile .
COPY Gemfile.lock .
RUN bundle install
RUN rails db:migrate

# Copy application
COPY . .
