$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..'))
require 'rubygems'
require 'spec'
require 'spec/autorun'
require 'active_support/inflector'
require 'lib/activequeue'


Spec::Runner.configure do |config|
  
end