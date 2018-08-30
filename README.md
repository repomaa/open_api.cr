# OpenAPI

Aims at providing a complete more or less type safe mapping of
[OpenAPI](https://github.com/OAI/OpenAPI-Specification) specification. Currently
supported version: 3.0.1. Use it to either write or parse OpenAPI specs.

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  open_api:
    github: jreinert/open_api.cr
```

## Usage

### Writing specs

```crystal
require "open_api"

OpenAPI.build do |api|
  doc = api.document(
    openapi: "3.0.1"
    info: {
      title: "Catlib",
      version: "0.1"
    },
    paths: {
      "/meow" => api.path_item(
        get: {
          tags: ["cats"],
          request_body: {
            ref: "#/components/schemas/cat"
          }
        }
      )
    },
    components: {
      schemas: {
        :cat => api.schema(
          type: "object",
          description: "A cat"
        )
      }
    }
  )

  puts doc.to_json
)
```

### Parsing specs

```crystal
require "open_api"

File.open("openapi.yml") do |file|
  doc = OpenAPI.from_yaml(file)
  puts doc.to_json
end
```

## Contributing

1. Fork it (<https://github.com/jreinert/open_api.cr/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [jreinert](https://github.com/jreinert) Joakim Reinert - creator, maintainer
