class AddStepFiveFields < ActiveRecord::Migration
  def change
  	add_column :openings, :step_five_finished, :boolean, default: false
    add_column :openings, :five_cl_link, :string
    add_column :openings, :five_cl_recruiter_name, :boolean, default: false
    add_column :openings, :five_cl_intro, :boolean, default: false
    add_column :openings, :five_cl_skills, :boolean, default: false
    add_column :openings, :five_cl_company_positives, :boolean, default: false
    add_column :openings, :five_cl_availability, :boolean, default: false
  end
end
