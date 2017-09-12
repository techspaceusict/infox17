# Project For Techspace
  # Code Verifed Date : 10/09/2017
  # Programmers : Mainsh, Navin
  # Developers : Jeevan Prakash Pant, Prabhanshu Gupta
  # Checked, standardized and Verified by : Jeevan Prakash Pant, Prabhanshu Gupta
  # Check No. 9722
  # For any changes  or queries contact <jeevanppant@gmail.com><guptaprabhanshu1@gmail.com>
  #
  # NOTE: Any progarmmer/coder who needs to make changes in this file should contact Developers
  #
  # REMARK : Custom Login marked as not required

class HomeController < ApplicationController

  #before_action :authenticate_user!

  layout 'techspace'

	def index
	end

  def oindex
  end

	def about
	end

  def oabout
  end

	def schedule
	end

  def oschedule
	end

	def events
		@event=Event.all();
		#byebug;
	end

  def oevents
		@event=Event.all();
		#byebug;
	end

	def sponsors
	end

  def oSponsors
	end

	def contact
	end

  def oContact
	end

    def team
    end

    def dummy
    end

end
