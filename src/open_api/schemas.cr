require "json"
require "yaml"

module OpenAPI
  struct Map(K, V)
    def initialize
      @hash = Hash(K, V)
    end

    def []=(key : K, value : V)
      @hash[key] = value
    end

    def self.new(parser : JSON::PullParser)
      hash = Hash(K, V).new(parser)
      new(hash)
    end

    def self.new(context : YAML::ParserContext, node : YAML::Nodes::Node)
      hash = Hash(K, V).new(context, node)
      new(hash)
    end

    private def initialize(@hash : Hash(K, V))
    end

    def to_json(builder : JSON::Builder)
      @hash.to_json(builder)
    end

    def to_yaml(builder : YAML::Nodes::Builder)
      @hash.to_yaml(builder)
    end
  end
end
