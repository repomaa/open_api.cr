require "./object"
require "./server"

module OpenAPI
  struct Link
    include Object

    field operation_ref : String?
    field operation_id : String?
    field parameters : Hash(String, JSON::Any)?
    field request_body : Hash(String, JSON::Any)?
    field description : String?
    field server : Server?
  end
end
