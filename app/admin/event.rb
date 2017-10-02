ActiveAdmin.register Event do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

ActiveAdmin.register Event do 
  permit_params :Name, :image, :about, :facebook_link,:organizer2_phone,:organizer2_name,:organizer1_phone,:organizer1_name,:date,:time,:venue,:Eventidm,:category
end


 index do
 	
 	selectable_column
 	column  :id
 	column  :Eventidm
     column   :Name
     column   :image
     column   :about do |v|
      div :class=>"adjust" do
      	v.about
      end
     end
     column   :facebook_link
     column   :organizer1_name
     column   :organizer1_phone
     column   :organizer2_name
     column   :organizer2_phone
     column   :date
     column   :time
     column   :venue
     column   :category
     actions

 end

# ActiveAdmin.register Event do
# filter :category, as: :check_boxes
# end



end  
