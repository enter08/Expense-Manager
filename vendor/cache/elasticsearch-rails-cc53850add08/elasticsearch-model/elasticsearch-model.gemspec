# -*- encoding: utf-8 -*-
# stub: elasticsearch-model 0.1.1 ruby lib

Gem::Specification.new do |s|
  s.name = "elasticsearch-model"
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Karel Minarik"]
  s.date = "2014-04-25"
  s.description = "ActiveModel/Record integrations for Elasticsearch."
  s.email = ["karel.minarik@elasticsearch.org"]
  s.extra_rdoc_files = ["README.md", "LICENSE.txt"]
  s.files = [".gitignore", "CHANGELOG.md", "Gemfile", "LICENSE.txt", "README.md", "Rakefile", "elasticsearch-model.gemspec", "examples/activerecord_article.rb", "examples/activerecord_associations.rb", "examples/couchbase_article.rb", "examples/datamapper_article.rb", "examples/mongoid_article.rb", "examples/ohm_article.rb", "examples/riak_article.rb", "gemfiles/3.0.gemfile", "gemfiles/4.0.gemfile", "lib/elasticsearch/model.rb", "lib/elasticsearch/model/adapter.rb", "lib/elasticsearch/model/adapters/active_record.rb", "lib/elasticsearch/model/adapters/default.rb", "lib/elasticsearch/model/adapters/mongoid.rb", "lib/elasticsearch/model/callbacks.rb", "lib/elasticsearch/model/client.rb", "lib/elasticsearch/model/ext/active_record.rb", "lib/elasticsearch/model/importing.rb", "lib/elasticsearch/model/indexing.rb", "lib/elasticsearch/model/naming.rb", "lib/elasticsearch/model/proxy.rb", "lib/elasticsearch/model/response.rb", "lib/elasticsearch/model/response/base.rb", "lib/elasticsearch/model/response/pagination.rb", "lib/elasticsearch/model/response/records.rb", "lib/elasticsearch/model/response/result.rb", "lib/elasticsearch/model/response/results.rb", "lib/elasticsearch/model/searching.rb", "lib/elasticsearch/model/serializing.rb", "lib/elasticsearch/model/version.rb", "test/integration/active_record_associations_parent_child.rb", "test/integration/active_record_associations_test.rb", "test/integration/active_record_basic_test.rb", "test/integration/active_record_custom_serialization_test.rb", "test/integration/active_record_import_test.rb", "test/integration/active_record_namespaced_model_test.rb", "test/integration/active_record_pagination_test.rb", "test/integration/mongoid_basic_test.rb", "test/test_helper.rb", "test/unit/adapter_active_record_test.rb", "test/unit/adapter_default_test.rb", "test/unit/adapter_mongoid_test.rb", "test/unit/adapter_test.rb", "test/unit/callbacks_test.rb", "test/unit/client_test.rb", "test/unit/importing_test.rb", "test/unit/indexing_test.rb", "test/unit/module_test.rb", "test/unit/naming_test.rb", "test/unit/proxy_test.rb", "test/unit/response_base_test.rb", "test/unit/response_pagination_test.rb", "test/unit/response_records_test.rb", "test/unit/response_result_test.rb", "test/unit/response_results_test.rb", "test/unit/response_test.rb", "test/unit/searching_search_request_test.rb", "test/unit/searching_test.rb", "test/unit/serializing_test.rb"]
  s.homepage = "https://github.com/elasticsearch/elasticsearch-rails/"
  s.licenses = ["Apache 2"]
  s.rdoc_options = ["--charset=UTF-8"]
  s.rubygems_version = "2.2.1"
  s.summary = "ActiveModel/Record integrations for Elasticsearch."
  s.test_files = ["test/integration/active_record_associations_parent_child.rb", "test/integration/active_record_associations_test.rb", "test/integration/active_record_basic_test.rb", "test/integration/active_record_custom_serialization_test.rb", "test/integration/active_record_import_test.rb", "test/integration/active_record_namespaced_model_test.rb", "test/integration/active_record_pagination_test.rb", "test/integration/mongoid_basic_test.rb", "test/test_helper.rb", "test/unit/adapter_active_record_test.rb", "test/unit/adapter_default_test.rb", "test/unit/adapter_mongoid_test.rb", "test/unit/adapter_test.rb", "test/unit/callbacks_test.rb", "test/unit/client_test.rb", "test/unit/importing_test.rb", "test/unit/indexing_test.rb", "test/unit/module_test.rb", "test/unit/naming_test.rb", "test/unit/proxy_test.rb", "test/unit/response_base_test.rb", "test/unit/response_pagination_test.rb", "test/unit/response_records_test.rb", "test/unit/response_result_test.rb", "test/unit/response_results_test.rb", "test/unit/response_test.rb", "test/unit/searching_search_request_test.rb", "test/unit/searching_test.rb", "test/unit/serializing_test.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<elasticsearch>, ["> 0.4"])
      s.add_runtime_dependency(%q<activesupport>, ["> 3"])
      s.add_runtime_dependency(%q<hashie>, [">= 0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.3"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<elasticsearch-extensions>, [">= 0"])
      s.add_development_dependency(%q<sqlite3>, [">= 0"])
      s.add_development_dependency(%q<activemodel>, ["> 3.0"])
      s.add_development_dependency(%q<activerecord>, ["> 4.0"])
      s.add_development_dependency(%q<oj>, [">= 0"])
      s.add_development_dependency(%q<kaminari>, [">= 0"])
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
      s.add_development_dependency(%q<coveralls>, [">= 0"])
    else
      s.add_dependency(%q<elasticsearch>, ["> 0.4"])
      s.add_dependency(%q<activesupport>, ["> 3"])
      s.add_dependency(%q<hashie>, [">= 0"])
      s.add_dependency(%q<bundler>, ["~> 1.3"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<elasticsearch-extensions>, [">= 0"])
      s.add_dependency(%q<sqlite3>, [">= 0"])
      s.add_dependency(%q<activemodel>, ["> 3.0"])
      s.add_dependency(%q<activerecord>, ["> 4.0"])
      s.add_dependency(%q<oj>, [">= 0"])
      s.add_dependency(%q<kaminari>, [">= 0"])
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
      s.add_dependency(%q<coveralls>, [">= 0"])
    end
  else
    s.add_dependency(%q<elasticsearch>, ["> 0.4"])
    s.add_dependency(%q<activesupport>, ["> 3"])
    s.add_dependency(%q<hashie>, [">= 0"])
    s.add_dependency(%q<bundler>, ["~> 1.3"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<elasticsearch-extensions>, [">= 0"])
    s.add_dependency(%q<sqlite3>, [">= 0"])
    s.add_dependency(%q<activemodel>, ["> 3.0"])
    s.add_dependency(%q<activerecord>, ["> 4.0"])
    s.add_dependency(%q<oj>, [">= 0"])
    s.add_dependency(%q<kaminari>, [">= 0"])
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
    s.add_dependency(%q<coveralls>, [">= 0"])
  end
end
