class AddStepOneFinishedToOpenings < ActiveRecord::Migration
  def change
    add_column :openings, :step_one_finished, :boolean, default: false
  end
end
