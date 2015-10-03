require_relative 'tsv_buddy'
require 'yaml'
class FlipFlap
    include TsvBuddy
    def initialize
        @data = nil
    end
    
    def take_yaml(yml)
        @data = YAML.load(yml)
    end
    
    def to_yaml()
        @data.to_yaml()
    end
end  