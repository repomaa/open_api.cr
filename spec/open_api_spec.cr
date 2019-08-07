require "./spec_helper"

describe OpenAPI do
  it "compiles" do
    OpenAPI
  end

  it "produces json without error" do
    OpenAPI.document(
      openapi: "3.0.1",
      info: {
        title:   "Test",
        version: "0.1.0",
      },
      paths: {} of String => OpenAPI::PathItem
    ).to_json
  end
end
