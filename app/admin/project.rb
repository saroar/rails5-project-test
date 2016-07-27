ActiveAdmin.register Project do
  permit_params :id, :company_id, :start_date, :doc_name, :project_name, :end_date, active_project_working_estimate_ids: [], project_working_estimate_attributes: [:id, :working_title]

  form partial: 'form'

  controller do
  #  before_action :set_project
  #
     def update
  #     print "smth"
  #     @project.update(params[:project].to_h)
    project_working_estimate_ids = params.require(:project)[:active_project_working_estimate_ids].select(&:present?)

      ProjectWorkingEstimate.where(project_id: params[:id]).where.not(id: project_working_estimate_ids).update_all(active: false)

      ProjectWorkingEstimate.where(id: project_working_estimate_ids).update_all(active: true)

      @project = Project.find(params[:id])

      @project.update(params[:project].to_h)

      redirect_to admin_project_path(params[:id])
      #super
     end
  #
  #   private
  #
  #  def set_project
  #    @project = Project.find(params[:id]) if params[:id].present?
  #  end
  end
end
