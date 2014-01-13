class CreateOpenings < ActiveRecord::Migration
  def change
    create_table :openings do |t|
      t.integer :user_id
      t.string :link

      t.timestamps
    end
  end
end
