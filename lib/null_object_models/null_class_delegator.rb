module NullObjectModels
  # The purpose of this class is to provide a class that can call a
  # model's class methods through a NullObjectModel::Default instance
  # without obscuring that this was called through a NullObjectModel::Default
  # instance.
  #
  # ie. The original implementation was to just override `.class` in
  # NullObjectModel::Default, but you do not want to inspect a
  # NullObjectModel and be tricked into thinking it's a non-null instance
  # of the model
  class NullClassDelegator < SimpleDelegator
    def initialize(null_object_instance)
      super(null_object_instance._nom_klass)
      @_nom_null_object_instance = null_object_instance
    end
  end
end
