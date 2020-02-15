require "./object"
require "./reference"

module OpenAPI
  class Schema
    include Object

    field title : String?
    field multiple_of : Int32?
    field maximum : Int32?
    field exclusive_maximum : Bool?
    field minimum : Int32?
    field exclusive_minimum : Bool?
    field max_length : Int32?
    field min_length : Int32?
    field pattern : String?
    field max_items : Int32?
    field min_items : Int32?
    field unique_items : Bool?
    field max_properties : Int32?
    field min_properties : Int32?
    field required : Array(String)?
    field enum : Array(JSON::Any::Type)?
    field type : String?
    field all_of : Array(Schema | Reference)?
    field one_of : Array(Schema | Reference)?
    field any_of : Array(Schema | Reference)?
    field not : (Schema | Reference)?
    field items : (Schema | Reference)?
    field properties : Hash(String, (Schema | Reference))?
    field additional_properties : (Bool | Schema | Reference)?
    field description : String?
    field format : String?
    field default : JSON::Any::Type
    field read_only : Bool?
    field write_only : Bool?
  end
end
