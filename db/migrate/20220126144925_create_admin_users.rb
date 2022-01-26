class CreateAdminUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :admin_users do |t|
      t.string :name,  null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.integer :role, null: false, default: 1
      t.timestamps
    end
  end
end
