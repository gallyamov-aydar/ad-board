class AddInfoToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :login, :string
    add_column :users, :full_name, :string
    add_column :users, :birthday, :datetime
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :country, :string
    add_column :users, :zip, :string
  end
end