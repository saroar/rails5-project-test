# == Schema Information
#
# Table name: projects
#
#  id           :integer          not null, primary key
#  start_date   :date
#  doc_name     :string
#  project_name :string
#  end_date     :date
#  company_id   :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Project < ApplicationRecord
  belongs_to :company

  has_many :project_working_estimates
  has_many :working_estimates, through: :project_working_estimates

  accepts_nested_attributes_for :working_estimates, allow_destroy: true
end
