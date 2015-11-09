Gem::Specification.new do |s|
  s.name        = 'patodo'
  s.version     = '0.1.1'
  s.summary     = 'Console application to keep track your todos.'
  s.description = 'Patodo is a console application to keep track your todos.'
  s.authors     = ['Leandro Costantini']
  s.email       = 'costantinileandro1@gmail.com'
  s.homepage    = 'https://github.com/lcostantini/pato-manager'
  s.license     = 'GPL'
  s.files       = ['lib/response_decorator.rb']

  s.executables << 'patodo'

  s.add_runtime_dependency 'httparty',       '~> 0.13'
  s.add_runtime_dependency 'commander',      '~> 4.3'
  s.add_runtime_dependency 'terminal-table', '~> 1.5'
end
