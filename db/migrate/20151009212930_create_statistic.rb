class CreateStatistic < ActiveRecord::Migration
  def change
    create_table :statistics do |t|
      
      t.belongs_to :keyword
      t.belongs_to :user

      t.integer :adw_top, null: false
      t.integer :adw_right, null: false
      t.integer :adw_total, null: false
      t.string  :top_urls, null: false
      t.string  :right_urls, null: false
      t.integer :non_adw, null: false
      t.string  :urls_non_adw, null: false
      t.integer :links_total, null: false
      t.string  :total_results, null: false
      t.string  :word, null: false
        
    end
  end
end