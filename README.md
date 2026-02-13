# tov
Convert JSON, YAML, TOML or XML into **V structs**.

No UI.

No magic.

Just **structs**.

---

## Build

```bash
git clone https://github.com/seu-usuario/tov.git
cd tov
v -prod -cflags "-s" .
```

----------

## Usage

```bash
tov -f input.json -o output.v
cat input.json | tov -o output.v
tov -t yaml < input.yaml
```

----------

## Flags
| Flag | Description |
| --- | --- |
| -f | --file input file (defaults to stdin) |
| -o |  --output output file (defaults to stdout) | 
| -t | --type json \| yaml \| toml \| xml (auto-detect if omitted) | 

----------

## Example
```json
{
  "name": "John",
  "age": 30,
  "active": true
}

```

↓

```v
struct Root {
    name   string
    age    int
    active bool
}

```

----------

## Roadmap

- [x] CLI

- [ ]  JSON

- [ ]  XML

- [ ]  YAML

- [ ]  TOML

- [ ]  CONF (maybe?)

----------

## Contributing

[Contribution guide](CONTRIBUTING.md)

----------

## Licence

[Apache-2.0](LICENSE)
