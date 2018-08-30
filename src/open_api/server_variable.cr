require "./object"

module OpenAPI
  struct ServerVariable
    include Object

    field enum : Array(String)?
    field default : String
    field description : String?
  end
end
