User.delete_all
Post.delete_all
Recommendation.delete_all

wdi3_emails = %w(alberto.forn@gmail.com fede.tagliabue@gmail.com marcus.hoile@gmail.com lukru489@gmail.com peters.sammyjo@gmail.com emacca@me.com stalin.pranava@gmail.com eduard.fastovski@gmail.com ltfschoen@gmail.com cptnmrgn10@gmail.com lukemesiti@gmail.com)

wdi3_emails.each do |email|
  first_part = email[/[^@]+/]
  first_part = first_part.split('').map do |letter|
    if letter.match(/\A[\w]+\z/)
      letter
    else
      ''
    end
  end.join('')

  User.create(
    email: email,
    username: first_part,
    password: 'changeme',
    password_confirmation: 'changeme'
  )
end
