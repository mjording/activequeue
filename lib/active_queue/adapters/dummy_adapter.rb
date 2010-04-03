module ActiveQueue::Adapters::DummyAdapter
  
    #Background jobs can be any Ruby class or module that responds to perform. 
    #Your existing classes can easily be converted to background jobs or 
    #you can create new classes specifically to do work. 
    #Or, you can do both.
    def self.included(base)
      base.extend(ClassMethods)
    end
    module ClassMethods
      def adapter_name
        "dummy"
      end
      def enqueue(job_runner_klass, options = { })
        true
      end
      
    end
end