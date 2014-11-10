class AddLinkToTickets < ActiveRecord::Migration
  def change
  	add_column :tickets, :link, :string
  end
end
