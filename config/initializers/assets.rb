# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.

Rails.application.config.assets.precompile += %w( employee.css )
Rails.application.config.assets.precompile += %w( employee.js )

Rails.application.config.assets.precompile += %w( manager.css )
Rails.application.config.assets.precompile += %w( manager.js )



Rails.application.config.assets.paths << Rails.root.join('node_modules')
Rails.application.config.assets.precompile += %w( admin.css )
Rails.application.config.assets.precompile += %w( admin.js )
Rails.application.config.assets.precompile += %w( _all-skins.min.css )
Rails.application.config.assets.precompile += %w( AdminLTE.min.css )
Rails.application.config.assets.precompile += %w( bootstrap.min.css )
Rails.application.config.assets.precompile += %w( bootstrap-datepicker.min.css )
Rails.application.config.assets.precompile += %w( daterangepicker.css )
Rails.application.config.assets.precompile += %w( font-awesome.min.css )
Rails.application.config.assets.precompile += %w( jquery-jvectormap.css )
Rails.application.config.assets.precompile += %w( morris.css )


 # js
Rails.application.config.assets.precompile += %w( adminlte.min.js )
Rails.application.config.assets.precompile += %w( bootstrap.min.js )
Rails.application.config.assets.precompile += %w( bootstrap3-wysihtml5.all.min.js )
Rails.application.config.assets.precompile += %w( bootstrap-datepicker.min.js )
Rails.application.config.assets.precompile += %w( Chart.js )
Rails.application.config.assets.precompile += %w( dashboard.js )
Rails.application.config.assets.precompile += %w( dashboard2.js )
Rails.application.config.assets.precompile += %w( daterangepicker.js )
Rails.application.config.assets.precompile += %w( demo.js )
Rails.application.config.assets.precompile += %w( fastclick.js )
Rails.application.config.assets.precompile += %w( jquery.min.js )
Rails.application.config.assets.precompile += %w( jquery.slimscroll.min.js )
Rails.application.config.assets.precompile += %w( jquery.sparkline.min.js )
Rails.application.config.assets.precompile += %w( jquery-jvectormap-1.2.2.min.js )
Rails.application.config.assets.precompile += %w( jquery-jvectormap-world-mill-en.js )
Rails.application.config.assets.precompile += %w( jquery-ui.min.js )
Rails.application.config.assets.precompile += %w( moment.min.js )
Rails.application.config.assets.precompile += %w( morris.min.js )
Rails.application.config.assets.precompile += %w( raphael.min.js )



# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
