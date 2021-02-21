class AdminController < ApplicationController

  def index
    @companies = Company.all.order("created_at DESC")
    @jobs = Job.all.order("created_at DESC")
  end

end
