class Words < ActiveRecord::Migration
  def change
    create_table :words do |t|
      #t.belongs_to :keywords
      t.string :name, null: false
      t.timestamps null: false
    end
    add_reference :words, :keywords, index: true, foreign_key: true
  end
end
