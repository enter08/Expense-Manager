module Searchable
	extend ActiveSupport::Concern
	included do		
		include Elasticsearch::Model

		   # settings index: {} do
    #   mapping do
    #     indexes :ingredients, type: 'multi_field' do
    #       indexes :ingredients
    #       indexes :tokenized, analyzer: 'simple'
    #     end

    #     indexes :manufacturers, type: 'multi_field' do
    #       indexes :manufacturers
    #       indexes :tokenized, analyzer: 'simple'
    #     end

    #     indexes :category, type: 'string'

    #   end
    # end


	  def as_indexed_json(options={})
	    self.as_json(
	      include: { category:               { only: :name },
	                 location: 		           { only: :name }
	               })
	  end



	  def self.search(query)

	    @search_definition = {

	      query: {},

	      filter: {},

	      facets: {}
	    }

	    unless query.blank?
	      @search_definition[:query] = {
	        bool: {
	          should: [
	            { match: { description: query } },
	            { fuzzy: { description: query } }
	          ]
	        }
	      }
	    else 
	      @search_definition[:query] = { match_all: {} }
	    end

	    # if options[:category]
	    #   #f = { term: { categories: options[:category] } }
	    # end

	    __elasticsearch__.search(@search_definition)

	  end
	end
end