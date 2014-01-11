lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'rubygems'
require 'rubygems/package_task'
require 'rdoc/task'

require 'gsl/version'

spec = eval(IO.read("gsl.gemspec"))

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
