Feature: Deposits
  In order to see information
  As a user
  I want maturing deposits app to display all deposits

Scenario: display all deposits
  Given the date is 2010-02-17
  And I create the following deposits:
    | bank_name                |
    | NiceBank                 |

