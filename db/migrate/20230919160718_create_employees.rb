class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.integer :gender, null: false
      t.bigint :nip, null: false
      t.integer :hoby, null: false
      t.timestamps
    end
  end
end
