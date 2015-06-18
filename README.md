#LTI Documentation

Documentation for the IMS&trade; LTI specification.
The site is built using 
We use to build the site using Markdown, and we host it by pushing HTML to [GitHub Pages](http://pages.github.com/).

## Installation

To contribute to the site you'll need to set it up to run locally. We use [Jekyll](http://jekyllrb.com/) for bulding the
site. And most of the documentation is written using in Markdown.

### Dependencies

In order to run the site you will need a few things installed:

 - [Ruby](http://www.ruby-lang.org/) (version >= 1.8.7)
 - [RubyGems](http://rubygems.org/) (version >= 1.3.7)
 - [Bundler](http://gembundler.com/)
 - [Node.js](https://nodejs.org/)
 - [Grunt](http://gruntjs.com/)
 
### Installation


### Setup for gh-pages
If you want to use gh-pages you need to setup your _site directory to point to the gh_pages branch.
 
First create an orphan branch with an initial commit

    $ cd repository
    
    $ git checkout --orphan gh-pages
    # Creates our branch, without any parents (it's an orphan!)
    # Switched to a new branch 'gh-pages'
    
    $ git rm -rf .
    
    
Now create the initial commit

    $ echo "My Page" > index.html
    $ git add index.html
    $ git commit -a -m "First pages commit"
    $ git push origin gh-pages
    
Switch back to your master branch, and clone the gh-pages branch into _site

    $ git clone {your repository} -b gh-pages _site