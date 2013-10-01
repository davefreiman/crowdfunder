class Pledge < ActiveRecord::Base
  attr_accessible :amount, :project, :user_id
end
