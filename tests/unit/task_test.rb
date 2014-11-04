require './tests/test_helper'

scope do
  test 'save task' do
    Task.create name: 'first task'
    assert Task.all.count == 1
  end
end
