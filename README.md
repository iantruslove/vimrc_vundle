## Prerequisites

Install Vundle:

    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

Then install all plugins:

    vim +BundleInstall +qall

## Tricks

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
switch over to the new file.`]`')'

