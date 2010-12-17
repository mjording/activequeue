begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "activequeue"
    gemspec.summary = "ActiveQueue is a Rails abstraction of queue configuration and background job creation/specification."
    gemspec.description = "Queues and Background Job Runners are becoming as ubiquitous to Rails applications as Databases. Why not treat each of them as the same generic component, conforming to an interface and convention that is well understood."
    gemspec.email = "mjording@opengotham.com"
    gemspec.homepage = "http://github.com/mjording/activequeue"
    gemspec.authors = ["Matthew Jording"]
    gemspec.files = FileList['lib/**/*.rb']
    
  end
  Jeweler::GemcutterTasks.new
  
rescue LoadError
  puts "Jeweler not available. Install it with: gem install jeweler"
end
