## Prerequisites

Install Vundle:

    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

Then install all plugins:

    vim +BundleInstall +qall

## Tricks

* `:set spell` runs a spellchecker.
* `:set paste` to paste from the system clipboard without adding loads of spurious trailing parens and quotes.  `:set nopaste` turns that mode off.

### SVN Code Review Workflow

I like being able to have a list of the changed files,
and to be able to compare the modified version to the original.
There are a couple of steps to do this with nice support in Vim.
Let's say that the change to review spans revs 132 and 133, with 133 also being HEAD.
The aim is to get changes 132 and 133 saved as a patch file,
check out r131, apply the patch, and look at the differences.

* Get all the latest code: `svn up`
* Create a patch file to review changes 132 and 133: `svn diff -r131:HEAD > patchfile`
* Check out the pre-change version: `svn up -r 131`
* Apply the patch: `patch -p0 < patchfile`
* Review the changes!

To review changes in the SVN repo (either those you're about to
check in, or the code review diff applied as above), I do the following:
`:Shell svn st | egrep "^M"`
This shows me changed files (beware - new files won't show up unless you
remove the egrep!)
Navigate around that window, and `<C>-w f` to open the modified files, and
`\cv` to open up the diff view. `<C>-w _` to make the window big,` ]c` and `[c`
navigate around differences.
Open up another file with `<C>-w f`, repeat `\cv` and the diff view will
switch over to the new file.

### Git Code Review workflow

Using a similar setup to above, here's a vim / git / fugitive way to do it.
Assume the last three changes checked in need reviewing.

* Get all the latest code: `git pull --rebase`
* Check out the start point of the range to review: `git checkout --hard HEAD~3`
* Create a patch file from the range to review: `git diff HEAD~3..HEAD > patchfile`
* Apply that patchfile to the working copy: `git apply patchfile`
* Fire up Vim, and use `:Gstatus` to see the modified files, and in each file `:Gdiff` to view the diff
