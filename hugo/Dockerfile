FROM golang
ENV BUILDROOT /go/src/github.com/gohugoio/hugo
ENV HUGO_VERSION v0.48

# Install mage and hugo as per the Hugo docs here:
# https://gohugo.io/getting-started/installing/#fetch-from-github
RUN go get github.com/magefile/mage \
    && go get -d github.com/gohugoio/hugo

# Vendor and build the static binary, stripping debug info
RUN cd ${BUILDROOT} \
    && git checkout ${HUGO_VERSION:-master} \
    && mage vendor \
    && CGO_ENABLED=0 GOOS=linux go build -ldflags="-s -w" -o hugo

# Create the image with only our binary
FROM scratch
COPY --from=0 /go/src/github.com/gohugoio/hugo/hugo /hugo
ENTRYPOINT ["/hugo"]
