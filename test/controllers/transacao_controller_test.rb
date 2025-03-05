require "test_helper"

class TransacaoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get transacao_index_url
    assert_response :success
  end
end
