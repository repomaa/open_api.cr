require "./object"
require "./server"

module OpenAPI
  struct Link
    include Object

    field operation_ref : String?
    field operation_id : String?
    field parameters : Hash(String, JSON::Any::Type)?
    field request_body : Hash(String, JSON::Any::Type)?
    field description : String?
    field server : Server?
  end
end
