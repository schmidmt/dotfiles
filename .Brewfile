# vim: ft=ruby

# In your main Brewfile
instance_eval(IO.read('.Brewfile.core'))

# You can add conditional logic here
if ENV['MACHINE_TYPE'] == 'work'
  instance_eval(IO.read('.Brewfile.work'))
elsif ENV['MACHINE_TYPE'] == 'home'
  instance_eval(IO.read('.Brewfile.home'))
end
