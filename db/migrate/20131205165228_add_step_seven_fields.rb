class AddStepSevenFields < ActiveRecord::Migration
  def change
  	add_column :openings, :step_seven_finished, :boolean, default: false
    add_column :openings, :seven_essentials, :boolean, default: false
    add_column :openings, :seven_cl_and_cv, :boolean, default: false
    add_column :openings, :seven_next_step, :date
    add_column :openings, :seven_q_three, :string
    add_column :openings, :seven_q_two, :string
    add_column :openings, :seven_q_one, :string
    add_column :openings, :seven_recruiter_background, :string
    add_column :openings, :seven_recruiter_name, :string
  end
end
