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

module OpenAPI
  struct Components
    include Object

    field schemas : Hash(Symbol, Schema | Reference)?
    field responses : Hash(Symbol, Response | Reference)?
    field parameters : Hash(Symbol, Parameter | Reference)?
    field examples : Hash(Symbol, Example | Reference)?
    field request_bodies : Hash(Symbol, RequestBody | Reference)?
    field headers : Hash(Symbol, Header | Reference)?
    field security_schemes : Hash(Symbol, Hash(String, Array(String)))?
    field links : Hash(Symbol, Link | Reference)?
    field callbacks : Hash(Symbol, Hash(String, PathItem) | Reference)?
  end
end
