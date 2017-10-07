class WikisController < ApplicationController

  def index
    @wikis = Wiki.all
  end

  def show
    @wiki = Wiki.find(params[:id])
    authorize @wiki
  end

  def new
    @wiki = Wiki.new
    authorize @wiki

  end

  def create

     @wiki = Wiki.new
     wiki = Wiki.find(params[:wiki_id])
     authorize @wiki
     @wiki.title = params[:wiki][:title]
     @wiki.body = params[:wiki][:body]
     if @wiki.save
       flash[:notice] = "wiki was saved."
       redirect_to @wiki
     else
       flash.now[:alert] = "There was an error saving the wiki. Please try again."
       render :new
     end
   end

   	def destroy
   		@wiki = Wiki.find(params[:id])
      authorize @wiki
   		if @wiki.destroy
   			flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
   			redirect_to @wiki.topic
   		else
   			flash.now[:alert] = "There was an error deleting the wiki."
   			render :show
   		end
   	end

   def update
   		@wiki = Wiki.find(params[:id])
      authorize @wiki
   	@wiki.assign_attributes(wiki_params)

   		if @wiki.save
   			flash[:notice] = "wiki was updated."
   			redirect_to [@wiki.topic, @wiki]
   		else
   			flash.now[:alert] = "There was an error saving the wiki. Please try again."
   			render :edit
   		end
   	end

    def edit
		@wiki = Wiki.find(params[:id])
    authorize @wiki
	end


    private

       def wiki_params
         params.require(:wiki).permit(:title, :body)
       end
     end
