require "./object"
require "./oauth_flow"

module OpenAPI
  struct OAuthFlows
    include Object

    field implicit : OAuthFlow?
    field password : OAuthFlow?
    field client_credentials : OAuthFlow?
    field authorization_code : OAuthFlow?
  end
end
