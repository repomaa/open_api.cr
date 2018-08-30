require "./object"
require "./contact"
require "./license"

module OpenAPI
  struct Info
    include Object

    field title : String
    field description : String?
    field terms_of_service : String?
    field contact : Contact?
    field license : License?
    field version : String
  end
end
