module NullObjectModels
  class Default
    attr_accessor :id, :_nom_klass

    def initialize(id, klass)
      @id = id
      @_nom_klass = klass
    end

    def class
      @_nom_delegated_class ||= NullObjectModels::NullClassDelegator.new(self)
    end
  end
end
