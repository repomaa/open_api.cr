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

    field schemas : Hash(String, Schema | Reference) = Hash(String, Schema | Reference).new
    field responses : Hash(String, Response | Reference) = Hash(String, Response | Reference).new
    field parameters : Hash(String, Parameter | Reference) = Hash(String, Parameter | Reference).new
    field examples : Hash(String, Example | Reference) = Hash(String, Example | Reference).new
    field request_bodies : Hash(String, RequestBody | Reference) = Hash(String, RequestBody | Reference).new
    field headers : Hash(String, Header | Reference) = Hash(String, Header | Reference).new
    field security_schemes : Hash(String, SecurityScheme | Reference) = Hash(String, SecurityScheme | Reference).new
    field links : Hash(String, Link | Reference) = Hash(String, Link | Reference).new
    field callbacks : Hash(String, Hash(String, PathItem) | Reference) = Hash(String, Hash(String, PathItem) | Reference).new
  end
end
