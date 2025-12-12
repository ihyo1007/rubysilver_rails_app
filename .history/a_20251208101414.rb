class Foo
  attr_writer :a
end

foo = Foo.new
foo.a = "REx"
puts foo.instance_variable_get(:@a)  # Output: REx