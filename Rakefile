# -*- ruby -*-

require 'rubygems'
require 'hoe'
require 'hoe/signing'
require './lib/hoe/yard.rb'

Hoe.plugin :yard

Hoe.spec('hoe-yard') do
  self.version = Hoe::Yard::PLUGIN_VERSION
  self.developer('Postmodern', 'postmodern.mod3@gmail.com')

  self.readme_file = 'README.rdoc'
  self.history_file = 'History.rdoc'

  self.extra_deps = [
    ['yard', '>=0.2.3.1']
  ]
end

# vim: syntax=ruby
