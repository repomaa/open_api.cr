require "./object"

module OpenAPI
  struct Reference
    include Object

    @[JSON::Field(key: "$ref")]
    field ref : String
  end
end
