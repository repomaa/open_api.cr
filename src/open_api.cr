require "./open_api/*"

module OpenAPI
  VERSION = "1.2.1"

  def self.from_yaml(yaml)
    Document.from_yaml(yaml)
  end

  def self.from_json(json)
    Document.from_json(json)
  end

  {% begin %}
    {% for type in OpenAPI::Object::OBJECT_TYPES %}
      def self.{{ type.name.split("::").last.underscore.id }}(**args)
        {{ type }}.new(**args)
      end
    {% end %}
  {% end %}

  def self.build
    yield self
  end
end
