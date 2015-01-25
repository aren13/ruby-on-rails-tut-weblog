class ArticlesController < ApplicationController
	
	def index
		@articles = Article.all
	end

	def new
		@article = Article.new
	end

	def edit
		@article = Article.find(params[:id])
	end

	def create
		#render plain: params[:article].inspect
		@article = Article.new(article_params)

		if @article.save
    		redirect_to @article
  		else
    		render 'new'
  		end
  		#Notice that inside the create action we use render instead of redirect_to when save returns false. The render method is used so that the @article object is passed back to the new template when it is rendered. This rendering is done within the same request as the form submission, whereas the redirect_to will tell the browser to issue another request.	
	end

	def update
  		@article = Article.find(params[:id])
 
  		if @article.update(article_params)
    		redirect_to @article
  		else
    		render 'edit'
  		end
	end

	def show
		@article = Article.find(params[:id])
	end


	private
		def article_params
			params.require(:article).permit(:title, :text)
		end
end

#A frequent practice is to place the standard CRUD actions in each
#controller in the following order: index, show, new, edit, create, update
#and destroy. You may use any order you choose, but keep in mind that these
#are public methods; as mentioned earlier in this guide, they must be placed
#before any private or protected method in the controller in order to work.

