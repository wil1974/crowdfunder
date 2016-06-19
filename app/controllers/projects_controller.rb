class ProjectsController < ApplicationController
  def index
    @projects = Project.all

    #take the 1st 4 entries of Project table
    @displayed_projects = Project.take(4)
  end
end
