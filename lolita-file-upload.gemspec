# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "lolita-file-upload"
  s.version     = "0.8.2"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["ITHouse (Latvia)", "Arturs Meisters", "Gatis Tomsons"]
  s.description = "File upload gem for Lolita with with fulll integration - models, controller, views"
  s.summary = "File upload gem for Lolita CMS"
  s.email = "support@ithouse.lv"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]
  s.licenses = ["MIT"]
  s.add_runtime_dependency(%q<lolita>, ["~> 3.2"])
  s.add_runtime_dependency(%q<carrierwave>, ["~> 0.6.0"])
  s.add_runtime_dependency(%q<mini_magick>, ["~> 3.6.0"])
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test_orm,spec}/*`.split("\n")
  s.require_paths = ["lib"]
end
