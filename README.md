# Lolita file upload

File upload gem for Lolita.

## Instalation

* gem install lolita-file-upload
* include in gemfile like this: `gem "lolita-file-upload"`
* cd your_project_path
* rails g lolita_file_upload:install
* add `lolita_gallery` as plugin to `config/tinymce.yml` configuration.
* run `bundle exec rails g lolita:file_upload:install` it will create new migration file
* run `bundle exec rake db:migrate db:test:clone` to create file tables

##Configuration

Gem will not used until any of lolita configuration blocks define tab with type :files. Like this
```ruby
class Post
  include Lolita::Configuration
  has_many :files, as: :fileable, class_name: 'Lolita::Upload::File'

  lolita do
    tab(:content)
    tab(:files)
  end
end
```
