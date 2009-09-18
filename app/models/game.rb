class Game < ActiveRecord::Base
  #创建人,修改人
  belongs_to :creator, :class_name => "User"
  belongs_to :modifier, :class_name => "User"

  def self.per_page
    20
  end
end
