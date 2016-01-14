require "date"

class Order < ActiveRecord::Base
  belongs_to :user

  def formatted_date
    self.created_at.strftime("%B %e, %Y")
  end
end
