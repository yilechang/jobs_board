class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :title
      t.string :description
      t.string :idea
      t.string :report
      t.string :salary

      t.timestamps
    end
  end
end
