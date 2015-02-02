class AddRemoteAddressToComment < ActiveRecord::Migration
  def change
    add_column :comments, :remote_address, :string, default: nil
  end
end
