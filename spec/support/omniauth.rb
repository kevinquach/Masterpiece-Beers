def set_omniauth(opts = {})
  default = {:provider => :facebook,
             :uuid     => "1234",
             :facebook => {
                            :email => "foobar@example.com",
                            :gender => "Male",
                            :first_name => "foo",
                            :last_name => "bar"
                          }
            }
 
  credentials = default.merge(opts)
  provider = credentials[:provider]
  user_info = credentials[:provider]
 
  OmniAuth.config.test_mode = true
 
  OmniAuth.config.mock_auth[provider] = {
    'uid' => credentials[:uuid],
    "extra" => {
    "user_hash" => {
      "email" => user_info[:email],
      "first_name" => user_info[:first_name],
      "last_name" => user_info[:last_name],
      "gender" => user_info[:gender]
      }
    }
  }
end
 
def set_invalid_omniauth(opts = {})
 
  credentials = { :provider => :facebook,
                  :invalid  => :invalid_crendentials
                 }.merge(opts)
 
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[credentials[:provider]] = credentials[:invalid]
 
end