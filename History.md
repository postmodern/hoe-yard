=== 0.1.3 / 2017-03-01

* Require [yard] ~> 0.8.
* Add `asciidoc` as one of the allowed markup providers (@dsisnero).

=== 0.1.2 / 2010-01-22

* Renamed `yard_opts` to `yard_options`.
* No longer automatically add `yard` to the development dependencies
  of a Hoe project.

=== 0.1.1 / 2010-01-10

* Only add hoe-yard as a development dependency, if we are not in the
  hoe-yard gem.
* Have the `yard` task generate documentation only for the files listed in
  Manifest.txt.
* Have the `clobber_docs` task call `rm_r` when cleaning the `docs/`
  directory.

=== 0.1.0 / 2010-01-08

* Initial release:
  * Automatically find the README and History files, irregardless of file
    extension.
  * Sets `has_rdoc` to `yard`.
  * Sets `rdoc_options`.
  * Sets `extra_rdoc_files`.
  * Adds YARD and hoe-yard as development dependencies.
  * Adds the `yard` and `docs` Rake tasks.

[yard]: http://yardoc.org/
