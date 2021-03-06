# hoe-yard

* http://github.com/postmodern/hoe-yard/
* http://github.com/postmodern/hoe-yard/issues
* Postmodern (postmodern.mod3 at gmail.com)

## DESCRIPTION:

A Hoe plugin for generating YARD documentation.

Using the Hoe YARD plugin, projects can begin generating YARD documentation
instantly. Additionally, any resulting RubyGems will be properly configured
to automatically generate YARD documentation upon installation.

## FEATURES:

* Automatically find the README and History files, irregardless of file
  extension.
* Sets `has_rdoc` to `yard`.
* Sets `rdoc_options`.
* Sets `extra_rdoc_files`.
* Adds hoe-yard as a development dependency.
* Adds the `yard` and `docs` Rake tasks.

## REQUIREMENTS:

* [yard](http://yardoc.org/) >= 0.2.3.1

## INSTALL:

    $ sudo gem install hoe-yard

## USAGE:

    require 'rubygems'
    require 'hoe'

    Hoe.plugin :yard

    Hoe.spec('my_project') do
      # ...

      self.yard_title = 'My Project'
      self.yard_markup = :markdown
      self.yard_opts = ['--protected']

      # ...
    end

## LICENSE:

(The MIT License)

Copyright (c) 2010 Hal Brodigan

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
