require_relative 'test_base'

class RedAmberGreenTest < TestBase

  def self.hex_prefix
    'C608A'
  end

  # - - - - - - - - - - - - - - - - -

  test '6A1',
  %w( [C,assert] red/amber/green progression test ) do
    filename = 'hiker.c'
    src = starting_files[filename]
    in_kata {
      run_cyber_dojo_sh
      assert_colour 'red'
      run_cyber_dojo_sh( {
        changed_files:{
          filename => src.sub('6 * 9', '6 * 7')
        }
      })
      assert_colour 'green'
      run_cyber_dojo_sh( {
        changed_files:{
          filename => src.sub('6 * 9', '6 * 9sdsd')
        }
      })
      assert_colour 'amber'
    }
  end

end