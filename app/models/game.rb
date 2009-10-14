class Game < ActiveRecord::Base
  default_scope :order => 'id desc'

  #创建人,修改人
  belongs_to :creator, :class_name => "User"
  belongs_to :modifier, :class_name => "User"

  validates_presence_of :name, :url, :description
  validates_length_of :name, :maximum => 20, :allow_nil => true
  validates_length_of :url, :maximum => 100, :allow_nil => true
  validates_length_of :description, :maximum => 500, :allow_nil => true

  has_attached_file :photo, :url => "/:attachment/:class/:id_:style.:extension",
    :default_url => "/images/:class/default_:style.jpg",
    :path => ":rails_root/public/:attachment/:class/:id_:style.:extension",
    :styles => {:normal => "120x90#", :mini => "60x45#"}

  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png', 'image/gif']
  validates_attachment_size :photo, :less_than => 1.megabytes

  named_scope :popular, :limit => 12, :order => "views desc"
  named_scope :limit, lambda {|limit|
    {:limit => limit}
  }

  def self.per_page
    20
  end
end
