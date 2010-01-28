# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_answers_session',
  :secret      => '272614af885bedfc420d3ada081a6c8d2359b4bee9bd431bc80f90e822cd9e4e01505c60325dc98cf20e460f21f6040018762cc87994e87a542a754e8d912fdc'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
