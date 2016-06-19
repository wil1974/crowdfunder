class ProjectsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @projects = Project.all

    #take the 1st 4 entries of Project table
    @displayed_projects = Project.take(4)
  end

  def show

  end

  def new
    @project = Project.new
  end

  def edit

  end
end
