ActiveAdmin.register WorkingEstimate do
  permit_params :id, :working_title, sub_working_ids: []

  form do |f|
    f.inputs 'Create Sub Working' do
      f.input :working_title
    end

    f.has_many :sub_workings do |sub|
      sub.input :title
      sub.input :specialists, as: :check_boxes, collection: Specialist.all.map { |s| [s.name, s.id] }
      sub.input :working_hour
    end

    f.actions
  end
end
