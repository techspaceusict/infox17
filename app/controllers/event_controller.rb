class EventController < ApplicationController
  
  
  def event
  	id=params[:id]
    @event=Event.find_by_Eventidm(id);
    

    if @event==nil
      return redirect_to '/events';
    end



    if current_user
      @user=Registration.where(:user_id=>current_user.id,:event_id=>@event.id).first;
    end
    
    #byebug;
  end


  def myevents
   if current_user
   @event=Registration.where(:user_id=>current_user.id);
   else
   return redirect_to '/'
  end
  end

  def addinfoxevent

  end

  def addevents

  id = params[:Eventidm]
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
  category=params[:category]
  ven=params[:venue]
  sd=params[:sd]

  new_filename = name + "." + image.original_filename.split(".")[1]
 
  File.open(Rails.root.join('public', 'uploads', new_filename), 'wb') do |file|
  file.write(image.read)
  end

    Event.create(:Eventidm=>id,:Name=>name,:about=>detail,:image=>new_filename,:facebook_link =>facebooklink,:organizer1_name=>organizer1name,:organizer1_phone=>organizer1phone,:organizer2_name=>organizer2name,:organizer2_phone=>organizer2phone,:venue=>ven,:date=>date,:time=>time,:category=>category,:sd=>sd);

    return redirect_to '/events'


  end

  def eventregister

    id=params[:Eventidm]
    event=Event.find_by_Eventidm(id);
   # byebug;


    if Registration.where(:user_id=>current_user.id,:event_id=>event.id,:Event_name=>event.Name,:Eventidm=>event.Eventidm,:category=>event.category,:email=>current_user.email,:phone=>current_user.phone).first
      return redirect_to '/myevents'
    else
      Registration.create(:user_id=>current_user.id,:event_id=>event.id,:Event_name=>event.Name,:Eventidm=>event.Eventidm,:category=>event.category,:email=>current_user.email,:phone=>current_user.phone);
      return redirect_to '/events'
    end
    #byebug;
  end

 def eventquery

user=params["user"]
email=user["address"]
 name=params["name"]
 query=params["address"]


Query.create(:name=>name,:email=>email,:message=>query);
return redirect_to '/';


 end

end
