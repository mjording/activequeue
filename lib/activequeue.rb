class AnyClass
  def self.find(i)
    self.new
  end
  def perform
    puts "I did it"
  end
  
end
module ActiveQueue
  autoload :Adapter,                  'active_queue/adapter'
  autoload :Job,                      'active_queue/job'
  Dir[File.join(File.dirname(__FILE__), 'active_queue', 'adapter','*.rb')].each{|f| require f }
end