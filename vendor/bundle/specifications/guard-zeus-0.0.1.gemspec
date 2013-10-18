# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "guard-zeus"
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["jonathangreenberg", "Andrew Assarattanakul", "Rob Sharp"]
  s.date = "2012-09-20"
  s.description = "Guard::Zeus automatically manage zeus"
  s.email = ["greenberg@entryway.net", "assarata@gmail.com", "qnm@fea.st"]
  s.homepage = "http://github.com/qnm/guard-zeus"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.23"
  s.summary = "Pushes watched files to Zeus"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<guard>, [">= 0"])
      s.add_runtime_dependency(%q<zeus>, [">= 0"])
      s.add_development_dependency(%q<bundler>, [">= 1.0"])
      s.add_development_dependency(%q<rspec>, [">= 2.0"])
    else
      s.add_dependency(%q<guard>, [">= 0"])
      s.add_dependency(%q<zeus>, [">= 0"])
      s.add_dependency(%q<bundler>, [">= 1.0"])
      s.add_dependency(%q<rspec>, [">= 2.0"])
    end
  else
    s.add_dependency(%q<guard>, [">= 0"])
    s.add_dependency(%q<zeus>, [">= 0"])
    s.add_dependency(%q<bundler>, [">= 1.0"])
    s.add_dependency(%q<rspec>, [">= 2.0"])
  end
end
