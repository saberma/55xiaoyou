class Game < ActiveRecord::Base
  default_scope :order => 'id desc'

  #创建人,修改人
  belongs_to :creator, :class_name => "User"
  belongs_to :modifier, :class_name => "User"

  validates_presence_of :name, :url, :description
  validates_length_of :name, :maximum => 20, :allow_nil => true
  validates_length_of :url, :maximum => 100, :allow_nil => true
  validates_length_of :description, :maximum => 500, :allow_nil => true

  def self.per_page
    20
  end
end
