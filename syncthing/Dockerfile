FROM alpine:3.12 as buildstage

# build variables
ARG SYNCTHING_RELEASE

RUN \
 echo "**** install build packages ****" && \
 apk add --no-cache \
	curl \
	g++ \
	gcc \
	git \
	go \
	tar

RUN \
echo "**** fetch source code ****" && \
 if [ -z ${SYNCTHING_RELEASE+x} ]; then \
	SYNCTHING_RELEASE=$(curl -sX GET "https://api.github.com/repos/syncthing/syncthing/releases/latest" \
	| awk '/tag_name/{print $4;exit}' FS='[""]'); \
 fi && \
 mkdir -p \
	/tmp/sync && \
 curl -o \
 /tmp/syncthing-src.tar.gz -L \
	"https://github.com/syncthing/syncthing/archive/${SYNCTHING_RELEASE}.tar.gz" && \
 tar xf \
 /tmp/syncthing-src.tar.gz -C \
	/tmp/sync --strip-components=1 && \
 echo "**** compile syncthing  ****" && \
 cd /tmp/sync && \
 rm -f go.sum && \
 go clean -modcache && \
 CGO_ENABLED=0 go run build.go \
	-no-upgrade \
	-version=${SYNCTHING_RELEASE} \
	build syncthing

############## runtime stage ##############
FROM playn/alpine

# environment settings
ENV PUID=1000 PGID=1000 HOME=/var/syncthing
RUN apk add --no-cache ca-certificates su-exec

# copy files from build stage and local files
COPY --from=buildstage /tmp/sync/syncthing /bin/syncthing
COPY --from=buildstage /tmp/sync/script/docker-entrypoint.sh /bin/entrypoint.sh

# ports and volumes
EXPOSE 8384 22000 21027/UDP
VOLUME ["/var/syncthing"]

HEALTHCHECK --interval=1m --timeout=10s \
  CMD nc -z 127.0.0.1 8384 || exit 1

ENTRYPOINT ["/bin/entrypoint.sh", "/bin/syncthing", "-home", "/var/syncthing/config"]
