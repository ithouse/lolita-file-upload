# Lolita file upload

File upload gem for Lolita.

## Instalation

* gem install lolita-file-upload
* include in gemfile like this: `gem "lolita-file-upload"`
* cd your_project_path
* rails g lolita_file_upload:install
* add `lolita_gallery` as plugin to `config/tinymce.yml` configuration.

Install will copy migration to your project.
If you update to newest version of gem, than run `rails g lolita_file_upload:assets`

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
