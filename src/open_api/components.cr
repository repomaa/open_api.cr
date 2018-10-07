require "json"
require "yaml"

require "./object"
require "./schema"
require "./reference"
require "./response"
require "./parameter"
require "./example"
require "./request_body"
require "./header"
require "./link"
require "./path_item"
require "./security_scheme"

module OpenAPI
  struct Components
    include Object

    field schemas : Hash(Symbol, Schema | Reference) = Hash(Symbol, Schema | Reference).new
    field responses : Hash(Symbol, Response | Reference) = Hash(Symbol, Response | Reference).new
    field parameters : Hash(Symbol, Parameter | Reference) = Hash(Symbol, Parameter | Reference).new
    field examples : Hash(Symbol, Example | Reference) = Hash(Symbol, Example | Reference).new
    field request_bodies : Hash(Symbol, RequestBody | Reference) = Hash(Symbol, RequestBody | Reference).new
    field headers : Hash(Symbol, Header | Reference) = Hash(Symbol, Header | Reference).new
    field security_schemes : Hash(Symbol, SecurityScheme | Reference) = Hash(Symbol, SecurityScheme | Reference).new
    field links : Hash(Symbol, Link | Reference) = Hash(Symbol, Link | Reference).new
    field callbacks : Hash(Symbol, Hash(String, PathItem) | Reference) = Hash(Symbol, Hash(String, PathItem) | Reference).new
  end
end
