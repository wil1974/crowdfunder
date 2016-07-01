class PaymentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project
  before_action :set_reward
  before_action :set_amount
  before_action :set_client_token

  def new
    @pledge = current_user.pledges.build(payment_params)
    @rewards = @project.rewards

    respond_to do |format|
      #check reward value is <= pledge amount
      if @reward && @amount.present? && @reward.value <= @amount
        format.html
      else
        #check problem is lack of pledge amt or pledge <= reward
        if @amount.present?
          flash[:error] = "Pledge Must be greater than the reward"
        else
          flash[:error] = "You must provide an amount"
        end
        format.html { redirect_to new_project_pledge_path(reward: @reward)}
      end
    end
  end

  #Create customer token and save the pledge
  def create
    @pledge = current_user.pledges.build(payment_params)
    #pledge valid and customer_id and braintree token present
    respond_to do |format|
      if @pledge.valid?
        if current_user.customer_id && Braintree::Customer.find(current_user.customer_id)
          @pledge.save
          format.html {redirect_to project_path(@project), notice: "Your pledge was created"}
        else
          #project valid but customer_id or braintree token not present
          #then generate customer token
          result = Braintree::Customer.create(
              :email => current_user.email,
              :payment_method_nonce => params[:payment_method_nonce]
            )
          if result.success?
            @pledge.save
            current_user.update(customer_id: result.customer.id)
            format.html { redirect_to project_path(@project), notice: "Your pledge was created"}
          else
            format.html { render :new}
          end
        end
        #if pledge not valid, new pledge template rendered
      else
        format.html { render :new}
      end
    end
  end

  private
  def set_project
    @project = Project.friendly.find(params[:project_id])
  end

  # From the amount field in pledge form
  def set_amount
    @amount = payment_params[:amount].to_i
  end

  def set_reward
    @reward = @project.rewards.find_by_id(payment_params[:reward_id])
  end

  # generates a new braintree token based on the customer id defined in the user's table
  def set_client_token
    @client_token = Braintree::ClientToken.generate(:customer_id => current_user.customer_id)
  end

  def payment_params
    params.require(:pledge).permit(:reward_id, :name, :amount, :address, :city, :country, :postal_code)
  end
end
