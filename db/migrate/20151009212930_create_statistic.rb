class CreateStatistic < ActiveRecord::Migration
  def change
    create_table :statistics do |t|
      
      t.belongs_to :words

      t.integer :adw_top
      t.integer :adw_right
      t.integer :adw_total
      t.string  :top_urls
      t.string  :left_urls
      t.integer :non_adw
      t.string  :urls_non_adw
      t.integer :links_total
      t.integer :total_results
      
    end
  end
end