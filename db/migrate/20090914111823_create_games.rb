class CreateGames < ActiveRecord::Migration
  def self.up
    create_table :games do |t|
      t.string :name, :null => false, :size => 20, :comment => '名称'
      t.string :description, :size => 500, :comment => '描述'
      t.string :url, :null => false, :size => 50, :comment => '地址'
      t.integer :creator_id, :null => false, :comment => '创建人'
      t.integer :modifier_id, :null => false, :comment => '修改人'

      t.timestamps
    end
  end

  def self.down
    drop_table :games
  end
end
