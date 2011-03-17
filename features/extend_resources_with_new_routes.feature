Feature: all resoures have new routes for file upload

All resources have new routes like /posts/1/files/new or for new files /posts/files/new

Scenario: extend resources path
  Given a lolita
  And lolita-file-upload
  Then I have get route /posts/1/files/new
  And I have post route /posts/1/files
  And I have get route /posts/1/files/1/edit
  And I have get route /posts/1/files
  And I have put route /post/1/files/1
  And I have delete route /posts/files/1