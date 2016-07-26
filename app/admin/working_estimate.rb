ActiveAdmin.register WorkingEstimate do
  permit_params :id, :working_title, default_sw_ids: []

  # form do |f|
  #   f.inputs 'Create Sub Working' do
  #     f.input :working_title
  #
  #     f.input :default_sw_ids, :as => :check_boxes, collection: SubWorking.all.map { |i| [i.title, i.id] }
  #
  #     f.actions
  #   end
  # end


  form partial: 'form'

  # controller do
  #   def edit
  #     @working_estimate = WorkingEstimate.find(params[:id])
  #   end
  # end
end
