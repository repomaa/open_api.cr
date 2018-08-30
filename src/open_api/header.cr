require "./object"
require "./schema"
require "./reference"
require "./example"

module OpenAPI
  struct Header
    include Object

    field description : String?
    field required : Bool?
    field deprecated : Bool?
    field allow_empty_value : Bool?
    field style : String?
    field explode : Bool?
    field allow_reserved : Bool?
    field schema : (Schema | Reference)?
    field example : JSON::Any?
    field examples : Hash(String, Example | Reference)?
  end
end
