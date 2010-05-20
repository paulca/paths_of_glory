ActiveRecord::Schema.define(:version => 0) do
  create_table "achievements", :force => true do |t|
    t.string   "type"
    t.integer  "level"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "notified",   :default => false
  end
  
  create_table "users", :force => true do |t|
    t.string   "email",                                                  :null => false
    t.string   "encrypted_password",    :limit => 40,                    :null => false
    t.string   "password_salt",                                          :null => false
    t.string   "confirmation_token",    :limit => 20
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "reset_password_token",  :limit => 20
    t.string   "remember_token",        :limit => 20
    t.datetime "remember_created_at"
    t.integer  "sign_in_count"
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",                     :default => 0
    t.string   "unlock_token",          :limit => 20
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "password_set",                        :default => false
  end
end