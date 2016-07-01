class RewardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project
  before_action :set_reward, except: [:new, :create]

  def new
    @reward = @project.rewards.build
    respond_to do |format|
      format.html
    end
  end

  def create
    @reward = @project.rewards.build(reward_params)
    respond_to do |format|
      if @reward.save
        format.html { redirect_to @project, notice: "Reward added successfully"}
      else
        format.html { render :new}
      end
    end
  end

  def edit

  end

  def update
    respond_to do |format|
      if @reward.update(reward_params)
        format.html { redirect_to @project, notice: "Reward updated successfully"}
      else
        format.html { render :edit}
      end
    end
  end

  def destroy
    @reward.destroy
    respond_to do |format|
      format.html { redirect_to projects_path(@project), notice: "Reward deleted"}
    end
  end

  private
  def set_project
    @project = Project.friendly.find(params[:project_id])
  end

  def reward_params
    params.require(:reward).permit(:name, :description, :value, :shipping,
            :number_available, :estimated_delivery)
  end

  def set_reward
    @reward = @project.rewards.find(params[:id])
  end
end
