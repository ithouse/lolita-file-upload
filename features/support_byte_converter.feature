Feature: convert bytes to biggest possible unit

In order to show file upload errors in human understendable way
There should be converter that converts bytes to kilobytes, megabytes, gigabytes.
Lolita::Suport::Bytes do that think, it is create by passing bytes, and return unit and values with
converted values

Scenario Outline: convert bytes
  Given byte converter
  When I humanize "<size>"
  Then I should get "<unit>" and "<limit>"

  Scenarios: to bytes
    | size | unit  | limit   |
    | 0    | bytes | 0.0     |
    | 1023 | bytes | 1023.0  |
    
  Scenarios: to kilobytes
    | size      | unit      | limit   |
    | 1024      | kilobyte  | 1.0     |
    | 1024**2-1 | megabyte  | 1.0     |

  Scenarios: to megabytes
    | size      | unit      | limit   |
    | 1024**2   | megabyte  | 1.0     |
    | 1024**3-1 | gigabyte  | 1.0     |

  Scenarios: to gigabytes
    | size      | unit      | limit   |
    | 1024**3   | gigabyte  | 1.0     |
    | 1024**4-1 | gigabytes | 1024.0  |
