; Core version
; ------------
; Each makefile should begin by declaring the core version of Drupal that all
; projects should be compatible with.

core = 7.x

; API version
; ------------
; Every makefile needs to declare it's Drush Make API version. This version of
; drush make uses API version `2`.

api = 2

; Core project
; ------------
; In order for your makefile to generate a full Drupal site, you must include
; a core project.

projects[drupal] = 7.17

; Patch example
;projects[drupal][patch][] = "http://drupal.org/files/588928-11-drupal_http_request-partial_location_redirect-7.x.patch"
; The line "projects[drupal] = version" must become:
;projects[drupal][version] = version

; If using Pressflow instead of Drupal core:
; projects[pressflow][type] = "core"
; projects[pressflow][download][type] = "file"
; projects[pressflow][download][url] = "http://to-be-filled.tar.gz"

; Projects
; --------
; Each project that you would like to include in the makefile should be
; declared under the `projects` key.

; Modules
; -------

; Modules
projects[admin_menu] = 3.0-rc3
projects[ctools] = 1.2
projects[field_group] = 1.1
projects[libraries] = 2.0
projects[pathauto] = 1.2
projects[token] = 1.4
projects[variable] = 2.1
projects[views] = 3.5
projects[wysiwyg] = 2.2

; Languages
projects[i18n] = 1.7
projects[l10n_update] = 1.0-beta3

; Configuration saving
projects[features] = 1.0
projects[features_extra] = 1.0-alpha1
projects[strongarm] = 2.0

; Performance
projects[memcache] = 1.0
projects[varnish] = 1.0-beta1

; Themes
; ------

projects[omega] = 3.1

; Libraries
; ---------
; Non-Drupal-specific libraries (e.g. js, PHP or other Drupal-agnostic
; components) should be declared under the `libraries` key.

libraries[tinymce][download][type] = "file"
libraries[tinymce][download][url] = "http://github.com/downloads/tinymce/tinymce/tinymce_3.5.7.zip"
libraries[tinymce][directory_name] = "tinymce"


