# python

How to install and use `python`, `pip` and `virtualenv`.

## python

`python` comes with two versions 2 and 3. Unfortunately, current Amazon Linux 
2 ships with version 2, which lacks many new features. We can install newer
versions of `python` and related tools, then make an alias to ensure newer
version is used by default.

## pip

`pip` is the most used package manager for python packages.

## virtualenv

`virtualenv` means "virtual environment". It is a tool to trick your shell to
install packages to a specific project folder, or a virtual environment. This
contrasts the practice of installing the package globally or user-wise.

This is extremely useful as packages in virtual environments are completely 
isolated and portable. You may also install different versions of packages
for different projects.

The way `virtualenv` does it is to create a project-specific activation
script to replace `PATH` variables to point to a subfolder, then within it
make a copy of `python` and other related binaries.