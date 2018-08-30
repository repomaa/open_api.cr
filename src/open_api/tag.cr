require "./object"
require "./external_documentation"

module OpenAPI
  struct Tag
    include Object

    field name : String
    field description : String?
    field external_docs : ExternalDocumentation?
  end
end
