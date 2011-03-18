Feature: user can create Lolita::Multimedia::File objects

In oreder to upload files and link them with other models, there is Lolita::Multimedia::File
class. It validates file based on lolita configuration given in parent class. ::File class is
polymorphic so any other same ORM class can be added to it. Also this class provide size convertion
for bytes, that is used in error messages.

Scenario Outline: humanize file sizes
  Given a rails
  Given rails engine
  And multimedia file object
  When I humanize "<size>"
  Then I should get "<unit>" and "<limit>"

  Scenarios: to bytes
    | size | unit  | limit   |
    | 0    | bytes | 0.0     |
    | 1023 | bytes | 1023.0  |
    
  Scenarios: to kilobytes
    | size      | unit      | limit   |
    | 1024      | kilobytes | 1.0     |
    | 1024**2-1    | kilobytes | 1023.99 |

  Scenarios: to megabytes
    | size      | unit      | limit   |
    | 1024**2   | megabytes | 1.0     |
    | 1024**3-1 | megabytes | 1023.99 |

  Scenarios: to gigabytes
    | size      | unit      | limit   |
    | 1024**3   | gigabytes | 1.0     |
    | 1024**4-1 | gigabytes | 1023.99 |
