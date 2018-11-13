<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<h1 class="">
			<?php
				if(count($questions) == 0):
					 
				else:
					$count = 1;
					$attr = array('class' => 'form-horizontal', 'id' => 'formSubmitTest');
					echo form_open_multipart(base_url() . "submit_test", $attr); 
					foreach($questions as $question):
			?>
				<h3><b><?=$count?>. <?=$question->text?></b><h3>
				<label class="container-box radio-inline">
					<input type="radio" name="opt<?=$question->ID?>" value="1" required="required">1
					<span class="checkmark"></span>
				</label>&nbsp;
				<label class="container-box radio-inline">
					<input type="radio" name="opt<?=$question->ID?>" value="2">2
					<span class="checkmark"></span>
				</label>&nbsp;
				<label class="container-box radio-inline">
					<input type="radio" name="opt<?=$question->ID?>" value="3">3
					<span class="checkmark"></span>
				</label>&nbsp;
				<label class="container-box radio-inline">
					<input type="radio" name="opt<?=$question->ID?>" value="4">4
					<span class="checkmark"></span>
				</label>&nbsp;
				<label class="container-box radio-inline">
					<input type="radio" name="opt<?=$question->ID?>" value="5">5
					<span class="checkmark"></span>
				</label>&nbsp;
				<label class="container-box radio-inline">
					<input type="radio" name="opt<?=$question->ID?>" value="6">6
					<span class="checkmark"></span>
				</label>&nbsp;
			<?php
					$count++;
					endforeach;
			?>
				<br/>
				<br/>
				<button class="btn btn-success btn-lg" type="submit">Submit</button>
			<?php
					echo form_close();
				endif;
			?>
		</h1>
	</div>
</div>