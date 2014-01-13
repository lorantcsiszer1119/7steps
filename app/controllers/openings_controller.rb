class OpeningsController < ApplicationController
  before_action :set_opening, only: [:show, :edit, :update, :destroy]
  after_action :set_flash_if_guest 


  # GET /openings
  # GET /openings.json
  def index
    @openings = current_or_guest_user.openings
    @opening = Opening.new
  end

  # GET /openings/1
  # GET /openings/1.json
  def show
  end

  # GET /openings/new
  #commented out because the new opening is directly on the index view
  #def new
  # @opening = Opening.new
  #end

  # GET /openings/1/edit
  def edit
    unless @opening.user_id == current_or_guest_user.id
      redirect_to welcome_path, notice: "Please log in to see your progress"
    end
    @step = params[:step].nil? ? @opening.unfinished_step : params[:step].to_i
    @user = current_or_guest_user
  end

  # POST /openings
  # POST /openings.json
  def create
    @opening = Opening.new(opening_params)
    @opening.user_id = current_or_guest_user.id
    @opening.check_step_one
    step = @opening.step_one_finished? ? 2 : 1
    respond_to do |format|
      if @opening.save
        format.html { redirect_to edit_opening_path(@opening, step: step), notice: 'Opening was successfully registered.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /openings/1
  # PATCH/PUT /openings/1.json
  def update
    unless @opening.user_id == current_or_guest_user.id
      redirect_to welcome_path, notice: "Please log in to see your progress"
    end
    respond_to do |format|
      if @opening.update(opening_params)
        check_finished_steps(@opening)
        format.html { redirect_to :back, notice: 'Opening was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { redirect_to :back, notice: 'Something went wrong, please try again.' }
        format.json { render json: @opening.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /openings/1
  # DELETE /openings/1.json
  def destroy
    unless @opening.user_id == current_or_guest_user.id
      redirect_to welcome_path, notice: "Please log in to see your progress"
    end
    @opening.destroy
    respond_to do |format|
      format.html { redirect_to openings_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_opening
      if Opening.where(id: params[:id]).count < 1
        redirect_to welcome_path, notice: "Please log in to see your progress"
      else
        @opening = Opening.find(params[:id])
        if @opening.user_id != current_or_guest_user.id
          redirect_to welcome_path, notice: "Please log in to see your progress"
        end
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def opening_params
      params.require(:opening).permit(:link, :title, :company, :two_reqs_example, :two_reqs_number, :two_reqs_completed, \
        :three_li_photo, :three_li_headline, :three_li_summary, :three_li_specialties, :three_li_work, :three_li_education, \
        :three_li_skills, :three_li_work_others, :three_li_education_others, :three_li_skills_others, :three_li_connections, \
        :three_li_recommendations, :three_li_others, :three_google, :three_by_links, :three_facebook, :three_twitter, \
        :three_social_media, \
        :four_cv_link, :four_cv_format, :four_cv_basic, :four_cv_linkedin, :four_cv_headline, :four_cv_qualifications, \
        :four_cv_work, :four_cv_education, :four_cv_skills, :four_cv_work_others, :four_cv_education_others, :four_cv_skills_others, \
        :five_cl_link, :five_cl_recruiter_name, :five_cl_intro, :five_cl_skills, :five_cl_company_positives, \
        :five_cl_availability, \
        :six_qa_duration, :six_qa_specific, :six_qa_examples, :six_qa_star_method, :six_qa_answers_reqs, \
        :six_qa_strenght, :six_qa_weakness, :six_qa_salary, \
        :seven_essentials, :seven_cl_and_cv, :seven_next_step, :seven_q_three, :seven_q_two, :seven_q_one, \
        :seven_recruiter_background, :seven_recruiter_name)
    end

    # to mark steps as finished when they are
    def check_finished_steps(opening)
      opening.check_step_one
      opening.check_step_two
      opening.check_step_three
      opening.check_step_four
      opening.check_step_five
      opening.check_step_six
      opening.check_step_seven
      opening.save!
    end

    def set_flash_if_guest
      unless user_signed_in?
        flash[:notice] = "Login or Sign Up, don't lose your progress!"
      end
    end



end
