class CreateRegistartionYears < ActiveRecord::Migration[7.0]
  def change
    create_table :registartion_years do |t|
      t.string :year
      t.timestamps
    end
  end
end
