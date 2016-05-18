# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )

Rails.application.config.assets.precompile += %w( logo.png )
Rails.application.config.assets.precompile += %w( jumbotron.css )


Rails.application.config.assets.precompile += %w(carousel_items.css)
Rails.application.config.assets.precompile += %w(course_offerings.css)
Rails.application.config.assets.precompile += %w(courses.css)
Rails.application.config.assets.precompile += %w(custom.css)
Rails.application.config.assets.precompile += %w(document_categories.css)
Rails.application.config.assets.precompile += %w(document_person_maps.css)
Rails.application.config.assets.precompile += %w(documents.css)
Rails.application.config.assets.precompile += %w(grants.css)
Rails.application.config.assets.precompile += %w(news_events.css)
Rails.application.config.assets.precompile += %w(people.css)
Rails.application.config.assets.precompile += %w(person_categories.css)
Rails.application.config.assets.precompile += %w(product_categories.css)
Rails.application.config.assets.precompile += %w(product_person_maps.css)
Rails.application.config.assets.precompile += %w(products.css)
Rails.application.config.assets.precompile += %w(projects.css)
Rails.application.config.assets.precompile += %w(research_areas.css)
Rails.application.config.assets.precompile += %w(web_pages.css)

