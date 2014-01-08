lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'rubygems'
require 'rubygems/package_task'
require 'rdoc/task'

require 'gsl/version'

spec = Gem::Specification.new do |s|
  s.name    = 'gsl'
  s.version = GSL::VERSION
  s.summary = 'Ruby interface to GNU Scientific Library'
  s.description = 'Ruby/GSL is a Ruby interface to the GNU Scientific Library, for numerical computing with Ruby'
  s.required_ruby_version = '>= 1.8.1'
  s.requirements << 'GSL (http://www.gnu.org/software/gsl/)'

  # About
  s.authors = ['Yoshiki Tsunesada', 'David MacMahon']
  s.email = 'y-tsunesada@mm.em-net.ne.jp'
  s.homepage = 'http://rb-gsl.rubyforge.org/'
  s.rubyforge_project = 'rb-gsl' 

  # Files, Libraries, and Extensions
  s.files = Dir[
    'AUTHORS',
    'COPYING',
    'ChangeLog',
    'README',
    'Rakefile',
    'setup.rb',
    'THANKS',
    'examples/**/*',
    'ext/extconf.rb',
    'ext/*.c',
    'lib/**/*',
    'include/*',
    'rdoc/*',
    'tests/**/*'
  ]
  #s.autorequire = nil
  #s.bindir = 'bin'
  #s.executables = []
  #s.default_executable = nil
  s.require_paths = ['lib', 'lib/gsl', 'lib/ool', 'ext']

  # C compilation
  s.extensions = %w[ ext/extconf.rb ]

  # Documentation
  s.has_rdoc = true
  s.rdoc_options = [
    '--title', 'Ruby/GSL',
    '--main', 'rdoc/index.rdoc',
    '--exclude', 'ext/',
    '--exclude', 'include/',
    '--exclude', 'lib/',
  ]
  s.extra_rdoc_files = Dir['rdoc/*']

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<narray>, [">= 0.5.9"])
      s.add_development_dependency(%q<rake>, [">= 0"])
    else
      s.add_dependency(%q<narray>, [">= 0.5.9"])
      s.add_dependency(%q<rake>, [">= 0"])
    end
  else
    s.add_dependency(%q<narray>, [">= 0.5.9"])
    s.add_dependency(%q<rake>, [">= 0"])
  end

  # Testing TODO
  #s.test_files = []
end

Rake::PackageTask.new('rb-gsl', GSL::VERSION) do |pkg|
  pkg.need_zip = true
  pkg.need_tar = true
  pkg.package_files = spec.files
end

Gem::PackageTask.new(spec) do |pkg|
  pkg.need_zip = false
  pkg.need_tar = false
  pkg.gem_spec = spec
end

desc "Build the gemspec file #{spec.name}.gemspec"
task :gemspec do
  file = File.dirname(__FILE__) + "/#{spec.name}.gemspec"
  File.open(file, "w") {|f| f << spec.to_ruby }
end

task :default => [:package, :gem]

# --------------------------------------------------------------------
# Create a task to build the RDOC documentation tree.

desc "Create the RDoc html files"
Rake::RDocTask.new("rdoc") { |rdoc|
  rdoc.rdoc_dir = 'html'
  rdoc.title    = 'Ruby/GSL'
  rdoc.main     = 'rdoc/index.rdoc'
  rdoc.options << '--exclude' << 'ext/'
  rdoc.options << '--exclude' << 'include/'
  rdoc.options << '--exclude' << 'lib/'
  rdoc.rdoc_files.include('rdoc/*.rdoc')
}

desc "Publish the RDoc files on RubyForge"
task :pub_rdoc => ["html/index.html"] do
  mkdir_p "emptydir"
  sh "scp -rq html/* www.rubyforge.org:/var/www/gforge-projects/rb-gsl/."
  rm_r "emptydir"
end
