# termsize

[![Build Status](https://travis-ci.org/sotojuan/termsize.svg?branch=master)](https://travis-ci.org/sotojuan/termsize)

> Reliably get the terminal window size

## Install

In your `mix.exs`:

```elixir
defp deps do
  [
    { :termsize, "~> 1.0.1" }
  ]
end
```

Then run `mix deps.get`.

## Usage

Make sure you add `termsize` to your applications:

```elixir
def application do
  [applications: [:logger, :termsize]]
end
```

```elixir
IO.puts TermSize.get # {151, 32}

{cols, rows} = TermSize.get
IO.puts cols # 151
IO.puts rows # 32
```

## License

MIT © [Juan Soto](http://juansoto.me)
