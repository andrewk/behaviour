# Behaviour - Minimal Behaviour Driven Development Using Cucumber #

## What? ##
Stand-alone testing setup for web apps using selenium to drive browsers. Test your web site like a user, using a browser.
No Ruby on Rails or non-essential components. 

## Installation##

*  [Install RVM (as a user)](http://rvm.beginrescueend.com/rvm/install/)

*  Install Ruby 1.9.2 (osx 10.6 64bit)
    
      `$ rvm install 1.9.2 -C --with-readline-dir=/opt/local,--build=x86_64-apple-darwin10`

*  Switch to that newly installed version of Ruby.

      `$ rvm use 1.9.2`

*  `cd` to your local repo, then run the following

      `$ rvm gemset create 'behavior'`
      
      `$ echo 'rvm ruby-1.9.2@behaviour' > .rvmrc`
  
  This will create a fresh gemset and instruct RVM to always use that gemset when in the `behaviour` project
  
*  Now we install the required gems, but first we need to install bundler

      `$ gem install bundler`
      
      `$ bundle install`
      
   Run `gem list` to see a list of all your freshly-installed gems.
   
   
If you want to use this gemset and version of Ruby as your system default, run `rvm 1.9.2@behaviour --default`. To return to your system installed version and gemset, run `rvm system`

## Woot. Now What? ##

Run `cucumber features`. You should see Firefox pop up and various cool shit happen. Good Times™

[Write Tests](https://github.com/jnicklas/capybara). Run them and watch them fail. Write code to make them pass. Repeat. Win.

## Testing in Internet Explorer ##

Testing in on a remote Windows machine is supported. See comments in features/support/env.rb for details.
