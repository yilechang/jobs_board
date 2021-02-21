class VistController < ApplicationController

  def index
    @companies = Company.all.order("created_at DESC")
    @jobs = Job.where(is_available: 1).order("created_at DESC")
  end

end
