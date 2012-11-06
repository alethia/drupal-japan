How To Contribute
=================
1. You must have a github account. https://github.com
2. Fork and Contribute to the project. https://help.github.com/articles/fork-a-repo
3. Follow the steps below.
4. Once you have made your changes you can then do a pull request:
https://help.github.com/articles/using-pull-requests
5. Once this is done, the development team will review the changes and the feature
will be accepted or rejected. If rejected the user can issues with the aid of the
development team.
6. Once the code has been merged it will be pushed to the live site on the set
release day.
7. Kickback open a beer and be proud of yourself for giving back!

Commiting
=========
A branch should be created when starting to work on a new story. Its name should
look like feature/story-short-description-12345678 (12345678 being the story id. in
Pivotal), "feature" being replaced by "bug" when fixing a bug that has its own
story. When finished (and accepted if needed), the branch will be merged to
staging to be sent for approval. When approved, same code will be merged in master.
When commiting, be sure to add a usefull commit comment. You can also add the
Pivotal story id. in the comment to make the commit appear in the story's log.
Example:
  [#12345678] Add an administration interface to my story.
Optionnaly, if words like "fix", "fixes", "deliver", "delivers" (and others,
to try) are added in the comment (example: [Fixes #12345678]), then the story's
status will be automatically changed accordingly.

Requirements
============
* Web server: Apache 2.x.
* Database server: MySQL 5.0.15 or higher with PDO.
* PHP: 5.3 or higher.
* Drush: Drush 4 with Drush Make, or Drush 5 and higher.

Project installation
====================
After cloning Git repository on your local file system, you need to build the
source code with drush make:
 $ drush make custom/scripts/dcj.make

Note: before invoking drush make please make sure that folder www is writeable
by you, otherwise drush cannot extract the downloaded files to the www directory.

The settings.php file as been a bit tweaked, so you should input you database
credentials manually by creating the file sites/default/db.settings.php.
 $ cp sites/default/example.db.settings.php sites/default/db.settings.php
 $ vim sites/default/db.settings.php

Then, as everything is meant to be tracked on Git, you just need to install the
website, either following the install process going to install.php with a web
browser, or using drush:
 $ drush site-install drupaljapan --account-pass=admin

Drush make file
===============
This files describes all the modules, libraries, patches needed to run the site.
Instead of keeping track of all contrib code in git repository, we only keep track
of this make file. This should always describe precisely the modules used, their
version (use "git" download type when using a dev version, which should be avoided
as much as needed).

Profile
=======
All Drupal custom code is placed inside a custom profile, located in /profiles.

Dependencies
============
When installing a new contrib. project, it should be added in the project.make
file, so that it can be downloaded when building the project source code, and
also in the profile's dependencies (in .info file), so that it is installed
during site installation.

Features
========
When possible, Drupal settings should be exported in features, instead of coded
in custom modules. Features can contain many configuration elements, such as
content types, image presets, views, Drupal variables (thanks to Strongarm),
and more.
Features can contain custom code too, in their .module file (or any needed
include file). Be sure to keep in a same module/feature all code related to one 
fonctionnality, and nothing else.

Custom modules
==============
Each custom module should focus on a specific need, and, when possible, be
generic enough to be contributed on Drupal.org. For general customization, use
the profile, which acts as a custom module (.profile file replaces .module,
.install file has the same use as a module's one, profile's weight is very high,
so it will probably be called last).

Staying up-to-date
==================
In development phase, be sure to regularly update your Git workspace (git pull),
and to run make file again (using drush make command above). As new versions of
modules can appear, make sure database is up-to-date too (drush updb).
During first development phase, installing the site from scratch is a good way
to ensure nothing has been left out.

Update phase
=============
As soon as the drupal.co.jp site has been made live, and we want to keep the data,
the website will not be installed from scratch anymore.
This means update functions (hook_update_N) should be written. They may contain
installation of new modules, features revert, or any needed custom code.

Hacking
=======
Hacking is prohibited! Most of the time, instead of hacking, there is a clean
way to plug in a module's process (using hooks), and customize the execution.
When the considered module has a bug, instead of just hacking it, a clean patch
should be written and uploaded on Drupal.org (in the corresponding issue queue),
and added to the make file until the patch gets approved and commited.

Goal
====
EVERY single piece of development, configuration, created data needs to be put
down in code. This provides the drupal-japan team a lot of benefits:
 - delivery process is standardized, and should take a few minutes
 - everyone has the assurance that achieved work is tracked, and won't be lost
 - any new developper will easily build a development platform
 - this prepares to work with automated tools (continuous integration, testing).
In one sentence: one should be able to build a full-featured website with only
Git repository  and quick and generic procedures.
