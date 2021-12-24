# encoding: utf-8

class TestML < Minitest::Test
  def setup
    @varnam = get_varnam_handle('ml')
  end

  def test_words
    list = {
      'peN' => 'പെൺ',

      # BEGIN Anusvara <-> ma complications
      'am_bEdkar' => 'അംബേദ്കർ',
      'manam_pOle' => 'മനംപോലെ',
      'kunnamkuLam' => 'കുന്നംകുളം',
      'pamkthi' => 'പംക്തി',
      'kambiyil' => 'കമ്പിയിൽ',
      'mvOnE' => 'മ്വോനേ',
      'mvOnoossE' => 'മ്വോനൂസ്സേ',
      'manushyan' => 'മനുഷ്യൻ',
      'mlEchcham' => 'മ്ലേച്ചം',
      # END Anusvara <-> ma complications

      'kiLivaathil' => 'കിളിവാതിൽ',
      'kiLivaathilil' => 'കിളിവാതിലിൽ',
      'thaazhvara' => 'താഴ്വര',
      'thaazh_vara' => 'താഴ്‌വര',
      'ANkiLi' => 'ആൺകിളി'
    }
    list.each do |pattern, expected|
      assert_equal expected, @varnam.transliterate(pattern)[0].Word
    end
  end
end