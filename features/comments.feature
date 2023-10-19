@comments @acceptance

Feature: Comments

  @project_id @comment_id
  Scenario:  Verify GET one comment from a project is returning all data correctly
      As a user I want to GET a project comment from TODOIST API

    Given I set the base url and headers
    When I call to comments endpoint using "GET" method using the "comment_id" as parameter
    Then I receive a 200 status code in response
    And I validate the response data from file using "simple" json

  @task_id @comment_id
  Scenario:  Verify GET one comment from a task is returning all data correctly
      As a user I want to GET a task comment from TODOIST API

    Given I set the base url and headers
    When I call to comments endpoint using "GET" method using the "comment_id" as parameter
    Then I receive a 200 status code in response
    And I validate the response data from file using "simple" json

  @project_id @comments_id
  Scenario:  Verify GET all comments from a project return all data correctly
      As a user I want to GET all project comments from TODOIST API

    Given I set the base url and headers
    When I call to comments endpoint using "GET" method using the "project_id" as parameter
    Then I receive a 200 status code in response
    And I validate the response data from file using "multiple" json

  @project_id
  Scenario: Verify POST comment creates the comment using a project provided correctly
      As a user I want to create a comment with project id provided from TODOIST API

    Given I set the base url and headers
    When I call to comments endpoint using "POST" method using the "comment data" as parameter
    """
    {
    "project_id": "project_id",
    "content": "this is a comment for testing purpose"
    }
    """
    Then I receive a 200 status code in response
    And I validate the response data from file using "simple" json

  @task_id
  Scenario: Verify POST comment creates the comment using a task provided correctly
      As a user I want to create a comment with task id provided from TODOIST API

    Given I set the base url and headers
    When I call to comments endpoint using "POST" method using the "comment data" as parameter
    """
    {
    "task_id": "task_id",
    "content": "this is a comment for task created."
    }
    """
    Then I receive a 200 status code in response
    And I validate the response data from file using "simple" json

  @project_id @comment_id
  Scenario:  Verify DELETE comment from a project delete the comment correctly
      As a user I want to delete a comment from a project using TODOIST API

    Given I set the base url and headers
    When I call to comments endpoint using "DELETE" method using the "comment_id" as parameter
    Then I receive a 204 status code in response
    And I validate the response data from file using "simple" json

  @task_id @comment_id
  Scenario:  Verify DELETE comment from a task delete the comment correctly
      As a user I want to delete a comment from a task using TODOIST API

    Given I set the base url and headers
    When I call to comments endpoint using "DELETE" method using the "comment_id" as parameter
    Then I receive a 204 status code in response
    And I validate the response data from file using "simple" json

  @task_id @comment_id
  Scenario: Verify POST project endpoint updates a task comment with the name provided
      As a user I want to update a comment from a task using TODOIST API

    Given I set the base url and headers
    When I call to comments endpoint using "POST" method using the "update comment data" as parameter
    """
    {
      "Content": "Task Comment  updated!"
    }
    """
    Then I receive a 200 status code in response
    And I validate the response data from file using "simple" json

  @project_id @comment_id
  Scenario: Verify POST project endpoint updates a project comment with the name provided
      As a user I want to update a comment from a project using TODOIST API

    Given I set the base url and headers
    When I call to comments endpoint using "POST" method using the "update comment data" as parameter
    """
    {
      "Content": "Project Comment updated!"
    }
    """
    Then I receive a 200 status code in response
    And I validate the response data from file using "simple" json