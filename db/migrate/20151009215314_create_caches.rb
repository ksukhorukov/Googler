class CreateCaches < ActiveRecord::Migration
  def change
    create_table :caches do |t|
      t.belongs_to :words
      t.string  :cache
      t.timestamps null: false
    end
  end
end
