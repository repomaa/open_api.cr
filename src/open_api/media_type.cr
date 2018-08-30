require "./object"
require "./reference"
require "./encoding"

module OpenAPI
  struct MediaType
    include Object

    field schema : (Schema | Reference)?
    field example : JSON::Any?
    field examples : Hash(String, Example | Reference)?
    field encoding : Hash(String, Encoding)?
  end
end
