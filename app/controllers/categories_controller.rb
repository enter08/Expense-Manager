class CategoriesController < ApplicationController

	def index
	end

	def show
	end

	def customize
		@categories = Category.all.sort{|x,y| counts(y.id) <=> counts(x.id)}
	end

	def counts(category_id)
		@expenses1 = current_user.expenses
		@categories1 = Category.all
		@categories1.each do |sorted_categories|
			@sorted_categories = @expenses1.where(category_id: category_id).count
		end
		return @sorted_categories
	end

	def update
	    @category = Category.find(params[:id])
	    @category.toggle(:active)
	    @category.update(category_params)
	    redirect_to categories_customize_path
	end

	def update_multiple
    	@categs = Categ.find(params[:categories_ids])
    	@categs.update(category_params)
    	redirect_to expenses_path
		#Category.update_all params[:categories_ids]
	end

	def score
	    Category.update_all({active: false}, {id: params[:category_ids]} )

  	end

	private
	
	def category_params
		params.permit(:id, :name, :active)
	end
end