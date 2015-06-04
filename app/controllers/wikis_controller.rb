class WikisController < ApplicationController
  def index
    @wikis = Wiki.visible_to(current_user)
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
     @wiki = Wiki.new(wiki_params)
     @wiki.user = current_user
     authorize @wiki
     if @wiki.save
       flash[:notice] = "Wiki was saved."
       redirect_to @wiki
     else
       flash[:error] = "There was an error saving your wiki. Please try again."
       render :new
     end
   end

  def edit
    @wiki = Wiki.find(params[:id])
    @users = User.all
    authorize @wiki
  end

  def update
    @wiki = Wiki.find(params[:id])
    authorize @wiki
    if @wiki.update_attributes(wiki_params)
      flash[:notice] = "Wiki was updated successfully."
      redirect_to @wiki
    else
      flash[:error] = "There was a problem updating your wiki. Please try again."
      render :edit
    end
  end

  private 

  def wiki_params
    params.require(:wiki).permit(:title, :body, :private)
  end
end
