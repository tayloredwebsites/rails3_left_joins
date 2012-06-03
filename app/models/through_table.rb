class ThroughTable < ActiveRecord::Base
  belongs_to :through_reference
  belongs_to :lookup
  attr_accessible :description, :through_reference_id, :lookup_id
end
