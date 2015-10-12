module Api
 class BaseController < ApplicationController

    before_action :doorkeeper_authorize!

    private
    
      def current_user_doorkeeper
        @current_user ||= User.find(doorkeeper_token.resource_owner_id)
      end

  end
end