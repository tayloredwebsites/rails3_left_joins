class FkReference < ActiveRecord::Base
  belongs_to :lookup
  attr_accessible :description, :lookup_id
end
