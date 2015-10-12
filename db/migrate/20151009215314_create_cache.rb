class CreateCache < ActiveRecord::Migration
  def change
    create_table :caches do |t|
      t.belongs_to :statistic
      t.text  :cache
      t.timestamps null: false
    end
  end
end
