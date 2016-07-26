ActiveAdmin.register Project do
  permit_params :id, :company_id, :start_date, :doc_name, :project_name, :end_date, project_working_estimate_ids: []

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
