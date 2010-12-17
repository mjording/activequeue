# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{activequeue}
  s.version = "0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Matthew Jording"]
  s.date = %q{2010-10-20}
  s.description = %q{Queues and Background Job Runners are becoming as ubiquitous to Rails applications as Databases. Why not treat each of them as the same generic component, conforming to an interface and convention that is well understood.}
  s.email = %q{mjording@opengotham.com}
  s.extra_rdoc_files = [
    "README.markdown"
  ]
  s.files = [
    "lib/active_queue/adapter.rb",
     "lib/active_queue/adapter/delayed_job_adapter.rb",
     "lib/active_queue/adapter/resque_adapter.rb",
     "lib/active_queue/job.rb",
     "lib/activequeue.rb"
  ]
  s.homepage = %q{http://github.com/mjording/active_queue}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{ActiveQueue is a Rails abstraction of queue configuration and background job creation/specification.}
  s.test_files = [
    "spec/job_spec.rb",
     "spec/spec_helper.rb",
     "test/helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end

