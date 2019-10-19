APP_NAME ?= `grep 'app:' mix.exs | sed -e 's/\[//g' -e 's/ //g' -e 's/app://' -e 's/[:,]//g'`
APP_VSN ?= `grep 'version:' mix.exs | cut -d '"' -f2`
BUILD ?= `git rev-parse --short HEAD`

build:
	mix do deps.get, compile
run:
	iex -S mix phx.server
start:
	make build
	make run
check:
	mix check --except dialyzer
test:
	mix test --cover
deps.update:
	mix deps.clean --unused --unlock && mix deps.get && mix deps.compile