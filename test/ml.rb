# encoding: utf-8

class TestML < Minitest::Test
  def setup
    @varnam = get_varnam_handle('ml')
    @varnam.config(Varnam::VARNAM_CONFIG_SET_TOKENIZER_SUGGESTIONS_LIMIT, 30)
  end

  def test_basic_words
    # TODO assert length of result array too
    assert_hash_transliterate({
      'peN' => 'പെൺ',
      'kiLivaathil' => 'കിളിവാതിൽ',
      'kiLivaathilil' => 'കിളിവാതിലിൽ',
      'thaazhvara' => 'താഴ്വര',
      'thaazh_vara' => 'താഴ്‌വര',
      'ANkiLi' => 'ആൺകിളി'
    })
  end

  def test_anusvara_ma_complications
    assert_hash_transliterate({
      'am_bEdkar' => 'അംബേദ്കർ',
      'manam_pOle' => 'മനംപോലെ',
      'kunnamkuLam' => 'കുന്നംകുളം',
      'pamkthi' => 'പംക്തി',
      'kambiyil' => 'കമ്പിയിൽ',
      'mvOnE' => 'മ്വോനേ',
      'mvOnoossE' => 'മ്വോനൂസ്സേ',
      'manushyan' => 'മനുഷ്യൻ',
      'mlEchcham' => 'മ്ലേച്ചം'
    })
  end

  def test_chil_and_words
    assert_hash_transliterate({
      'alpam' => 'അല്പം',
      'l' => 'ൽ',
      'lakkiTi' => 'ലക്കിടി',
      'kuyil' => 'കുയിൽ'
    })

    assert_hash_transliterate({
      'aaScharyam' => 'ആശ്ചര്യം',
      'r' => 'ർ',
      'raakkiLi' => 'രാക്കിളി',
      'payar' => 'പയർ',
      'ervin' => 'എര്വിൻ'
    })
  end

  def test_reverse_transliteration
    list = {
      'മലയാളം' => %w[malayaaLam malayaaLam_ malayALam malayALam_ malayaalam malayaalam_ malayAlam malayAlam_ malayaLam malayaLam_ malayalam malayalam_]
    }

    list.each do |word, expected|
      assert_equal expected, @varnam.reverse_transliterate(word)
    end
  end

  def assert_hash_transliterate(list)
    list.each do |pattern, expected|
      assert_equal expected, @varnam.transliterate(pattern)[0].Word
    end
  end
end
