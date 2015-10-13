class Statistic < ActiveRecord::Base
  
  belongs_to :keyword
  belongs_to :user
  has_one :cache

  validates_presence_of :keyword_id, :user_id, :adw_top, :adw_right,
                        :adw_total, :top_urls, :right_urls, :non_adw, 
                        :urls_non_adw, :links_total, :total_results, 
                        :word
        

end
