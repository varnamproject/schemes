# encoding: utf-8

class TestHi < Minitest::Test
  def setup
    @varnam = get_varnam_handle('hi')
    @varnam.config(Varnam::VARNAM_CONFIG_SET_TOKENIZER_SUGGESTIONS_LIMIT, 30)
  end

  def test_words
    list = {
      'kitaab' => 'किताब',
      'pitaa' => 'पिता'
    }
    list.each do |pattern, expected|
      # TODO assert length of result array too
      assert_equal expected, @varnam.transliterate(pattern)[0].Word
    end
  end
end
