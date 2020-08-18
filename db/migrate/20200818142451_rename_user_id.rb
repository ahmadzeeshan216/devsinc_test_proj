class RenameUserId < ActiveRecord::Migration[6.0]
  def change
    rename_column :products, :user_id_, :user_id
  end
end
