Feature: Inserting cucumber steps into file
  In order to keep from having to copy and paste from the console
  As a user of cucumber
  I would like the undefined steps to be auto-inserted into a steps file

  Scenario: Creating the auto_defined_steps file
    Given the following undefined step
    """
    Given /^something has been initialized$/ do
      pending
    end
    """
    When I create the undefined steps
    Then the file "clippie_steps.rb" should exist in example app

  Scenario: Adding the steps to the auto_defined_steps file
    Given the following undefined step
    """
    Given /^something has been initialized$/ do
      pending
    end
    """
    When I create the undefined steps
    Then the file "clippie_steps.rb" should contain the undefined step
  