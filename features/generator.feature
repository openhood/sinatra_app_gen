@announce-cmd
Feature: Generator
  In order to have a usable Sinatra app
  Sinatra App Gen should generate a fully functionnal application on ruby 1.8.7, 1.9.1 and 1.9.2-head
  
  Scenario Outline: without argument
    Given I am using rvm "<ruby_version>"
    And I am using rvm gemset "sinatra_app_gen"
    When I successfully run "../../bin/sinatra_app"
    Then it should pass with:
    """
    Creates a new Sinatra / Sequel or MongoMapper / RSpec / Cucumber app.

    USAGE: sinatra_app directory_name [module_name] [orm]
    """

    Examples:
      | ruby_version |
      | ree-1.8.7    |
      | 1.9.1        |
      | 1.9.2-head   |

  Scenario Outline: with arguments
    Given I am using rvm "<ruby_version>"
    And I am using rvm gemset "sinatra_app_gen"
    When I successfully run "../../bin/sinatra_app <args>"
    And I cd to "demo_app"
    Then the following files should exist:
      | app.rb                                 |
      | config.ru                              |
      | Rakefile                               |
      | Gemfile                                |
      | features/step_definitions/web_steps.rb |
      | features/support/env.rb                |
      | features/support/paths.rb              |
      | spec/spec_helper.rb                    |
      | spec/support/blueprints.rb             |
    And the file "app.rb" should contain "<app_name>::App"
    And the file "config.ru" should contain "<app_name>::App"
    And the file "Gemfile" should contain "<gemfile_1>"
    And the file "Gemfile" should contain "<gemfile_2>"

    Examples:
      | ruby_version | args                        | app_name | gemfile_1 | gemfile_2    |
      | ree-1.8.7    | demo_app                    | DemoApp  | kamk-pg   | sequel       |
      | ree-1.8.7    | demo_app my_app             | MyApp    | kamk-pg   | sequel       |
      | ree-1.8.7    | demo_app my_app sequel      | MyApp    | kamk-pg   | sequel       |
      | ree-1.8.7    | demo_app my_app mongomapper | MyApp    | mongo_ext | mongo_mapper |
      | 1.9.1        | demo_app                    | DemoApp  | kamk-pg   | sequel       |
      | 1.9.1        | demo_app my_app             | MyApp    | kamk-pg   | sequel       |
      | 1.9.1        | demo_app my_app sequel      | MyApp    | kamk-pg   | sequel       |
      | 1.9.1        | demo_app my_app mongomapper | MyApp    | mongo_ext | mongo_mapper |
      | 1.9.2-head   | demo_app                    | DemoApp  | kamk-pg   | sequel       |
      | 1.9.2-head   | demo_app my_app             | MyApp    | kamk-pg   | sequel       |
      | 1.9.2-head   | demo_app my_app sequel      | MyApp    | kamk-pg   | sequel       |
      | 1.9.2-head   | demo_app my_app mongomapper | MyApp    | mongo_ext | mongo_mapper |