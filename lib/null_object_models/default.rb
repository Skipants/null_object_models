module NullObjectModels
  class Default
    attr_accessor :id

    def initialize(id, represented_class)
      @id = id
      @represented_class = represented_class
    end

    def class
      @represented_class
    end
  end
end
