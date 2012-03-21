Feature: Deposits
  In order to see information
  As a user
  I want maturing deposits app to display all deposits

Scenario: display deposits with maturing expiry alert period confirm
  Given the date is 2010-02-17
  And the following deposits exist:
    | bank_name | account_number | start_date | term_in_days |
    | Nice Bank | 4555           | 2009-02-12 | 365          |
  When I load maturing deposits page
  Then I should see "Nice Bank"
  And I should see "Confirm"


Scenario: display deposits without maturing expiry alert period confirm
  Given the date is 2008-02-17
  And the following deposits exist:
    | bank_name | account_number | start_date | term_in_days |
    | Nice Bank | 4556           | 2009-02-13 | 30           |
  When I load maturing deposits page
  Then I should see "Nice Bank"
  And I should not see "Confirm"
