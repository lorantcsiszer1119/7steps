class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
#  def index
#    @users = User.all
#  end

  # GET /users/1
  # GET /users/1.json
#  def show
#  end

  # GET /users/new
  def new
    @opening = Opening.new
    #commented out because I put it on the application controller: the form for new user is in every page.
    #@user = User.new
  end

  # GET /users/1/edit
#  def edit
#  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        # Tell the UserMailer to send a welcome Email after save
        UserMailer.welcome_email(@user).deliver
        UserMailer.notify_anto(@user).deliver
        format.html { redirect_to :back, notice: "Done! Check your inbox! (and Spam just in case)" }
        #format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { redirect_to :back, notice: 'Something went wrong, please try again!' }
        #format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to :back, notice: 'Changes Saved.' }
        format.json { head :no_content }
      else
        format.html { redirect_to :back, notice: 'Something went wrong.' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
#  def destroy
#    @user.destroy
#    respond_to do |format|
#      format.html { redirect_to users_url }
#      format.json { head :no_content }
#    end
#  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :q_and_a_link, :li_link, :by_link, :qa_link)
    end

    def generate_templates
      @user.generate_drive_templates
    end
end
