require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Job" do
  it "should be any class with an accessable perform method." do
    @any = 1
    job = ActiveQueue::Job.new(:val => @any, :job_klass => AnyClass)
    job.queue_adapter.class.should == ActiveQueue::Adapter::DefaultAdapter
    job.perform(:job_klass => AnyClass, :val => @any)
  end
  
  it "should be able to queue on resque." do
    @any = 1
    job = ActiveQueue::Job.new(:val => @any, :job_klass => AnyClass, :adapter => 'resque')
    job.queue_adapter.class.should == ActiveQueue::Adapter::ResqueAdapter
    job.queue_adapter.enqueue(job.class, {:val => @any, :job_klass => AnyClass, :adapter => 'resque'})
  end
  
end