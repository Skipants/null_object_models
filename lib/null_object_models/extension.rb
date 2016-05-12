module NullObjectModels
  module Extension
    extend ActiveSupport::Concern

    module ClassMethods
      def find_or_null(id_or_ids, klass = nil)
        klass ||= null_model

        if id_or_ids.is_a?(Array)
          found_collection = where(id: id_or_ids)

          id_or_ids.map do |id|
            found_collection.detect { |found| found.id == id } || klass.new(id, self)
          end
        else
          find_by_id(id_or_ids) || klass.new(id_or_ids, self)
        end
      end

      def null_model
        ('Null' + self.name).constantize
      rescue
        NullObjectModels::Default
      end
    end
  end

  ActiveRecord::Base.send(:include, Extension)
end
