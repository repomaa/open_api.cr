require "./object"
require "./oauth_flows"

module OpenAPI
  struct SecurityScheme
    include Object

    field type : String
    field description : String?
    field name : String?
    field in : String?
    field scheme : String?
    field bearer_format : String?
    field flows : OAuthFlows?
    field open_id_connect_url : String?
  end
end
