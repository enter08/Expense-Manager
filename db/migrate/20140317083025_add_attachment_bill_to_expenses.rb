class AddAttachmentBillToExpenses < ActiveRecord::Migration
  def self.up
    change_table :expenses do |t|
      t.attachment :bill
    end
  end

  def self.down
    drop_attached_file :expenses, :bill
  end
end
