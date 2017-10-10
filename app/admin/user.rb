ActiveAdmin.register User do
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

index do
	column    :id
	column    :email
    column    :provider
    column    :uid
    column    :name
    column    :profile
    column    :college
    column    :branch
    column    :year
    column    :degree
    column    :phone 
actions


end

ActiveAdmin.register User do

	filter :email
	filter :name
	filter :id
	filter :provider
	filter :profile
end

end
