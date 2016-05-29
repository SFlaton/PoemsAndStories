class Tag < ActiveRecord::Base
  has_and_belongs_to_many :poems
  has_and_belongs_to_many :short_stories
  has_and_belongs_to_many :authors
end
