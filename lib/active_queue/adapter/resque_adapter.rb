unless defined? Resque
  require 'resque'
end
module ActiveQueue
  module Adapter
    
    class ResqueAdapter
      def initialize(options = {})
        @options = options
      end
      def adapter_name
        "resque"
      end
      def enqueue(job_klass, options = { })
        Resque.enqueue(job_klass, options)
      end
    end
  end
end