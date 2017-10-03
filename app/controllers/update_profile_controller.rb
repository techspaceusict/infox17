class UpdateProfileController < ApplicationController

  
  def profile
  	    if current_user==nil
       return redirect_to '/'
    end

  end


  def update

  	   #byebug
  	phone=params[:phone]
  	branch=params["branch"]
  	year=params["year"]
  	college=params["college"]
    degree=params["degree"]


    
   if user_signed_in?
   	user=current_user;
   	user.phone=phone;
   	user.branch=branch;
   	user.degree=degree;
   	user.college=college;
   	user.year=year;
   	user.save;
   	return redirect_to '/'
   else
   
   return redirect_to '/'
   end


  end


  def show
  	if !current_user
  		return redirect_to '/';
    end
  end

end
