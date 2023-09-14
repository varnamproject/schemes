# encoding: utf-8

class TestML < Minitest::Test
  def setup
    @varnam = get_varnam_handle('mr')
    @varnam.config(Varnam::VARNAM_CONFIG_SET_TOKENIZER_SUGGESTIONS_LIMIT, 30)
  end

  def test_words
    list = {
      'kalyaaNi' => 'कल्याणी',
      
    }
    list.each do |pattern, expected|
      # TODO assert length of result array too
      assert_equal expected, @varnam.transliterate(pattern)[0].Word
    end
  end

  # def test_reverse_transliteration
  #   list = {
  #     'മലയാളം' => %w[malayaaLam malayaaLam_ malayALam malayALam_ malayaalam malayaalam_ malayAlam malayAlam_ malayaLam malayaLam_ malayalam malayalam_]
  #   }

  #   list.each do |word, expected|
  #     assert_equal expected, @varnam.reverse_transliterate(word)
  #   end
  # end
end
