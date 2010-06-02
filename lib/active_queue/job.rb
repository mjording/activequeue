
module ActiveQueue
  
  class Job
    module ClassMethods
      
      def perform(opt = {})
        val = opt["val"] || opt[:val] 
        jk = opt["job_klass"] || opt[:job_klass]
        klass = jk.class == String ? eval(jk) : jk
        @v = klass.new(val)
        @v.perform
      end
    end
    extend ClassMethods
    @queue = :file_queue
     attr_accessor :val, :options, :queue_adapter, :queue_name, :perform_action, :queue, :job_klass
    def initialize(options)
      @options = options
      @val = options[:val] || options["val"]
      @job_klass = options[:job_klass] || options["job_klass"]
      @queue = options[:queue_name] ? options[:queue_name].to_sym : :file_queue
      @queue_adapter = options[:adapter] ? options[:adapter] : Adapter::DefaultAdapter.new
      if @queue_adapter.class == String
        @queue_adapter = adapters[@queue_adapter] ? adapters[@queue_adapter].new : nil
      end
    end
    def perform(opt = nil)
      puts "lperf #{opt[:val].respond_to?('perform')}"
      ActiveQueue::Job.perform(opt)
    end
    def enqueue
      @queue_adapter.enqueue(self.class, :val => @val, :job_klass => @job_klass)
    end
    #     
    #     def self.perform(value)
    #       #@value ||= options[:value] 
    #       value.preform
    #       #success = true
    #       #begin
    #       #@options[:value].perform
    #       #rescue Exception => e
    #       #  success = e.message
    #       #end
    #       #success
    #     end
    #     def enqueue
    #       @queue_adapter.enqueue(ActiveQueue::Job, @value)
    #     end
    #     
        def adapters
          { "resque" => ActiveQueue::Adapter::ResqueAdapter, 
           "delayed" => ActiveQueue::Adapter::DelayedJobAdapter, 
           "insta" => ActiveQueue::Adapter::DefaultAdapter }
        end
        
  end
  
end