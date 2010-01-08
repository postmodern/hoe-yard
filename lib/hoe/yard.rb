require 'hoe'

gem 'yard'

##
# YARD plugin for hoe.
#
# === Tasks Provided:
#
# yard::              Generate YARD documentation
# docs::              Generate YARD documentation
#
module Hoe::Yard
  # hoe-yard version
  PLUGIN_VERSION = '0.1.0'

  # Supported markups
  YARD_MARKUP = [:markdown, :texttile, :rdoc]

  # File extensions indicating raw content
  YARD_RAW_EXTS = ['.txt', '.html']

  # File extensions for various markups
  YARD_EXTS = {
    :markdown => ['.markdown', '.md'],
    :texttile => ['.texttile', '.tt'],
    :rdoc => ['.rdoc']
  }

  # The default YARD template
  YARD_DEFAULT_TEMPLATE = 'default'

  # The default YARD format
  YARD_DEFAULT_FORMAT = :html

  # The default return-type for documented methods.
  YARD_DEFAULT_RETURN_TYPE = 'Object'

  # Title for the YARD documentation
  attr_accessor :yard_title

  # Markup style used in documentation, like textile, markdown or rdoc.
  # (default: +:rdoc+)
  attr_accessor :yard_markup

  # Overrides the library used to process markup formatting
  # (specify the gem name)
  attr_accessor :yard_markup_provider

  # Options to pass to YARD
  attr_accessor :yard_opts

  def initialize_yard
    self.yard_title = Hoe.normalize_names(self.name).last + ' Documentation'
    self.yard_markup = nil
    self.yard_markup_provider = nil
    self.yard_opts = []

    # find the README.* and History.* files
    self.readme_file = intuit_file_name(File.basename(self.readme_file))
    self.history_file = intuit_file_name(File.basename(self.history_file))

    # disable RDoc and ri tasks
    self.need_rdoc = false

    # add YARD as a development dependency
    yard_version = Gem.loaded_specs['yard'].version
    self.extra_dev_deps << ['yard', ">=#{yard_version}"]

    # add hoe-yard as a development dependency
    self.extra_dev_deps << ['hoe-yard', ">=#{PLUGIN_VERSION}"]

    # we have YARD docs
    self.spec_extras.merge!(:has_rdoc => 'yard')

    if self.history_file
      # include the history file
      self.yard_files << self.history_file
    end
  end

  def define_yard_tasks
    require 'yard'

    # generate the YARD options
    opts = normalize_yard_opts

    task :clobber_docs do
      FileUtils.rm_rf(local_yard_dir)
    end

    # define the yard task
    ::YARD::Rake::YardocTask.new do |t|
      t.files = ['lib/**/*.rb']
      t.options = opts + ['--files'] + self.yard_files
    end
    task :docs => :yard

    # override the RDoc options
    self.spec.rdoc_options = opts
  end

  protected

  #
  # Alias to <tt>Hoe#extra_rdoc_files</tt>.
  #
  def yard_files
    self.extra_rdoc_files
  end

  #
  # Alias to <tt>Hoe#extra_rdoc_files=</tt>.
  #
  def yard_files=(new_files)
    self.extra_rdoc_files = new_files
  end

  #
  # Alias to <tt>Hoe#local_rdoc_dir</tt>.
  #
  def local_yard_dir
    self.local_rdoc_dir
  end

  #
  # Alias to <tt>Hoe#local_yard_dir=</tt>.
  #
  def local_yard_dir=(new_dir)
    self.local_rdoc_dir = new_dir
  end

  #
  # Alias to <tt>Hoe#remote_rdoc_dir</tt>.
  #
  def remote_yard_dir
    self.remote_rdoc_dir
  end

  #
  # Alias to <tt>Hoe#remote_rdoc_dir=</tt>.
  #
  def remote_yard_dir=(new_dir)
    self.remote_rdoc_dir = new_dir
  end

  #
  # Intuitively finds the file with the given _name_, using the current
  # YARD markup setting to guess the file extension.
  #
  def intuit_file_name(name)
    name = name.gsub(/\.[^\.]+$/,'')
    paths = Dir["#{name}.*"]

    exts = if self.yard_markup
             YARD_EXTS[self.yard_markup]
           else
             YARD_EXTS.values.flatten.uniq
           end

    # append the other raw extensions
    exts += YARD_RAW_EXTS

    paths.each do |path|
      return path if exts.include?(File.extname(path))
    end

    warn "Could not intuitively find the #{name} file" if $DEBUG
    return nil
  end

  #
  # Generates the minimal amount of YARD options based on the YARD
  # settings.
  #
  def normalize_yard_opts
    opts = self.yard_opts + ['--title', self.yard_title]

    if self.yard_markup
      opts += ['--markup', self.yard_markup]
    end

    if self.yard_markup_provider
      opts += ['--markup-provider', self.yard_markup_provider]
    end

    unless (opts.include?('--quiet') || opts.include?('--verbose') || $DEBUG)
      opts += ['--quiet']
    end

    return opts
  end
end unless defined? Hoe::Yard
