module OpenAPI
  module MassAssignment
    macro included
      def self.new(**args)
        new(args)
      end
    end

    def initialize(args : NamedTuple)
      {% for ivar in @type.instance_vars %}
        {% if ivar.type.nilable? %}
          args[{{ ivar.name.symbolize }}]?.try do |value|
            @{{ ivar.name.id }} = value
          end
        {% else %}
          @{{ ivar.name.id }} = args[{{ ivar.name.symbolize }}]
        {% end %}
      {% end %}
    end
  end
end
