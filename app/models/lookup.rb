class Lookup < ActiveRecord::Base
  has_many :fk_references
  has_many :through_tables
  has_many :through_references, :through => :through_tables
  attr_accessible :name, :value
end
