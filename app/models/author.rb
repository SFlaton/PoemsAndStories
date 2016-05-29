class Author < ActiveRecord::Base
  has_many :poems
  has_many :short_stories
  has_and_belongs_to_many :tags
end
