class CompaniesController < ApplicationController
  before_action :find_company, only: [:show, :edit, :update, :destroy]

  def index
    if params[:company].blank?
      @companies = Company.all.order("created_at DESC")
    else
      @companies = Company.where(company: company).order("created_at DESC")
    end
  end

  def show
    @jobs = Job.where(company: params[:id], is_available: 1).order("created_at DESC")
  end

  def new
   @company = Company.new
  end

  def create
    @company = Company.new(companies_params)
    if @company.save
      redirect_to @company
    else
      render "New"
    end
  end

  def edit
  end

  def update
    if @company.update(companies_params)
      redirect_to @company
    else
      render "Edit"
    end
  end

  def destroy
    @company.destroy
    redirect_to root_path
  end

  private
  def companies_params
    params.require(:company).permit(:title, :description, :idea, :report, :salary)
  end

  def find_company
    @company = Company.find(params[:id])
  end
end

