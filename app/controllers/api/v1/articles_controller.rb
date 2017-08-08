module API
	module V1
		class ArticlesController < ApplicationController

			def index
				event=Event.all().first;
				puts event
				render json: {status: 'SUCCESS',message: 'Events Loaded', data: event},status: 'ok'
                
				puts "hello"
			end
		end 
	end
end