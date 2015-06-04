class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def downgrade 
    current_user.update_attribute(:role, 'standard')
    
    current_user.wikis.each do |wiki|
      wiki.update_attribute(:private, false)
    end

    redirect_to root_path
  end

   private

  def user_params
    params.require(:user).permit(:id, :name, :email, :role)
  end

  def wiki_params(wiki)
    params.require(:wiki).permit(:private)
  end  
end
