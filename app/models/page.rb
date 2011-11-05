class Page < ActiveRecord::Base
  belongs_to :space
  belongs_to :user
  belongs_to :last_editor


  def to_param
    "#{id}-#{title.parameterize}"
  end


end
