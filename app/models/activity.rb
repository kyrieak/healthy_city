class Activity < ActiveRecord::Base
  attr_accessible :description, :icon_id, :label, :user_id

  validates_presence_of :user_id
  validates_presence_of :icon_id
  validates_presence_of :label

  belongs_to :user
  belongs_to :icon
  has_many :completions

  delegate :filename, :to => :icon

  def completion(date)
    self.completions.where(:date => date) ? (:done) : (:not_done)
  end

end