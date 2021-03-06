require 'set_builder/modifier/verb'


module SetBuilder
  module Modifiers
    class NumberModifier < Modifier::Verb
      
      
      
      def self.operators
        {
          :is => [:number],
          :is_less_than => [:number],
          :is_greater_than => [:number],
          :is_between => [:number, :number]
        }
      end
      
      
      
      def build_conditions_for(selector)
        case operator
        when :is
          ["#{selector}=?", format_value]
        when :is_less_than
          ["#{selector}<?", format_value]
        when :is_greater_than
          ["#{selector}>?", format_value]
        when :is_between
          ["#{selector}>=? AND #{selector}<=?", values[0], values[1]]
        end
      end
      
      
      
    private
      
      
      
      def format_value
        values[0]
      end
      
      
      
    end
  end
end