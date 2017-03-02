# -*- ruby -*-

require 'rubygems'
require 'hoe'
require 'hoe/signing'
$LOAD_PATH.unshift(File.expand_path('../lib',__FILE__))

Hoe.plugin :yard

Hoe.spec('hoe-yard') do
  self.version = Hoe::Yard::PLUGIN_VERSION
  self.developer 'Postmodern', 'postmodern.mod3@gmail.com'
  self.license 'MIT'

  self.yard_options = ['--markup', 'markdown', '--protected']
  self.remote_yard_dir = '/'

  self.extra_deps = [
    ['yard', '>=0.2.3.1']
  ]
end

# vim: syntax=ruby
