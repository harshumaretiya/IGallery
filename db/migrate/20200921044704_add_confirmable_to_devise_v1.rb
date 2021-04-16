class AddConfirmableToDeviseV1 < ActiveRecord::Migration[6.0]
  def change
    change_table(:users) do |t| 
     
       t.string   :unconfirmed_email
    end

  end
end
