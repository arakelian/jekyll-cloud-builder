FROM jekyll/jekyll:4.1.0

# the Jekyll docker image changes commands to be run as jekyll user; this is supposed to increase
# security but causes all kinds of permission issues. we solve this by adding jekyll to root group
RUN usermod -a -G root jekyll

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
