# Subscriptions Controller
class SubscriptionsController < ApplicationController
  def new
    @project = Project.find(params[:project])
  end

  def new

  end

  def destroy
    
  end
end
