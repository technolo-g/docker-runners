# Let's use alpine for simplicity. We could make it smaller
# by dowloading the tarball and adding to scratch with a multi-stage
FROM alpine
WORKDIR /workspace

# Install yarn which should pull in node as a dependency
RUN apk add --update yarn

# We will configure the cache to use our volume mounted workspace
RUN yarn config set cache-folder /workspace/.yarn-cache

# Using an entrypoint allows us to pass in any args we need
ENTRYPOINT ["yarn"]
