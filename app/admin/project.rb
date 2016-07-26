ActiveAdmin.register Project do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :company_id, :start_date, :doc_name, :project_name, :end_date, project_working_estimate_ids: []
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


  form partial: 'form'

  #controller do
  #  before_action :set_project
  #
  #   def update
  #     print "smth"
  #     @project.update(params[:project].to_h)
  #   end
  #
  #   private
  #
  #  def set_project
  #    @project = Project.find(params[:id]) if params[:id].present?
  #  end
  #end
end
