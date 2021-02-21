class JobsController < ApplicationController
  before_action :find_job, only: [:show, :edit, :update, :destroy]

  def index
    if params[:company].blank?
      @jobs = Job.all.order("created_at DESC")
      p('======================', @jobs)
      # @jobs = Job.select(:company).order("created_at DESC").uniq
    else
      # @jobs = Job.where(company: company).order("created_at DESC")
      @jobs = Job.all.order("created_at DESC")
    end
  end

  def show
    # @jobs = Job.where(company: company).order("created_at DESC")
  end

  def new
   @job = Job.new
   p('======================new', @job, params[:format])
  end

  def create
    @job = Job.new(jobs_params)
    p('======================save', @job)
    if @job.save
      redirect_to @job
    else
      p('======================new')
      render "New"
    end
  end

  def edit
  end

  def update
    p('======================update', @job, @job.update(jobs_params))
    if @job.update(jobs_params)
      p('======================update', @job)
      redirect_to @job
    else
      p('======================Edit')
      render "Edit"
    end
  end

  def destroy
    @job.destroy
    redirect_to root_path
  end

  private
  def jobs_params
    params.require(:job).permit(:title, :description, :salary, :require, :welfare, :is_available, :company_id)
  end

  def find_job
    @job = Job.find(params[:id])
  end
end

