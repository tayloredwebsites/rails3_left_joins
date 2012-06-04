class ThroughReference < ActiveRecord::Base
  has_many :through_tables
  has_many :lookups, :through => :through_tables
  attr_accessible :description
end
