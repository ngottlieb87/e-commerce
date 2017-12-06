class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    account = Account.new
    if @user.save
      flash[:notice] = "You've successfully signed up!"
      session[:user_id] = @user.id
      account.user_id = @user.id
      account.save
      redirect_to products_path
      # respond_to do |format|
      #   format.html { redirect_to '/' }
      #   format.js
      # end
    else
      flash[:alert] = "There was a problem signing up."
      redirect_to '/signup'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :admin, :password, :password_confirmation)
  end
end
