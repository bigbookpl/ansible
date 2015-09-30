user = 'bigbook'

package 'mc'
package 'nload'
package 'htop'
package 'git'
package 'curl'

package 'guake' do
  notifies :run, 'execute[set-gauke-startup]', :immediately
end

execute 'set-gauke-startup' do
  command 'cp /usr/share/applications/guake.desktop /etc/xdg/autostart/'
end

package 'zsh' do
  notifies :run, 'execute[download-ohmyzhs]', :immediately
end

execute 'download-ohmyzhs' do
  command "curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh"
  command 'chsh -s /bin/zsh'
  retries 5
end

package 'openjdk-7-jdk'
package 'chromium-browser'

directory "/home/#{user}/dev" do
  action :create
end
