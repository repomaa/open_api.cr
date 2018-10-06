require "./object"
require "./server"

module OpenAPI
  struct Link
    include Object

    field operation_ref : String?
    field operation_id : String?
    field parameters : Hash(Symbol, JSON::Any::Type)?
    field request_body : Hash(Symbol, JSON::Any::Type)?
    field description : String?
    field server : Server?
  end
end
