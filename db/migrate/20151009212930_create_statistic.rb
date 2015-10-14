class CreateStatistic < ActiveRecord::Migration
  def change
    create_table :statistics do |t|
      
      t.belongs_to :keyword
      t.belongs_to :user

      t.integer :adw_top
      t.integer :adw_right
      t.integer :adw_total
      t.string  :top_urls
      t.string  :right_urls
      t.integer :non_adw
      t.string  :urls_non_adw
      t.integer :links_total
      t.string  :total_results
      t.string  :word
        
    end
  end
end