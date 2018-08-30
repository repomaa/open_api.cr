require "./object"
require "./media_type"

module OpenAPI
  struct RequestBody
    include Object

    field description : String?
    field content : Hash(String, MediaType)
    field required : Bool?
  end
end
