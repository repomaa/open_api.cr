require "./object"

module OpenAPI
  struct License
    include Object

    field name : String
    field url : String
  end
end
