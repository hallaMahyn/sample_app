class UsersController < ApplicationController
  before_action :signed_in_user, only: [:edit, :update]
  before_action :correct_user,   only: [:edit, :update]


  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # sign_in @user
      flash[:success] = "WELCOME DUDE!!!"
      redirect_to user_path(@user)
    else
      render 'new'
    end
   end

   def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to users_url
  end

   def index
    @users = User.paginate(page:params[:page])
   end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

  def admin_user
    redirect_to(root_url) unless current_user.admin?

  end
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

 
   def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end
end
