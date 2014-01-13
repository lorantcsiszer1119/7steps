class StepFourFields < ActiveRecord::Migration
  def change
  	add_column :openings, :step_four_finished, :boolean, default: false
    add_column :openings, :four_cv_link, :string
    add_column :openings, :four_cv_format, :boolean, default: false
    add_column :openings, :four_cv_basic, :boolean, default: false
    add_column :openings, :four_cv_linkedin, :boolean, default: false
    add_column :openings, :four_cv_headline, :boolean, default: false
    add_column :openings, :four_cv_qualifications, :boolean, default: false
    add_column :openings, :four_cv_work, :boolean, default: false
    add_column :openings, :four_cv_education, :boolean, default: false
    add_column :openings, :four_cv_skills, :boolean, default: false
    add_column :openings, :four_cv_work_others, :boolean, default: false
    add_column :openings, :four_cv_education_others, :boolean, default: false
    add_column :openings, :four_cv_skills_others, :boolean, default: false
  end
end
