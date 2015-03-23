# -*- encoding: utf-8 -*-
# stub: assetdispatch 0.0.6 ruby lib

Gem::Specification.new do |s|
  s.name = "assetdispatch"
  s.version = "0.0.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["devlin zed"]
  s.date = "2014-04-29"
  s.description = "Organize your assets by controller and action."
  s.email = ["me@devlinzed.com"]
  s.files = [".gitignore", "Gemfile", "README.md", "Rakefile", "UNLICENSE.md", "assetdispatch.gemspec", "lib/assetdispatch.rb", "lib/assetdispatch/controller_helpers.rb", "lib/assetdispatch/engine.rb", "lib/assetdispatch/version.rb", "lib/assetdispatch/view_helpers.rb", "lib/assets/javascripts/assetdispatch.js"]
  s.homepage = "http://git.devlinzed.com/assetdispatcher/about/"
  s.licenses = ["Public domain"]
  s.rubygems_version = "2.2.0"
  s.summary = "Organize your assets by controller and action."

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, ["~> 1.6"])
      s.add_development_dependency(%q<rake>, [">= 0"])
    else
      s.add_dependency(%q<bundler>, ["~> 1.6"])
      s.add_dependency(%q<rake>, [">= 0"])
    end
  else
    s.add_dependency(%q<bundler>, ["~> 1.6"])
    s.add_dependency(%q<rake>, [">= 0"])
  end
end
