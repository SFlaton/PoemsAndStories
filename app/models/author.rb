class Author < ActiveRecord::Base
  has_many :poems, :short_stories
end
