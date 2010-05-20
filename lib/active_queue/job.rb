
module ActiveQueue
  
  class Job
    @queue = :file_queue
    attr_accessor :value, :options, :queue_adapter, :queue_name, :perform_action
    def initialize(options = {})
      @options = options
      @value = options[:value]
      @queue = options[:queue_name] ? options[:queue_name].to_sym : :file_queue
      @queue_adapter = options[:adapter] ? options[:adapter] : Adapter::DefaultAdapter.new
      if @queue_adapter.class == String
        @queue_adapter = adapters[@queue_adapter] ? adapters[@queue_adapter].new : nil
      end
    end
    def enqueue
      @queue_adapter.enqueue(self.class, options)
    end
    def self.perform(options = nil)
      success = true
      begin
        @value.perform(options)
      rescue Exception => e
        success = e.message
      end
      success
    end
    def perform(options = nil)
      self.perform(options)
    end
    def adapters
      { "resque" => ActiveQueue::Adapter::ResqueAdapter, 
       "delayed" => ActiveQueue::Adapter::DelayedJobAdapter }
    end
  end
  
end