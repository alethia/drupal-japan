<?php
/**
 * @file
 * drupal_japan_i18n_settings.features.inc
 */

/**
 * Implements hook_ctools_plugin_api().
 */
function drupal_japan_i18n_settings_ctools_plugin_api() {
  list($module, $api) = func_get_args();
  if ($module == "strongarm" && $api == "strongarm") {
    return array("version" => "1");
  }
}
