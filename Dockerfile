FROM ruby:3.0.2

RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
    && apt-get update \
    && apt-get install -y nodejs postgresql-client build-essential \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && gem update --system \
    && gem install foreman

WORKDIR /app

COPY Gemfile* /app/
RUN bundle install

COPY package*.json /app/
RUN npm install

COPY . /app
RUN vite build

ENV RAILS_ENV=production
ENV RAILS_SERVE_STATIC_FILES=1

CMD ["rails", "s"]