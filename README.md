# NullObjectModels

Null Object Models is a gem that provides a finder method extension to ActiveRecord::Base
objects.

## Getting Started

### Finder methods

1. `find_or_null(id_or_array_of_ids, NullModelClass)`

This returns either the found model(s) or null object(s) for that model if it's not found, given the ID(s). You can optionally pass the class that is used in place of any not found models.

If you don't pass a `NullModelClass`, the default `NullModelObjects::Default` class is used. You can implicitly set a class to be used as well, as we'll show below.

### Defining Null Object Models

Defining a null object for your model can be done in one of two ways:

1. Define a class that matches the name `Null${ModelName}` and inherits from NullObjectModel::Default

eg. If your class is named 'Student', then define a class in the following way:

```ruby
class NullStudent < NullObjectModels::Default
end
```

2. Define `self.null_model` and return the name of the class that is a null_model. This class must also inherit from NullModelObjects::Default. This way is useful if you do not want/can not have a class named `Null${ModelName}`

eg.

```ruby
# student.rb
class Student
  def self.null_model
    MissingStudent
  end
end

# missing_student.rb
class MissingStudent < NullObjectModels::Default
end
```

### Define Default Implementation

The main value comes from defining defaults for your null models that allows you to handle logic in your application without throwing nil errors.

For example, say you have a `Train` model with a `sound` attribute in the database. With a null model implementation like:

```ruby
class NullTrain < NullModelObjects::Default
  def sound
    "Choo choo!"
  end
end
```

you now prevent `NilError`s on any code attempting to call `#sound` on null objects.

Eg. Trains with IDs (1,2) exist with the sound `"Chugga Chugga"`. Train with ID 3 does not exist.

```ruby
Train.find_or_null([1,2,3]).each |train|
  puts train.sound
end

# => "Chugga Chugga"
# => "Chugga Chugga"
# => "Choo choo!
```
