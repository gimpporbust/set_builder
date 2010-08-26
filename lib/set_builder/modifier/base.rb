module SetBuilder
  module Modifier
    class Base
      
      
      
      def initialize(hash)
        @operator, @values = hash.first[0].to_sym, hash.first[1]
        @values = [@values] unless @values.is_a?(Array)
      end
      
      
      
      attr_reader :operator, :values
      
      
      
      def valid?
        arguments = self.class.operators[operator]
        !arguments.nil? and (arguments.length == values.length)
      end
      
      
      
      def to_s
        words = [operator.to_s]
        arguments = self.class.operators[operator]
        (0...arguments.length).each do |i|
          words << ValueMap.to_s(arguments[i], values[i])
        end
        words.join(" ")
        # "#{operator} #{values.collect{|value| ValueMap.to_s(value)}.to_sentence}"
      end
      
      
      
      def self.to_hash
        hash = {}
        operators.each do |operator, array|
          hash[operator.to_s] = array.map {|type| type.to_s }
        end
        hash
      end
      
      
      
      def self.to_json
        to_hash.to_json
      end
      
      
      
    end
  end
end