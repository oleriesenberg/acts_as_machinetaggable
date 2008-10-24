module ActiveRecord
  module Acts #:nodoc:
    module Machinetagger #:nodoc:
      def self.included(base)
        base.extend(ClassMethods)
      end
      
      module ClassMethods
        def acts_as_machinetagger(options = {})
          has_many :machinetaggings
          has_many :machinetags, :through => :machinetaggings, :select => "DISTINCT machinetags.*"
          
          extend ActiveRecord::Acts::Machinetagger::SingletonMethods
          include ActiveRecord::Acts::Machinetagger::InstanceMethods
        end
      end
      
      module SingletonMethods
      end
      
      module InstanceMethods
      end
    end
  end
end