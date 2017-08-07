class EventController < ApplicationController
  
  def event
  	
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

  new_filename = name + "." + image.original_filename.split(".")[1]
 
  File.open(Rails.root.join('public', 'uploads', new_filename), 'wb') do |file|
  file.write(image.read)
  end

    Event.create(:Event_id=>id,:Name=>name,:about=>detail,:image=>new_filename,:facebook_link =>facebooklink,:organizer1_name=>organizer1name,:organizer1_phone=>organizer1phone,:organizer2_name=>organizer2name,:organizer2_phone=>organizer2phone,:date=>date,:time=>time);

    return redirect_to '/events'


  end

  def eventregister
    id=params[:Event_id]
    Registration.create(:user_id=>current_user.id,:event_id=>id);
    return redirect_to '/events'
  end


  def algoholics
    @event=Event.find_by_id("1");
    if current_user
      @user=Registration.where(:user_id=>current_user.id,:event_id=>"1").first;
    end
  end

end
