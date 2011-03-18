Feature: upload file from lolita and manage file attributes

Files in lolita have name attribute. Any attributes can be changed after file is uploaded.
File always is related with some ORM class object.

Scenario: upload file
  Given a lolita
  And lolita-file-upload
  When I can upload file normal_file.txt
  Then I see normal_file
  And I change file attribute name to my_file
  And save file
  Then I see my_file