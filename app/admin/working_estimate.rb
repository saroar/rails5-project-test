ActiveAdmin.register WorkingEstimate do
  permit_params :id, :working_title, default_sw_ids: []

  form partial: 'form'
end
