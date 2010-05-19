# unless defined? Delayed
#   require 'delayed_job'
# end
module ActiveQueue
  module Adapter
    
    class DelayedJobAdapter
      def initialize(options = {})
        @options = options
      end
      def adapter_name
        "delayed_job"
      end
      def enqueue(job_klass, options = { })
        Delayed::Job.enqueue(job_klass.new(options))
      end
    end
  end
end