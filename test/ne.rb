# encoding: utf-8

class TestNe < Minitest::Test
  def setup
    @varnam = get_varnam_handle('ne')
    @varnam.config(Varnam::VARNAM_CONFIG_SET_TOKENIZER_SUGGESTIONS_LIMIT, 30)
  end

  def test_words
    list = {
      'kitaab' => 'किताब',
      'pitaa' => 'पिता',
      'prastuti' => 'प्रस्तुति',
      'kaaThamaanDau' => 'काठमान्डौ',
      # vowel+vowel combinations
      'euTaa' => 'एउटा',
      'aaimaai' => 'आइमाइ',
      # half letters
      'purva' => 'पुर्व',
      'hunchha' => 'हुन्छ',
      'dantya' => 'दन्त्य',
      # change half letters to full at word end
      'asar' => 'असर',
      'pasal' => 'पसल',
      'baagh' => 'बाघ' # multi letter consonant not working. still need to type "baagha"
    }
    list.each do |pattern, expected|
      # TODO assert length of result array too
      assert_equal expected, @varnam.transliterate(pattern)[0].Word
    end
  end

  def test_reverse_transliteration
    list = {
      'नेपाली' => %w[nepaalee nepaalI nepAlee nepaalii nepali]
    }

    list.each do |word, expected|
      assert_equal expected, @varnam.reverse_transliterate(word)
    end
  end
end
