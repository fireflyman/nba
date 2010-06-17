# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_nba_session',
  :secret      => '851d6beab0aa9a74c9068e78c5d1ec000dd6302094452ed1b3f9163b9ae88d462e5c8720b3fedb7623d4d32fce6c15129fd90a4948c9b35fe2654df9d0e3aade'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
