# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "lolita-file-upload"
  s.version = "0.4.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["ITHouse", "Arturs Meisters"]
  s.date = "2011-09-06"
  s.description = "File upload gem for Lolita with with fulll integration - models, controller, views"
  s.email = "support@ithouse.lv"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    ".rspec",
    "Gemfile",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "app/assets/images/lolita/upload/delete-picture.png",
    "app/assets/images/lolita/upload/edit.png",
    "app/controllers/lolita/uploads_controller.rb",
    "app/models/lolita/upload/file.rb",
    "app/uploaders/file_uploader.rb",
    "app/views/components/lolita/configuration/tab/files/_cells.html.erb",
    "app/views/components/lolita/configuration/tab/files/_destroy.js.erb",
    "app/views/components/lolita/configuration/tab/files/_display.html.erb",
    "app/views/components/lolita/configuration/tab/files/_edit.js.erb",
    "app/views/components/lolita/configuration/tab/files/_file.html.erb",
    "app/views/components/lolita/configuration/tab/files/_fixed_gallery.html.haml",
    "app/views/components/lolita/configuration/tab/files/_form.html.erb",
    "app/views/components/lolita/configuration/tab/files/_list.html.erb",
    "app/views/components/lolita/configuration/tab/files/_list_form.html.erb",
    "app/views/components/lolita/configuration/tab/files/_row.html.erb",
    "app/views/components/lolita/configuration/tab/files/_update.js.erb",
    "app/views/components/lolita/configuration/tab/files/_upload_script.html.erb",
    "config/locales/en.yml",
    "config/locales/lv.yml",
    "features/configuration_for_tab.feature",
    "features/connect_with_lolita.feature",
    "features/extend_resources_with_new_routes.feature",
    "features/step_definitions/lolita_steps.rb",
    "features/support/env.rb",
    "features/support_byte_converter.feature",
    "features/upload_file.feature",
    "lib/generators/lolita_file_upload/install_generator.rb",
    "lib/generators/lolita_file_upload/templates/migration.rb",
    "lib/lolita-file-upload.rb",
    "lib/lolita-file-upload/configuration/tab/files.rb",
    "lib/lolita-file-upload/module.rb",
    "lib/lolita-file-upload/rails.rb",
    "lib/lolita-file-upload/rails/file_upload_routes.rb",
    "lib/support/bytes.rb",
    "log/development.log",
    "lolita-file-upload.gemspec",
    "spec/configuration/tab/files_spec.rb",
    "spec/lolita/support/bytes_spec.rb",
    "spec/models/file_spec.rb",
    "spec/spec_helper.rb",
    "spec/support/post.rb",
    "spec/uploaders/file_uploader_spec.rb",
    "test_orm/active_record.rb",
    "test_orm/active_record/news.rb",
    "test_orm/active_record/post.rb",
    "test_orm/active_record/tag.rb",
    "test_orm/config/active_record.yml",
    "test_orm/coverage.rb",
    "test_orm/db/migrate/01_create_posts.rb",
    "test_orm/db/migrate/02_create_files.rb",
    "test_orm/db/migrate/03_create_news.rb",
    "test_orm/db/migrate/04_create_tags.rb",
    "test_orm/files/large_file.txt",
    "test_orm/files/normal_file.txt",
    "test_orm/rails/config/application.rb",
    "test_orm/rails/config/enviroment.rb",
    "test_orm/rails/config/routes.rb",
    "test_orm/rails/log/development.log",
    "test_orm/support.rb",
    "test_orm/uploaders/list_image_uploader.rb",
    "test_orm/uploaders/main_image_uploader.rb",
    "vendor/assets/images/lolita/upload/jquery-ui/overcast/images/ui-bg_flat_0_aaaaaa_40x100.png",
    "vendor/assets/images/lolita/upload/jquery-ui/overcast/images/ui-bg_flat_0_eeeeee_40x100.png",
    "vendor/assets/images/lolita/upload/jquery-ui/overcast/images/ui-bg_flat_55_c0402a_40x100.png",
    "vendor/assets/images/lolita/upload/jquery-ui/overcast/images/ui-bg_flat_55_eeeeee_40x100.png",
    "vendor/assets/images/lolita/upload/jquery-ui/overcast/images/ui-bg_glass_100_f8f8f8_1x400.png",
    "vendor/assets/images/lolita/upload/jquery-ui/overcast/images/ui-bg_glass_35_dddddd_1x400.png",
    "vendor/assets/images/lolita/upload/jquery-ui/overcast/images/ui-bg_glass_60_eeeeee_1x400.png",
    "vendor/assets/images/lolita/upload/jquery-ui/overcast/images/ui-bg_inset-hard_75_999999_1x100.png",
    "vendor/assets/images/lolita/upload/jquery-ui/overcast/images/ui-bg_inset-soft_50_c9c9c9_1x100.png",
    "vendor/assets/images/lolita/upload/jquery-ui/overcast/images/ui-icons_3383bb_256x240.png",
    "vendor/assets/images/lolita/upload/jquery-ui/overcast/images/ui-icons_454545_256x240.png",
    "vendor/assets/images/lolita/upload/jquery-ui/overcast/images/ui-icons_70b2e1_256x240.png",
    "vendor/assets/images/lolita/upload/jquery-ui/overcast/images/ui-icons_999999_256x240.png",
    "vendor/assets/images/lolita/upload/jquery-ui/overcast/images/ui-icons_fbc856_256x240.png",
    "vendor/assets/images/lolita/upload/plupload/backgrounds.gif",
    "vendor/assets/images/lolita/upload/plupload/buttons-disabled.png",
    "vendor/assets/images/lolita/upload/plupload/buttons.png",
    "vendor/assets/images/lolita/upload/plupload/delete.gif",
    "vendor/assets/images/lolita/upload/plupload/done.gif",
    "vendor/assets/images/lolita/upload/plupload/error.gif",
    "vendor/assets/images/lolita/upload/plupload/plupload-bw.png",
    "vendor/assets/images/lolita/upload/plupload/plupload.png",
    "vendor/assets/images/lolita/upload/plupload/throbber.gif",
    "vendor/assets/images/lolita/upload/plupload/transp50.png",
    "vendor/assets/javascripts/lolita/upload/I18n/lv.js",
    "vendor/assets/javascripts/lolita/upload/I18n/ru.js",
    "vendor/assets/javascripts/lolita/upload/application_vendor.js",
    "vendor/assets/javascripts/lolita/upload/jquery.ui.plupload.js",
    "vendor/assets/javascripts/lolita/upload/plupload.flash.swf",
    "vendor/assets/javascripts/lolita/upload/plupload.full.js",
    "vendor/assets/stylesheets/lolita/upload/application_vendor.css",
    "vendor/assets/stylesheets/lolita/upload/jquery-ui/overcast/jquery-ui-1.8.16.custom.css.erb",
    "vendor/assets/stylesheets/lolita/upload/jquery.ui.plupload.css.erb",
    "vendor/assets/stylesheets/lolita/upload/plupload.queue.css"
  ]
  s.homepage = "http://github.com/ithouse/lolita-file-upload"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.10"
  s.summary = "File upload gem for Lolita CMS"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<lolita>, ["= 3.2.0.rc2"])
      s.add_runtime_dependency(%q<carrierwave>, ["~> 0.5.7"])
      s.add_runtime_dependency(%q<mini_magick>, [">= 0"])
      s.add_runtime_dependency(%q<jquery-rails>, [">= 1.0.12"])
      s.add_development_dependency(%q<cucumber>, ["~> 1.0"])
      s.add_development_dependency(%q<cucumber-rails>, ["~> 1.0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.6"])
    else
      s.add_dependency(%q<lolita>, ["= 3.2.0.rc2"])
      s.add_dependency(%q<carrierwave>, ["~> 0.5.7"])
      s.add_dependency(%q<mini_magick>, [">= 0"])
      s.add_dependency(%q<jquery-rails>, [">= 1.0.12"])
      s.add_dependency(%q<cucumber>, ["~> 1.0"])
      s.add_dependency(%q<cucumber-rails>, ["~> 1.0"])
      s.add_dependency(%q<bundler>, ["~> 1.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.6"])
    end
  else
    s.add_dependency(%q<lolita>, ["= 3.2.0.rc2"])
    s.add_dependency(%q<carrierwave>, ["~> 0.5.7"])
    s.add_dependency(%q<mini_magick>, [">= 0"])
    s.add_dependency(%q<jquery-rails>, [">= 1.0.12"])
    s.add_dependency(%q<cucumber>, ["~> 1.0"])
    s.add_dependency(%q<cucumber-rails>, ["~> 1.0"])
    s.add_dependency(%q<bundler>, ["~> 1.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.6"])
  end
end

