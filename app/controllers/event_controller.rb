class EventController < ApplicationController
  
  layout 'techspace'
  
  def event
  	id=params[:id]
    @event=Event.find_by_Event_id(id);
    

    if current_user
      @user=Registration.where(:user_id=>current_user.id,:event_id=>@event.id).first;
    end
    
    #byebug;
  end


  def myevents
   @event=Registration.where(:user_id=>current_user.id);
  end

  def addinfoxevent

  end

  def addevents

  id = params[:Event_id]
  name = params[:Event_name]
  detail = params[:Event_detail]
  user=params[:user]
  time = user["Event_time"]
  date = user["Event_date"]
  image = params[:image]
  organizer1name = params[:organizer1_name]
  organizer1phone = params[:organizer1_phone]
  organizer2name = params[:organizer2_name]
  organizer2phone = params[:organizer2_phone]
  facebooklink = params[:facebook_link]
  ven=params[:venue]
  new_filename = name + "." + image.original_filename.split(".")[1]
 
  File.open(Rails.root.join('public', 'uploads', new_filename), 'wb') do |file|
  file.write(image.read)
  end

    Event.create(:Event_id=>id,:Name=>name,:about=>detail,:image=>new_filename,:facebook_link =>facebooklink,:organizer1_name=>organizer1name,:organizer1_phone=>organizer1phone,:organizer2_name=>organizer2name,:organizer2_phone=>organizer2phone,:venue=>ven,:date=>date,:time=>time);

    return redirect_to '/events'


  end

  def eventregister

    id=params[:Event_id]
    event=Event.find_by_Event_id(id);
   # byebug;
    Registration.create(:user_id=>current_user.id,:event_id=>event.id);
    return redirect_to '/events'

    #byebug;
  end

 def eventquery

 name=params["name"]
 email=params["email"]
 query=params["query"]


Query.create(:name=>name,:email=>email,:message=>query);
return redirect_to '/';


 end

end
