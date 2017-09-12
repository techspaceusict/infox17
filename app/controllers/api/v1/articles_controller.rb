module API
	module V1
		class ArticlesController < ::ApiController

			def allevent
				event=Event.all();
				puts event
                return response_data(event, "Signed In", 200)
                
			end


			def eventbyid

				id=params[:id]
				event=Event.find_by_Event_id(id);
				puts event
                return response_data(event, "Signed In", 200)
				
			end

		end 
	end
end