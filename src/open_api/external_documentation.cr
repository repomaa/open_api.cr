require "./object"

module OpenAPI
  struct ExternalDocumentation
    include Object

    field description : String?
    field url : String
  end
end
