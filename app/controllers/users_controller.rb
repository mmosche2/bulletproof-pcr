class UsersController < ApplicationController


  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to account_path
    else
      render "new"
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to account_path
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to account_path
  end


  private

    def user_params
      params.required(:user).permit(:email, :name, :role, :password, :password_confirmation)
    end

end
