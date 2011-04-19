# -*- ruby -*-

require 'rubygems'
require 'hoe'
require 'hoe/git'

Hoe.plugin(:git)

Hoe.spec 'flexmock-minitest' do
  developer('pete higgins', 'pete@peterhiggins.org')

  extra_dev_deps << ["hoe-git", "~> 1.3.0"]
  extra_deps << ["flexmock", "~> 0.9.0"]
  self.testlib = :minitest
end

# vim: syntax=ruby
