# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_multiparameter_attribute_bug_session',
  :secret      => '35f42a34282390ceda9d7c19a35e6eec40868b786212c71053c4a7ca1638b483370a174186cd7e96a32ce5654fbb47811a9996818260536a0c75cf6f7eb4fae1'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
