class CreateCache < ActiveRecord::Migration
  def change
    create_table :caches do |t|
      t.belongs_to :statistic
      t.text  :cache, null: false
      t.timestamps null: false
    end
  end
end
