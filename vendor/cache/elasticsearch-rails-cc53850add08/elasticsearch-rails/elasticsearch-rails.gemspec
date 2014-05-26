# -*- encoding: utf-8 -*-
# stub: elasticsearch-rails 0.1.1 ruby lib

Gem::Specification.new do |s|
  s.name = "elasticsearch-rails"
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Karel Minarik"]
  s.date = "2014-04-25"
  s.description = "Ruby on Rails integrations for Elasticsearch."
  s.email = ["karel.minarik@elasticsearch.org"]
  s.extra_rdoc_files = ["README.md", "LICENSE.txt"]
  s.files = [".gitignore", "CHANGELOG.md", "Gemfile", "LICENSE.txt", "README.md", "Rakefile", "elasticsearch-rails.gemspec", "lib/elasticsearch/rails.rb", "lib/elasticsearch/rails/instrumentation.rb", "lib/elasticsearch/rails/instrumentation/controller_runtime.rb", "lib/elasticsearch/rails/instrumentation/log_subscriber.rb", "lib/elasticsearch/rails/instrumentation/publishers.rb", "lib/elasticsearch/rails/instrumentation/railtie.rb", "lib/elasticsearch/rails/lograge.rb", "lib/elasticsearch/rails/tasks/import.rb", "lib/elasticsearch/rails/version.rb", "lib/rails/templates/01-basic.rb", "lib/rails/templates/02-pretty.rb", "lib/rails/templates/03-expert.rb", "lib/rails/templates/articles.yml.gz", "lib/rails/templates/index.html.erb", "lib/rails/templates/indexer.rb", "lib/rails/templates/search.css", "lib/rails/templates/searchable.rb", "lib/rails/templates/seeds.rb", "test/test_helper.rb", "test/unit/instrumentation/instrumentation_test.rb", "test/unit/instrumentation/lograge_test.rb"]
  s.homepage = "https://github.com/elasticsearch/elasticsearch-rails/"
  s.licenses = ["Apache 2"]
  s.rdoc_options = ["--charset=UTF-8"]
  s.rubygems_version = "2.2.1"
  s.summary = "Ruby on Rails integrations for Elasticsearch."
  s.test_files = ["test/test_helper.rb", "test/unit/instrumentation/instrumentation_test.rb", "test/unit/instrumentation/lograge_test.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, ["~> 1.3"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<elasticsearch-extensions>, [">= 0"])
      s.add_development_dependency(%q<oj>, [">= 0"])
      s.add_development_dependency(%q<rails>, ["> 3.0"])
      s.add_development_dependency(%q<lograge>, [">= 0"])
      s.add_development_dependency(%q<minitest>, ["~> 4.0"])
      s.add_development_dependency(%q<shoulda-context>, [">= 0"])
      s.add_development_dependency(%q<mocha>, [">= 0"])
      s.add_development_dependency(%q<turn>, [">= 0"])
      s.add_development_dependency(%q<yard>, [">= 0"])
      s.add_development_dependency(%q<ruby-prof>, [">= 0"])
      s.add_development_dependency(%q<pry>, [">= 0"])
      s.add_development_dependency(%q<ci_reporter>, [">= 0"])
      s.add_development_dependency(%q<simplecov>, [">= 0"])
      s.add_development_dependency(%q<cane>, [">= 0"])
      s.add_development_dependency(%q<require-prof>, [">= 0"])
    else
      s.add_dependency(%q<bundler>, ["~> 1.3"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<elasticsearch-extensions>, [">= 0"])
      s.add_dependency(%q<oj>, [">= 0"])
      s.add_dependency(%q<rails>, ["> 3.0"])
      s.add_dependency(%q<lograge>, [">= 0"])
      s.add_dependency(%q<minitest>, ["~> 4.0"])
      s.add_dependency(%q<shoulda-context>, [">= 0"])
      s.add_dependency(%q<mocha>, [">= 0"])
      s.add_dependency(%q<turn>, [">= 0"])
      s.add_dependency(%q<yard>, [">= 0"])
      s.add_dependency(%q<ruby-prof>, [">= 0"])
      s.add_dependency(%q<pry>, [">= 0"])
      s.add_dependency(%q<ci_reporter>, [">= 0"])
      s.add_dependency(%q<simplecov>, [">= 0"])
      s.add_dependency(%q<cane>, [">= 0"])
      s.add_dependency(%q<require-prof>, [">= 0"])
    end
  else
    s.add_dependency(%q<bundler>, ["~> 1.3"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<elasticsearch-extensions>, [">= 0"])
    s.add_dependency(%q<oj>, [">= 0"])
    s.add_dependency(%q<rails>, ["> 3.0"])
    s.add_dependency(%q<lograge>, [">= 0"])
    s.add_dependency(%q<minitest>, ["~> 4.0"])
    s.add_dependency(%q<shoulda-context>, [">= 0"])
    s.add_dependency(%q<mocha>, [">= 0"])
    s.add_dependency(%q<turn>, [">= 0"])
    s.add_dependency(%q<yard>, [">= 0"])
    s.add_dependency(%q<ruby-prof>, [">= 0"])
    s.add_dependency(%q<pry>, [">= 0"])
    s.add_dependency(%q<ci_reporter>, [">= 0"])
    s.add_dependency(%q<simplecov>, [">= 0"])
    s.add_dependency(%q<cane>, [">= 0"])
    s.add_dependency(%q<require-prof>, [">= 0"])
  end
end
