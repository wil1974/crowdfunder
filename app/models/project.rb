# == Schema Information
#
# Table name: projects
#
#  id                :integer          not null, primary key
#  user_id           :integer
#  name              :string
#  short_description :text
#  description       :text
#  image_url         :string
#  status            :string           default("pending")
#  goal              :decimal(8, 2)
#  expiration_date   :datetime
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Project < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  belongs_to  :user
  has_many  :rewards

  before_validation :start_project, :on => :create

  validates :name, :short_description, :description, :image_url,
            :expiration_date, :goal, presence: true

  after_create :charge_backers_if_funded

  #Pledge and Projects table dont have any relationship.
  #so we need to create a new method to map both methods
  def pledges
    rewards.flat_map(&:pledges)
  end

  #fetch all pledges and sums them
  def total_backed_amount
    pledges.map(&:amount).inject(0, :+)
  end

  #check/update project status
  def funded?
    status == "funded"
  end

  def expired?
    status == "expired"
  end

  def cancelled?
    status == "cancelled"
  end

  def funded!
    update(status: "funded")
  end

  def expired!
    update(status: "expired")
    void_pledges
  end

  def cancelled!
    update(status: "cancelled")
    void_pledges
  end

  private
  #change project's pledge status to "VOID"
  def void_pledges
    self.pledges.each { |p| p.void!}
  end

  def start_project
    self.expiration_date = 1.month.from_now
  end

  #execute charge_backers_job.rb  once expiration date reached.
  # Note that we're passing the project's id to this method.
  def charge_backers_if_funded
    ChargeBackersJob.set(wait_util: self.expiration_date).perform_later self.id
  end

  #projects might have same name, so create a new name when projectname already exists
  def slug_candidates
    [
      :name,
      [:name, :created_at]
    ]
  end
end
