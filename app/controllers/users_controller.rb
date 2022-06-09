class UsersController < ApplicationController
  # before_action :logged_in_user, only: [:index,:edit, :update]
  before_action :correct_user, only: [:edit, :update]
  before_action :set_user, only: %i[ show edit update destroy ]
  

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
    @user = User.find(params[:id])
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
    log_in @user
    flash[:success] = "Welcome to the Sample App!"
    redirect_to @user
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
  # def destroy
  #   @user.destroy

  #   respond_to do |format|
  #     format.html { redirect_to users_url, notice: "user was successfully destroyed." }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :email, :password,
      :password_confirmation)
      end

  #Confirms a logged-in user.
  def logged_in_user
  unless logged_in?
  store_location
  flash[:danger] = "Please log in."
  redirect_to login_url
  end
  end

  # Confirms the correct user.
  def correct_user
  @user = User.find(params[:id])
  redirect_to (root_url) unless @user == current_user
  end

end
