BINARY := open-authentication
PKG := ./...

.PHONY: build run test fmt vet tidy clean

build:
	CGO_ENABLED=0 go build -trimpath -ldflags="-s -w" -o bin/%(BINARY) ./cmd/$(BINARY)

run:
	go run ./cmd/$(BINARY)

test:
	go test -race -count=1 $(PKG)

fmt: 
	@out="$$(gofmt -l .)"; if [ -n "$$out" ]; then echo "$$out"; echo "run: gofmt -w ."; exit 1; fi

vet:
	go vet $(PKG)

tidy:
	go mod tidy

clean:
	rm -rf bin coverage.out
