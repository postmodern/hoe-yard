# -*- ruby -*-

require 'rubygems'
require 'hoe'
require 'hoe/signing'
require './lib/hoe/yard.rb'

Hoe.plugin :yard

Hoe.spec('hoe-yard') do
  self.version = Hoe::Yard::PLUGIN_VERSION
  self.developer('Postmodern', 'postmodern.mod3@gmail.com')

  self.yard_options = ['--markup', 'markdown', '--protected']
  self.remote_yard_dir = '/'

  self.extra_deps = [
    ['yard', '>=0.2.3.1']
  ]
end

# vim: syntax=ruby
