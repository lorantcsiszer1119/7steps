class AddStepSixFields < ActiveRecord::Migration
  def change
  	add_column :openings, :step_six_finished, :boolean, default: false
    add_column :users, :qa_link, :string
    add_column :openings, :six_qa_duration, :boolean, default: false
    add_column :openings, :six_qa_specific, :boolean, default: false
    add_column :openings, :six_qa_examples, :boolean, default: false
    add_column :openings, :six_qa_star_method, :boolean, default: false
    add_column :openings, :six_qa_answers_reqs, :boolean, default: false
    add_column :openings, :six_qa_strenght, :boolean, default: false
    add_column :openings, :six_qa_weakness, :boolean, default: false
    add_column :openings, :six_qa_salary, :boolean, default: false
  end
end
