class FkReference < ActiveRecord::Base
  belongs_to :lookup
  attr_accessible :description
end
