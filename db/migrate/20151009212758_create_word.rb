class CreateWord < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.belongs_to :keyword
      t.string :name, null: false
      t.timestamps null: false
    end
  end
end
