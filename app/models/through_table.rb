class ThroughTable < ActiveRecord::Base
  belongs_to :through_reference
  belongs_to :lookup
  attr_accessible :description
end
