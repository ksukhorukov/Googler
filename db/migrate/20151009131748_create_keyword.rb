class CreateKeyword < ActiveRecord::Migration
  def change
    create_table :keywords do |t|
      t.belongs_to :user
      t.string :name, null: false, unique: true
      t.string :description, null: false 
      t.string :keys, null: false
      t.timestamps null: false
    end
  end
end
