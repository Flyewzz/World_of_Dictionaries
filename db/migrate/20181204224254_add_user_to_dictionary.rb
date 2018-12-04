class AddUserToDictionary < ActiveRecord::Migration[5.2]
  def change
    add_column :dictionaries, :user_id, :integer
  end
end
