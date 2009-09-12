# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_55xiaoyou_session',
  :secret      => '819eef1248625737cfa4f26f1add8cdcface1c111c01b7cccb2bd19c04aad70a8bc65058d304b569c813847174abb564b1d1867a9edb215afeb86ebbb5e5db8e'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
