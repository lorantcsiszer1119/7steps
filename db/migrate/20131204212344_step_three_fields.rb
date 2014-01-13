class StepThreeFields < ActiveRecord::Migration
  def change
  	add_column :openings, :step_three_finished, :boolean, default: false
    add_column :openings, :three_li_photo, :boolean, default: false
    add_column :openings, :three_li_headline, :boolean, default: false
    add_column :openings, :three_li_summary, :boolean, default: false
    add_column :openings, :three_li_specialties, :boolean, default: false
    add_column :openings, :three_li_work, :boolean, default: false
    add_column :openings, :three_li_education, :boolean, default: false
    add_column :openings, :three_li_skills, :boolean, default: false
    add_column :openings, :three_li_work_others, :boolean, default: false
    add_column :openings, :three_li_education_others, :boolean, default: false
    add_column :openings, :three_li_skills_others, :boolean, default: false
    add_column :openings, :three_li_connections, :boolean, default: false
    add_column :openings, :three_li_recommendations, :boolean, default: false
    add_column :openings, :three_li_others, :boolean, default: false
    add_column :openings, :three_google, :boolean, default: false
    add_column :openings, :three_by_links, :boolean, default: false
    add_column :openings, :three_facebook, :boolean, default: false
    add_column :openings, :three_twitter, :boolean, default: false
    add_column :openings, :three_social_media, :boolean, default: false
    add_column :users, :li_link, :string
    add_column :users, :by_link, :string
  end
end
