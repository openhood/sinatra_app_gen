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

    USAGE: sinatra_app directory_name [options]

    sinatra_app options:
            --namespace my_namespace     Use a different module name (default is camelized directory_name).
            --orm ORM                    Specify which ORM to use (Default: Sequel; Possible: Sequel, MongoMapper)
            --[no-]async                 Specify if you want to have async built-in via sinatra-async (Default: true)
            --[no-]rspec                 Specify if you want to have RSpec built-in (Default: true)
            --[no-]cucumber              Specify if you want to have Cucumber built-in (Default: true)
        -v, --version                    Show the sinatra_app version number and quit.
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
      | ree-1.8.7    | demo_app                    | DemoApp  | pg        | sequel       |
      | ree-1.8.7    | demo_app --namespace=my_app | MyApp    | pg        | sequel       |
      | ree-1.8.7    | demo_app --orm=Sequel       | DemoApp  | pg        | sequel       |
      | ree-1.8.7    | demo_app --orm=MongoMapper  | DemoApp  | mongo_ext | mongo_mapper |
      | 1.9.1        | demo_app                    | DemoApp  | pg        | sequel       |
      | 1.9.1        | demo_app --namespace=my_app | MyApp    | pg        | sequel       |
      | 1.9.1        | demo_app --orm=Sequel       | DemoApp  | pg        | sequel       |
      | 1.9.1        | demo_app --orm=MongoMapper  | DemoApp  | mongo_ext | mongo_mapper |
      | 1.9.2-head   | demo_app                    | DemoApp  | pg        | sequel       |
      | 1.9.2-head   | demo_app --namespace=my_app | MyApp    | pg        | sequel       |
      | 1.9.2-head   | demo_app --orm=Sequel       | DemoApp  | pg        | sequel       |
      | 1.9.2-head   | demo_app --orm=MongoMapper  | DemoApp  | mongo_ext | mongo_mapper |

  Scenario Outline: generated app can run cucumber
    Given I am using rvm "<ruby_version>"
    And I am using rvm gemset "sinatra_app_gen"
    When I successfully run "../../bin/sinatra_app demo_app"
    And I cd to "demo_app"
    When I successfully run "bundle install"
    When I successfully run "bundle exec cucumber"
    Then it should pass with:
      """
      0 scenarios
      0 steps
      0m0.000s
      """

    Examples:
      | ruby_version |
      | ree-1.8.7    |
      # Bundler bug with gems requiring rake prevent the test to pass (http://github.com/carlhuda/bundler/issues#issue/15)
      # | 1.9.1        |
      # | 1.9.2-head   |

  Scenario Outline: generated app can run rspec
    Given I am using rvm "<ruby_version>"
    And I am using rvm gemset "sinatra_app_gen"
    When I successfully run "../../bin/sinatra_app demo_app"
    And I cd to "demo_app"
    When I successfully run "bundle install"
    When I run "bundle exec rake spec"
    Then it should fail with:
      """
      1 example, 1 failures
      """

    Examples:
      | ruby_version |
      | ree-1.8.7    |
      # Bundler bug with gems requiring rake prevent the test to pass (http://github.com/carlhuda/bundler/issues#issue/15)
      # | 1.9.1        |
      # | 1.9.2-head   |
