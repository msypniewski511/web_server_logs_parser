# frozen_string_literal: true

require_relative '../../config/sequel'

RSpec.configure do |config|
  config.around do |example|
    DB.transaction(rollback: :always, auto_savepoint: true) { example.run }
  end
end
