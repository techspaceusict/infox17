class EventController < ApplicationController
  
  def event

  	event_id=params[:event_id]
    event_name=params[:event_name]
   current_user.events.create(:event_id=>event_id,:event_name=>event_name); 

   return redirect_to '/events'


  end


  def myevents

  @event=Event.where(:user_id=>current_user.id)


  end



end
