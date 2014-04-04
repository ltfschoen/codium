class SkillsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  before_action :set_user, only: [:new, :create]
  before_action :skill_params, only: [:create]

  # GET /skills
  # GET /skills.json
  def index
	@skills = Skill.all
  end

  # GET /skills/new
  def new
    @skill = Skill.new
  end

  # POST /skills
  def create
    @skill = @user.users_skills.new(skill_params)

    respond_to do |format|
      if @skill.save
        format.html { redirect_to skills_path, notice: 'Skill was successfully created.' }
      else
        format.html { redirect_to skills_path, notice: 'Unable to create skill.' }
      end
    end
  end

  private

    def set_user

        @user = current_user

    end 

    def skill_params
      params.require(:skill).permit(:skill_type, :user_id)
    end
end
