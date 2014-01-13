class AddTitleAndCompanyToOpenings < ActiveRecord::Migration
  def change
    add_column :openings, :title, :string
    add_column :openings, :company, :string
  end
end
