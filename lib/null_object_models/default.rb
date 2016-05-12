module NullObjectModels
  class Default
    attr_accessor :id

    # delegate :method_missing, :respond_to_missing?, to: :@klass

    def initialize(id, klass)
      @id = id
      @klass = klass
    end
  end
end
