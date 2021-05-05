class AddRecipientIdToRoom < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :recipient_id, :integer
    add_index :rooms, :recipient_id
    add_column :rooms, :sender_id, :integer
    add_index :rooms, :sender_id
  end
end
