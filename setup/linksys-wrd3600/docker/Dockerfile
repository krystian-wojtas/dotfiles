FROM ubuntu:18.04

RUN set -ex;                                                                   \
    apt-get update;                                                            \
    apt-get install -q -y --no-install-recommends                              \
	build-essential                                                        \
        ca-certificates                                                        \
	file                                                                   \
	gawk                                                                   \
	gettext                                                                \
	git                                                                    \
	gosu                                                                   \
	g++                                                                    \
	libncurses5-dev                                                        \
	libssl-dev                                                             \
	make                                                                   \
	man-db                                                                 \
	python                                                                 \
	rsync                                                                  \
	subversion                                                             \
	sudo                                                                   \
	time                                                                   \
	unzip                                                                  \
        wget                                                                   \
	zip                                                                    \
        zlib1g-dev

COPY entrypoint.sh /usr/local/bin/

ENTRYPOINT ["bash", "/usr/local/bin/entrypoint.sh"]
CMD ["/bin/bash"]
