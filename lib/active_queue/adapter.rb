module ActiveQueue
  module Adapter
    
    class DefaultAdapter
      def adapter_name
        "insta-queue"
      end
      def enqueue(job_klass, options = { })
        job_klass.perform
      end
    end
  end
end