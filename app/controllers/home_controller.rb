class HomeController < ApplicationController

   #before_action :authenticate_user!


	def index
	end

	def about
	end

	def schedule
	end

	def events
		@event=Event.all();
		#byebug;

	end

	def team
	end

	def Contact
	end

	
end
