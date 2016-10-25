= NullObjectModels

Null Object Models is a gem that provides a finder method extension to ActiveRecord::Base
objects.

== Getting Started

=== Defining Null Object Models

You can call `find_or_null(id)` or `find_or_null([ids])` on any model and this will work, returning `NullModelObject::Default` instances for anything not found. However, this is probably not too useful without creating a null object for your model. Since you'll most likely get nil errors if you try referencing any data on this objects.

Defining a null object for your model can be done in one of two ways:

1. Define a class that matches the name `Null${ModelName}` and inherits from NullObjectModel::Default

eg. If your class is named 'Student', then define a class in the following way:

```ruby
class NullStudent < NullObjectModels::Default
end
```

2. Define `self.null_model` and return the name of the class that is a null_model. This class must also inherit from NullModelObjects::Default.

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

=== Define Default Implementation

The main value comes from defining defaults for your null models that allows you to handle logic in your application without throwing nil errors.

For example, if you have a `Train` model with a `sound` attribute, defining:

```ruby
class NullTrain
  def sound
    'Choo choo!'
  end
end
```

provides a default sound for null models. Now if your code has something like:

`puts "The sound a train makes: #{train.sound}"` you won't get a nil error.


