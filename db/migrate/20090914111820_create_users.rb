class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table "users", :force => true do |t|
      t.string   :login, :remember_token, :crypted_password, :salt, :limit => 40
      t.datetime :remember_token_expires_at
      t.timestamps
    end
    add_index :users, :login, :unique => true

    User.create!(:login => 'admin', :password => '55xiaoyou')
  end

  def self.down
    drop_table "users"
  end
end
