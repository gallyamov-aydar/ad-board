class CreateAds < ActiveRecord::Migration[5.1]
  def change
    create_table :ads do |t|
      t.string :name
      t.string :text

      t.timestamps
    end
  end
end
