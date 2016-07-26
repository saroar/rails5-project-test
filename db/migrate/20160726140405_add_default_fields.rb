class AddDefaultFields < ActiveRecord::Migration[5.0]
  def change
    add_column :working_estimates, :default_sw_ids, :jsonb, default: [], null: false

    add_column :sub_workings, :default_sp_ids, :jsonb, default: [], null: false

  end
end
