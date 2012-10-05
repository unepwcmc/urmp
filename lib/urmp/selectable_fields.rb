module URMP
  module SelectableFields
    extend ActiveSupport::Concern

    module ClassMethods
      # this is a helper method generates class method, that returns
      # uniq set of resource values for given attribute
      #
      # eg. selectable_fields [:language] #defines method
      # Klass.languages # => []
      def selectable_fields(names)
        names.each do |name|
          define_singleton_method "#{name.to_s.pluralize}" do
            Resource.
              all.
              map{ |e| e.send(name) }.
              uniq.
              reject { |e| e.blank? }
          end
        end
      end

    end
  end
end
