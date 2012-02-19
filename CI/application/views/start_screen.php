<div class="row">
	<div class="span3 offset2">
	<!-- Fill in some content here -->
		Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.
	</div>
	
	<!-- Login mechanism goes in here -->
	<div class="span4 offset1">
		<?php
			$attributes_form = array('class' => 'well form-search', 'id' => 'login_form');
			echo form_open('dashboard/login',$attributes_form);
			?>
			<div id="divUserName" class="control-group">
					<div class="controls">
						<?php
						$attributes_input = array('name' => 'user_name', 'placeholder' => 'Username' ,'id' => 'txtUserName', 'class' => 'input-medium', 'style' => 'height: 30px;');
						echo form_input($attributes_input);
							?>
					</div>
					<div id="divPassWord" class="control-group">
					<div class="controls">
					<?php
					$attributes_input = array('name' => 'password', 'placeholder' => 'Password' ,'id' => 'txtPassWord', 'class' => 'input-medium', 'style' => 'margin-top: 15px; height: 30px;');
					echo form_input($attributes_input);
						?>
					</div>
					<button class="btn btn-primary" type="submit" style="height: 80px; margin-left: 180px; margin-bottom: 0px; margin-top: -90px; width: 80px;">Login</button>
				</div>
			</div>
	</div>
</div>