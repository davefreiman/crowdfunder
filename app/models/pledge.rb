class Pledge < ActiveRecord::Base
  attr_accessible :amount, :project, :user_id

  belongs_to :user
  belongs_to :project

  validates :user, :presence => true
  validates :project, :presence => true
  validates :amount, :numericality => {:only_integer => true, :greater_than => 1}


end
