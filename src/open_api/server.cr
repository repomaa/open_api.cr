require "./object"
require "./server_variable"

module OpenAPI
  struct Server
    include Object

    field url : String
    field description : String?
    field variables : Hash(String, ServerVariable)?
  end
end
