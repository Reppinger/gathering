Feature: Adding Projects
  In order to keep track of tasks
  As a project manager
  I want to create a new projects

  Scenario: Add project with tasks
    When I add a project named "Project Runway" with the following tasks:
      | name   | size |
      | Task 1 | 3    |
      | Task 2 | 5    |
    Then "Project Runway" is created with a total size of 8
