Feature: lolita have new configuration for tab

Lolita file upload define new configuration for lolita tabs, that
allow to specify file types, file list view and add atributes for file.
Tab type for lolita-file-upload will be :file

Scenario: i am able to define new tab with type :file and set allowed file types
  Given a lolita and lolita-file-upload
  When I define a file tab for post
  Then I can set included extension type pdf
  And I can set excluded extension type php
  
Scenario: set maximum file upload size 
  Given a lolita
  And lolita-file-upload
  And file tab
  When I set maximum file upload size to 1024
  Then I cannot upload file larg_file
  
Scenario: set assciation with Lolita::Multimedia::File
  Given a lolita 
  And lolita-file-upload
  When I define a file tab
  Then lolita orm class has association with Lolita::Multimedia::File
  And association name is :files
  