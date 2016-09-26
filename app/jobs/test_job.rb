class TestJob < ApplicationJob
  queue_as :default

  def perform(a)
    puts a
  end

end
