class AddStepTwoFinishedToOpenings < ActiveRecord::Migration
  def change
    add_column :openings, :step_two_finished, :boolean, default: false
    add_column :openings, :two_reqs_example, :boolean, default: false
    add_column :openings, :two_reqs_number, :boolean, default: false
    add_column :openings, :two_reqs_completed, :boolean, default: false
    add_column :users, :q_and_a_link, :string
  end
end
