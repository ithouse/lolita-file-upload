Feature: lolita-file-upload connects to Lolita

To have all file upload features, file upload gem should connect itsefl to lolita base.

Scenario: lolita-file-upload load in universe
  Given a lolita
  When I load lolita-file-upload gem
  Then lolita should have file-upload module
  
Scenario: lolita-file-upload starts rails engine
  Given a rails
  When I load lolita-file-upload gem
  Then I have LolitaFileUpload engine

