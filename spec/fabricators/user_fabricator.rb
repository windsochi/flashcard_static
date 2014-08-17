Fabricator(:user, :class_name => "User") do
  id { sequence }
  username { "admin" }
  password { "admin" }
  email { "windsochi@gmail.com" }
  salt { "asdasdastr4325234324sdfds" }
  crypted_password { Sorcery::CryptoProviders::BCrypt.encrypt("secret", "asdasdastr4325234324sdfds") }
end
