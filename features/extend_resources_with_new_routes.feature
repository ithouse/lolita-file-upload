Feature: all resoures have new routes for file upload

File upload lives in lolita/upload and loads only once when any of lolita resources has defined files tab.

Scenario: extend resources path
  Given a lolita
  And a rails
  And rails application
  And lolita-file-upload
  When I load routes
  Then I have get route /lolita/upload/files/new
  And I have get route /lolita/upload/files/1/edit
  And I have get route /lolita/upload/files/1
  And I have post route /lolita/upload/files
  And I have put route /lolita/upload/files/1
  And I have delete route /lolita/upload/files/1
  And I have get route /lolita/upload/files