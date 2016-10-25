# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

Rails.application.config.assets.precompile += %w( hometeam.scss )
Rails.application.config.assets.precompile += %w( hometeam.coffee )
Rails.application.config.assets.precompile += %w( admin.css )
Rails.application.config.assets.precompile += %w( admin.js )

Rails.application.config.assets.precompile += %w( ling.css )
Rails.application.config.assets.precompile += %w( ling.js )

Rails.application.config.assets.precompile += %w( payment.css )
Rails.application.config.assets.precompile += %w( payment.coffee )

Rails.application.config.assets.precompile += %w( fontawesome-webfont.eot )
Rails.application.config.assets.precompile += %w( fontawesome-webfont.ttf )
Rails.application.config.assets.precompile += %w( fontawesome-webfont.woff )
Rails.application.config.assets.precompile += %w( fontawesome-webfont.woff2 )
Rails.application.config.assets.precompile += %w( FontAwesome.otf )
Rails.application.config.assets.precompile += %w( glyphicons-halflings-regular.eot )
Rails.application.config.assets.precompile += %w( glyphicons-halflings-regular.svg )
Rails.application.config.assets.precompile += %w( glyphicons-halflings-regular.ttf )
Rails.application.config.assets.precompile += %w( glyphicons-halflings-regular.woff )
Rails.application.config.assets.precompile += %w( glyphicons-halflings-regular.woff2 )

Rails.application.config.assets.precompile += %w( *.png *.jpg)

#Rails.application.config.assets.precompile += %w( team_page/hometeamscript.js )
#Rails.application.config.assets.precompile += %w( team_page/owl.carousel.css )

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
