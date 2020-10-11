class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: :show
  
  
  def show
    @user = User.find(params[:id])
  end

  def update
  end



  private
    def user_params
      params.require(:user).permit(:name, :email, :image, :introduction)
    end


end
