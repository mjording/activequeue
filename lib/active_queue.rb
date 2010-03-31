Dir[File.join(File.dirname(__FILE__), 'active_queue', '*','*.rb')].each{|f| require f }


module ActiveQueue
  class Queue
    
    if defined? Resque
      include ResqueAdapter
    elsif defined? Delayed
      include DelayedJobAdapter
    end
  end
  
end