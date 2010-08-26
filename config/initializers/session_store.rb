# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_fight_club_session',
  :secret      => 'c72c453b2b17b696497176b83ef49d29b7d0a1c98cce018132794469b6f1f495eb6c8f696705410b24fd1638828d7fc89b4b5350b91989545017d33ca105ace2'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
