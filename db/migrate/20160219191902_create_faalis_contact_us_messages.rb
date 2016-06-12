class CreateFaalisContactUsPosts < ActiveRecord::Migration
  def change
    args = {}
    args[:id] = :uuid if Faalis::Engine.use_uuid

    create_table :faalis_contact_us_messages, **args do |t|
      t.string :name
      t.string   :email
      t.json   :exteradata

      if  Faalis::Engine.use_uuid
        t.uuid :user_id
      else
        t.integer :user_id
      end

      t.boolean :members_only, default: false

      t.timestamps null: false
    end

    site_aware :faalis_contact_us_messages
  end
end
