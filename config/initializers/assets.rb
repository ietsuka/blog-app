# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
Rails.application.config.assets.precompile += %w(
  jquery.validate.js
  jquery.validate.min.js
  applicate.css
  home.css
  home.js
  posts.css
  posts.js
  sessions.css
  sessions.js
  signup.css
  signup.js
  comments.css
  comments.js
  mypage.css
  mypage.js
  setting.css
  setting.js
  withdraw.css
  withdraw.js
)