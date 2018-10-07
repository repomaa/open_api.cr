require "./object"

module OpenAPI
  struct OAuthFlow
    include Object

    field authorization_url : String?
    field token_url : String?
    field refresh_url : String?
    field scopes : Hash(String, String)
  end
end
