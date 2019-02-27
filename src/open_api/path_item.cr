require "./object"
require "./operation"
require "./server"
require "./parameter"
require "./reference"

module OpenAPI
  class PathItem
    include Object

    @[JSON::Field(key: "$ref")]
    field ref : String?
    field summary : String?
    field description : String?
    field get : Operation?
    field put : Operation?
    field post : Operation?
    field delete : Operation?
    field options : Operation?
    field head : Operation?
    field patch : Operation?
    field trace : Operation?
    field servers : Array(Server)?
    field parameters : Array(Parameter | Reference)?

    setter get, put, post, delete, options, head, patch, trace
  end
end
