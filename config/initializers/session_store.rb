# Be sure to restart your server when you modify this file.

Pvn::Application.config.session_store APP_CONFIG.cookie_store, key: APP_CONFIG.session_store_id

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rails generate session_migration")
# Pvn::Application.config.session_store :active_record_store
