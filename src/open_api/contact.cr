require "./object"

module OpenAPI
  struct Contact
    include Object

    field name : String
    field url : String
    field email : String
  end
end
