class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index,:edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :set_user, only: %i[ show edit update destroy ]
  before_action :admin_user, only: :destroy
  

  # GET /users or /users.json
  def index
    @users = User.where(activated: true).paginate(page: params[:page])
    # @users = User.paginate(page: params[:page], per_page: 5)
    # @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
    @user = User.find(params[:id])

    redirect_to root_url
    #  and return unless FILL_IN

    # @microposts = @user.microposts.paginate(page:
    # params[:page], per_page: 5)
    # debugger
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params) # Not the final implementation!
    if @user.save

      @user.send_activation_email
      flash[:info] = "Please check your email to activate your
      account."
      redirect_to root_url

      # UserMailer.account_activation(@user).deliver_now
      # flash[:info] = "Please check your email to activate your
      # account."
      # redirect_to root_url

      # log_in @user
      # flash[:success] = "Welcome to the Sample App!"
      # redirect_to @user
    else
    render 'new'
    end
  end


  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end


  # PATCH/PUT /users/1 or /users/1.json
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
      # Handle a successful update.
    else
    render 'edit'
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  #Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:name, :email, :password,
    :password_confirmation)
  end

  # Confirms the correct user.
  def correct_user
    @user = User.find(params[:id])
    redirect_to (root_url) unless @user == current_user
  end

  # Confirms an admin user.
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end
end
