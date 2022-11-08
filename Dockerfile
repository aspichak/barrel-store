FROM ruby:3.1.2

ARG USER=rails
ARG UID=1000
ARG GID=1000

RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
    && apt-get update \
    && apt-get install -y nodejs postgresql-client build-essential libvips \
    && rm -rf /var/lib/apt/lists/* \
    && gem update --system \
    && gem install foreman \
    && groupadd --non-unique --gid "$GID" "$USER" \
    && useradd --non-unique --shell /bin/bash --home-dir="/home/$USER" --uid "$UID" --gid "$GID" "$USER" \
    && mkdir -p /app /usr/local/bundle "/home/$USER" \
    && chown -R "$USER:$USER" /app /usr/local/bundle "/home/$USER"

USER $USER

WORKDIR /app

ARG ENVIRONMENT=production
ENV RAILS_ENV=$ENVIRONMENT
ENV RAILS_SERVE_STATIC_FILES=1

COPY --chown=$USER:$USER Gemfile Gemfile.lock /app/
RUN [ "$RAILS_ENV" = "production" ] && BUNDLE_WITHOUT="test development"; \
    bundle install

COPY --chown=$USER:$USER package.json package-lock.json /app/
RUN [ "$RAILS_ENV" = "production" ] && NODE_ENV="production" || NODE_ENV="development" \
    && HOME=/tmp npm install

COPY --chown=$USER:$USER ./ /app/

RUN chmod +x docker-entrypoint.sh \
    && [ "$RAILS_ENV" = "production" ] && SECRET_KEY_BASE=_ rails assets:precompile || :

EXPOSE 3000

ENTRYPOINT ["./docker-entrypoint.sh"]
