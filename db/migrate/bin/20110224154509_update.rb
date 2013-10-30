class Update < ActiveRecord::Migration
  def self.up
    add_column    :events, :event_is_publik, :boolean
  end

  def self.down
    remove_column   :events, :event_is_publik
  end
end
