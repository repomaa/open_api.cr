require "./object"
require "./external_documentation"
require "./parameter"
require "./reference"
require "./request_body"
require "./response"
require "./server"
require "./path_item"

module OpenAPI
  struct Operation
    include Object

    field tags : Array(String)?
    field summary : String?
    field description : String?
    field external_docs : ExternalDocumentation?
    field operation_id : String?
    field parameters : Array(Parameter | Reference)?
    field request_body : (RequestBody | Reference)?
    field responses : Hash(String, Response)?
    field callbacks : Hash(String, (Hash(String, PathItem) | Reference))?
    field deprecated : Bool?
    field security : Array(Hash(String, Array(String)))?
    field servers : Array(Server)?
  end
end
