# == Schema Information
#
# Table name: working_estimates
#
#  id            :integer          not null, primary key
#  working_title :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class WorkingEstimate < ApplicationRecord
  has_many :project_working_estimates
  has_many :projects, through: :project_working_estimates
end
