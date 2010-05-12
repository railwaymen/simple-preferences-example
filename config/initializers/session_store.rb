# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_simple-configuration-example_session',
  :secret      => '9ee5663d3ae5f04ea4993a0dfa71fe9bf6dbb56fa85cac6f0e3ee1c7276166f119d453d38791fb4ec61972f01136eed26e69e58b8d48f6ecd2dd5b82725d436f'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
