class CacheController < ApplicationController

  def show
    @cache_object = Cache.find(params[:id])
    render html: @cache_object.cache.html_safe, layout: false
  end

end
