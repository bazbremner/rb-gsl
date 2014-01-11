# -*- encoding: utf-8 -*-

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'gsl/version'

Gem::Specification.new do |s|
  s.name = "gsl"
  s.version = GSL::VERSION

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Yoshiki Tsunesada", "David MacMahon"]
  s.date = "2013-03-04"
  s.email = "y-tsunesada@mm.em-net.ne.jp"
  s.extensions = ["ext/extconf.rb"]
  s.extra_rdoc_files = Dir['rdoc/*']
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
  s.homepage = "http://rb-gsl.rubyforge.org/"
  s.rdoc_options = [
    '--title', 'Ruby/GSL',
    '--main', 'rdoc/index.rdoc',
    '--exclude', 'ext/',
    '--exclude', 'include/',
    '--exclude', 'lib/',
  ]
  s.require_paths = ["lib", "lib/gsl", "lib/ool", "ext"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8.1")
  s.requirements = ["GSL (http://www.gnu.org/software/gsl/)"]
  s.rubyforge_project = "rb-gsl"
  s.rubygems_version = "2.0.14"
  s.summary = 'Ruby interface to GNU Scientific Library'
  s.description = 'Ruby/GSL is a Ruby interface to the GNU Scientific Library, for numerical computing with Ruby'

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
end
