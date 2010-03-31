
module ActiveQueue::Adapters::DelayedJobAdapter
    #Background jobs can be any Ruby class or module that responds to perform. 
    #Your existing classes can easily be converted to background jobs or 
    #you can create new classes specifically to do work. 
    #Or, you can do both.
    def self.included(base)
      base.extend(ClassMethods)
    end
    module ClassMethods
      def enqueue(job_runner_klass, options = { })
        Delayed::Job.enqueue(job_runner_klass.new(options))
      end
    end
end