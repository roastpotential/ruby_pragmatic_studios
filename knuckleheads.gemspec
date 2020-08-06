
Gem::Specification.new do |s|
    s.name         = "knuckleheads_the_ones_doomed_to_fail"
    s.version      = "1.0.0"
    s.author       = "Kylie Camp"
    s.email        = "chiixil.84@gmail.com"
    s.homepage     = "https://github.com/roastpotential"
    s.summary      = "Cute, fun game with some nerds to play! :)"
    s.description  = File.read(File.join(File.dirname(__FILE__), 'README.txt'))
    s.licenses     = ['MIT']
  
    s.files         = Dir["{bin,lib,spec}/**/*"] + %w(LICENSE.txt README.txt)
    s.test_files    = Dir["spec/**/*"]
    s.executables   = [ 'knuckleheads' ]
  
    s.required_ruby_version = '>=1.9'
    s.add_development_dependency 'rspec', '~> 2.8', '>= 2.8.0'
  end  