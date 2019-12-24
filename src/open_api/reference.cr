require "./object"

module OpenAPI
  struct Reference
    include Object

    @[JSON::Field(key: "$ref")]
    @[YAML::Field(key: "$ref")]
    field ref : String
  end
end
