
Dir[File.join(File.dirname(__FILE__), 'active_queue','adapters','*.rb')].each{|f| require f }

module ActiveQueue

  def self.adapters
    ActiveQueue::Adapters
  end
  module Adapters
    def self.included(base) # :nodoc:
      
      base.class_eval do
        
        if defined? Delayed
          include ActiveQueue::Adapters::DelayedJobAdapter
        elsif defined? Resque
          include ActiveQueue::Adapters::ResqueAdapter
        else
          include ActiveQueue::Adapters::DummyAdapter
        end
      
      end
    
    end
    
  end
  class Queue
    include Adapters
    @queue = :file_queue

  end
  #Dir[File.join(File.dirname(__FILE__), 'active_queue', '*','*.rb')].each{|f| require f }
  
  
end