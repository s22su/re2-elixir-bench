FROM elixir:1.13-alpine

RUN apk add --no-cache bash git make build-base re2 && \
  mix local.hex --force && \
  mix local.rebar --force

WORKDIR /app/build

COPY . .

RUN mix deps.get && mix release

RUN mv /app/build/_build/dev/rel/r2_elixir_bench /app/r2_elixir_bench && \
  rm -rf /app/build

WORKDIR /app/r2_elixir_bench

# ./bin/r2_elixir_bench eval "R2ElixirBench.Benchmark.call()"
ENTRYPOINT bash
