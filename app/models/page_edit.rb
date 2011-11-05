class PageEdit < ActiveRecord::Base
  belongs_to :user
  belongs_to :page
  belongs_to :space
end
