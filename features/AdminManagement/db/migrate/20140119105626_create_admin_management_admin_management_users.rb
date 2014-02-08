class CreateAdminManagementAdminManagementUsers < ActiveRecord::Migration
  def change
    create_table :admin_management_admin_management_users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :phone
      t.boolean :admin, :default => false

      t.timestamps
    end
  end
end