require "./object"
require "./header"
require "./reference"
require "./media_type"
require "./reference"

module OpenAPI
  struct Response
    include Object

    field description : String
    field headers : Hash(String, Header | Reference)?
    field content : Hash(String, MediaType)?
    field links : Hash(String, Link | Reference)?
  end
end
