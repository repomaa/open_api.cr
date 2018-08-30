require "./object"
require "./header"
require "./reference"

module OpenAPI
  struct Encoding
    include Object

    field content_type : String?
    field headers : Hash(String, Header | Reference)?
    field style : String?
    field explode : Bool?
    field allow_reserved : Bool?
  end
end
