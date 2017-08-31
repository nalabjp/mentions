require 'test_helper'

class IdMappingTest < ActiveSupport::TestCase
  def test_id_all_to_everyone
    mapping = IdMapping.new(nil)
    assert_equal 'everyone', mapping.find(user_name: 'all', from: 'esa', to: 'slack')
  end

  def test_convert_with_local_file
    file_path = "#{Rails.root}/test/files/mention_mappings.yml"
    mapping = IdMapping.new(file_path)
    assert_equal 'ppworks', mapping.find(user_name: 'koshikawa_naoto', from: 'esa', to: 'slack')
  end

  def test_convert_with_gist
    file_path = "https://gist.githubusercontent.com/ppworks/49f6ce44efb09d5fc8e9/raw/3c2c8ac5651cba78d3ae7e9ead027bc3228e6dc7/mention_mappings.yml"
    mapping = IdMapping.new(file_path)
    assert_equal 'ppworks', mapping.find(user_name: 'koshikawa_naoto', from: 'esa', to: 'slack')
  end

  def test_convert_with_own_file
    file_path = Rails.root.join('public', 'mention_mappings.yml').to_s
    mapping = IdMapping.new(file_path)
    assert_equal 'ppworks', mapping.find(user_name: 'koshikawa_naoto', from: 'esa', to: 'slack')
  end
end
