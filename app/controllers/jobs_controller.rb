class JobsController < ApplicationController

  def index
    job = Job.new

    page = (params[:page] || 1).to_i
    per_page = 10

  	response = job.jobs(page, per_page)

  	if response 
  	  # process if internet connection present
      @total_count = response['totalresults'].to_i

      puts response['results']['result'].inspect

      @jobs = response['results']['result']
      @paginator = @jobs.paginate(page, per_page, @total_count)
      @start = response['start'].to_i
    else
      # when no internet connection apply these settings to display blank jobs page
      # error message displayed to user advising jobs not displayed due to no internet connection
      @total_count = 0
      @jobs = []
      @paginator = @jobs.paginate(1, 1, 1)
      @start = []
      respond_to do |format|
      	# redirect user to user index page when no internet connection detected
      	# display the below error notice to the user in _nav.html.erb 
        format.html { redirect_to users_path, notice: 'No internet connection detected to display job listing.' }
      end
    end
  end
end
