
module Jobs
  class ExampleJob < Struct.new(:foo)
    def perform
      true
    end
  end
  
  
end