class JobsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_job, only: [ :show, :edit, :update, :destroy]


  def index
  	@jobs = Job.all
  end

  def new
  	@job = current_user.jobs.new
  end

  def create
  	@job = current_user.jobs.new(job_params)

  	if @job.save
  		redirect_to jobs_path, notice: 'Successfully created Job'
  	else
  		render :new
  	end
  end

  def show
  end

  def edit
  	
  end

  def update
  	if @job.update(job_params)
  		redirect_to user_job_path(current_user,@job), notice:'Successfully updated Job'
  	else
  		render :edit
  	end
  end

  def destroy
  	@job.destroy
  	redirect_to jobs_path
  end

  private

  def set_job
    @job = Job.find(params[:id])
  end

  def job_params
  	params.require(:job).permit(:name, :location, :description,:deadline)
  end
end
