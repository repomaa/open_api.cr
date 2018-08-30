require "./object"
require "./info"
require "./server"
require "./path_item"
require "./components"
require "./tag"

module OpenAPI
  struct Document
    include Object

    field openapi : String
    field info : Info
    field servers : Array(Server)?
    field paths : Hash(String, PathItem)
    field components : Components?
    field security : Hash(String, Array(String))?
    field tags : Array(Tag)?
    field external_docs : ExternalDocumentation?
  end
end
