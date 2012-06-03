class Lookup < ActiveRecord::Base
  has_many :fk_references
  attr_accessible :name, :value
end
