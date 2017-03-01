# Copyright (c) Microsoft Open Technologies, Inc.  All rights reserved.
#
# The MIT License (MIT)
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.
require "bundler/gem_tasks"
require 'rubocop/rake_task'
require 'rake/testtask'

RuboCop::RakeTask.new

task :default => :test

desc 'Run fog-hadoop unit tests with Minitest'
task :test do
  mock = ENV['FOG_MOCK'] || 'true'
  sh("export FOG_MOCK=#{mock} && bundle exec rake tests:unit")
end

desc 'Run fog-hadoop spec/ tests (VCR)'
task :spec => "tests:spec"

namespace :tests do
  desc "Run fog-hadoop test/"
  Rake::TestTask.new do |t|
    t.name = 'unit'
    t.libs.push [ "lib", "test" ]
    t.test_files = FileList['test/**/*.rb']
    t.verbose = true
  end

  desc "Run fog-hadoop spec/"
  Rake::TestTask.new do |t|
    t.name = 'spec'
    t.libs.push [ "lib", "spec" ]
    t.pattern = 'spec/**/*_spec.rb'
    t.verbose = true
  end
end