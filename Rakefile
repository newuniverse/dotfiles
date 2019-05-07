task :all do
    system('rake install')
    system('rake update')
    puts 'rake clean'
    # system('rake clean')
    # system('rake deploy')
    # system('rake init')
end

task :install do 
    puts 'git clone dotfiles repository'
    system('git clone https://github.com/newuniverse/dotfiles.git')
    system('cd dotfiles')
end

task :deploy do
    puts 'Start to deploy dotfiles to home directory.'
    puts ''
    (Dir.glob(".*", File::FNM_DOTMATCH) - %w[. .. .git .DS_Store]).each do |dotfile|
        system("ln -sfnv #{Dir.pwd}/#{dotfile} #{Dir.home}/#{dotfile}")   
    end
end

task :init do 
    system("/usr/bin/ruby -e '$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)'")
    system("brew install argon/mas/mas")
    system("brew install rcmdnk/file/brew-file")
    system("brew file install")
end

task :update do
    puts 'sync current dotfiles with git repository.'
    puts ''
    system('git pull origin master')
end

task :clean do
    puts 'remove dotfiles from home directory.'
    puts ''
    (Dir.glob(".*", File::FNM_DOTMATCH) - %w[. .. .git .DS_Store]).each do |dotfile|
        system(
            "
            rm -vrf #{Dir.home}/#{dotfile}
            "
        )  
    end
end