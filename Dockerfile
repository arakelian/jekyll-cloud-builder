FROM jekyll/jekyll:4.1.0

# when testing locally
EXPOSE 4000

# when Google Cloud Builder launches this container as part of a build, it will bind source project
# to the workspace folder
WORKDIR /workspace

# our entrypoint will bundle install
COPY docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT [ "docker-entrypoint.sh" ]

# by default we want to build
CMD [ "bundle", "exec", "jekyll", "build" ]
