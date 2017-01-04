<?php if (!defined('BASEPATH')) {exit('No direct script access allowed');
}

/**
 * Memento admin_model model
 *
 * This class handles admin_model management related functionality
 *
 * @package		Admin
 * @subpackage	admin_model
 * @author		bluehome87
 * @link		#
 * @date 		2017-01-04
 */

class practices_model extends Basic_Model {

	function __construct() {
		parent::__construct();
		$this->load->database();
	}
}