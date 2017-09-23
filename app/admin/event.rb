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
  permit_params :Name, :image, :about, :facebook_link,:organizer2_phone,:organizer2_name,:organizer1_phone,:organizer1_name,:date,:time,:venue,:Eventidm
end

end
