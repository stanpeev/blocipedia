class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def downgrade 
    current_user.update_attribute(:role, 'standard')
    redirect_to root_path
  end

   private

  def user_params
    params.require(:user).permit(:id, :email, :role)
  end
end
