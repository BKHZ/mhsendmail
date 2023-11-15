VERSION=0.1.9

all: deps release

deps:
	go get github.com/spf13/pflag

release: release-deps
	gox -output="build/{{.Dir}}_{{.OS}}_{{.Arch}}" .

release-deps:
	go get github.com/mitchellh/gox

build_linux_arm64:
	GOOS=linux GOARCH=arm64 go build \
		-mod=readonly \
		-o dist/mhsendmail-linux-arm64 \
		.

.PNONY: all release release-deps
