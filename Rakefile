require "bundler/gem_tasks"
require "rake/testtask"
require "sdoc"
require "rdoc/task"

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList["test/**/*_test.rb"]
end

RDoc::Task.new do |rdoc|
  rdoc.options << "--format=sdoc"
  rdoc.template = "rails"
  rdoc.markup = "markdown"
  rdoc.rdoc_dir = "doc"

  rdoc.title = "PartialForm"
  rdoc.main = "README.md"
  rdoc.rdoc_files.include("README.md", "lib/**/*.rb")
  rdoc.rdoc_files.exclude("lib/generators/**/*")
end

require "standard/rake"

task default: %i[test standard]
