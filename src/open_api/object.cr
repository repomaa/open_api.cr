require "json"
require "yaml"

module OpenAPI
  module Object
    OBJECT_TYPES = [] of Object.class

    macro included
      include JSON::Serializable
      include YAML::Serializable

      {% OBJECT_TYPES << @type %}

      def self.new(**args)
        instance = allocate
        instance.initialize(__mass_assignable_attributes: args)
        GC.add_finalizer(instance) if instance.responds_to?(:finalize)
        instance
      end

      macro inherited
        def self.new(**args)
          super
        end
      end
    end

    def initialize(*, __mass_assignable_attributes args : T) forall T
      {% begin %}
        {% for ivar in @type.instance_vars %}
          {% if ivar.type.nilable? || ivar.has_default_value? %}
            args[{{ ivar.symbolize }}]?.try do |value|
              @{{ ivar }} = coerce_{{ ivar }}(value)
            end
          {% else %}
            @{{ ivar }} = coerce_{{ ivar }}(args[{{ ivar.symbolize }}])
          {% end %}
        {% end %}
      {% end %}
    end

    macro field(type_declaration)
      {% name = type_declaration.var %}
      {% type = type_declaration.type %}
      {% union_types = type.is_a?(Union) ? type.types : [type] %}
      {% if union_types.any? { |type| type.is_a?(Union) } %}
        field({{ name }} : {{ union_types.reduce([] of AstNode) { |types, type| types + (type.is_a?(Union) ? type.types : [type]) }.join(" | ").id }})
      {% else %}
        {% if name =~ /_/ %}
          @[JSON::Field(key: {{ "#{name[0...1]}#{name.camelcase[1..-1]}" }})]
        {% end %}
        getter {{ type_declaration }}

        private def coerce_{{ name }}(value)
          value
        end

        {% union_types = union_types.reject { |type| type.is_a?(Path) && type.resolve == Nil } %}

        {% for union_type in union_types %}
          {% if union_type.is_a?(Path) && union_type.resolve <= Object %}
            private def coerce_{{ name }}(value : NamedTuple)
              {{ union_type }}.new(**value)
            end
          {% elsif union_type.is_a?(Generic) %}
            {% if union_type.name.resolve == Hash %}
              private def coerce_{{ name }}(hash : Hash)
                return hash if hash.is_a?({{ type }})
                {{ union_type }}.new.tap do |result|
                  hash.each { |key, value| result[key] = value }
                end
              end
            {% elsif union_type.name.resolve == Array %}
              private def coerce_{{ name }}(array : Array)
                return array if array.is_a?({{ type }})
                {{ union_type }}.new.tap do |result|
                  array.each { |value| result << value }
                end
              end
            {% end %}
          {% end %}
        {% end %}
      {% end %}
    end
  end
end
