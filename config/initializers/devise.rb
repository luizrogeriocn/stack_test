Devise.setup do |config|
  # config.secret_key = 'a17dd2d980050d48184c8a75f266926fd176f958903764e78227ce067ab4aabe9a36a334fe630064d9f17e2df00376d2a0e50951480eaa47df4db22be16ef290'
  config.mailer_sender = 'stackcommerce-test@example.com'
  require 'devise/orm/active_record'
  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 10
  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 8..72
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete
end
