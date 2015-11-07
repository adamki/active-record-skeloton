require './test/test_helper'

class CreateTaskTest < Minitest::Test
  include Rack::Test::Methods

  def app
    TaskManager
  end

  def test_it_creates_a_task_with_valid_attributes
    attributes = {task: {title: "Wake up Clarence.",
                   description: "Good morning Clarence.",
                       user_id: 1}}

    post "/tasks", attributes

    assert_equal 1, Task.count
    assert_equal 200, last_response.status
    assert_equal "Successfully created", last_response.body
  end

  def test_it_does_not_create_with_missing_attributes
    attributes = {task: {description: "Good morning Clarence.",
                             user_id: 1}}

    post "/tasks", attributes

    assert_equal 0, Task.count
    assert_equal 400, last_response.status
    assert_equal "Title can't be blank", last_response.body
  end

  def setup
    DatabaseCleaner.start
  end

  def teardown
    DatabaseCleaner.clean
  end
end
