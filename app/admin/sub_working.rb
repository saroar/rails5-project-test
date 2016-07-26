ActiveAdmin.register SubWorking do
  permit_params :sub_working_title, :working_hour, specialist_ids: []

  form do |f|
    f.inputs 'Create New SubWorking' do
      f.input :title
      f.input :specialists, as: :check_boxes, collection: Specialist.all.map { |s| [s.name, s.id] }

      f.input :working_hour
    end

    f.actions
  end
end
