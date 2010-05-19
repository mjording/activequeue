
module ActiveQueue
  autoload :Adapter,                  'active_queue/adapter'
  autoload :Job,                      'active_queue/job'
  Dir[File.join(File.dirname(__FILE__), 'active_queue', 'adapter','*.rb')].each{|f| require f }
end