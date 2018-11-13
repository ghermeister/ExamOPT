<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <!--[if IE]>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <![endif]-->
    <title><?=$title?></title>
    <!-- BOOTSTRAP CORE STYLE  -->
    <link href="<?=base_url()?>assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FONT AWESOME STYLE  -->
    <link href="<?=base_url()?>assets/css/font-awesome.css" rel="stylesheet" />
    <!-- CUSTOM STYLE  -->
    <link href="<?=base_url()?>assets/css/style.css" rel="stylesheet" />
    <!-- GOOGLE FONT -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />

</head>
<body>
    <!-- LOGO HEADER END-->
    <section class="menu-section">
        <div class="container">
            <div class="row ">
                <div class="col-md-12">
                    <div class="navbar-collapse collapse ">
                        <ul id="menu-top" class="nav navbar-nav navbar-right">
                            <li><a href="<?=base_url()?>take_exam" class="menu-top-active">Take Your Test Now!</a></li>
                            <li><a href="<?=base_url()?>sign_out">Sign Out</a></li>

                        </ul>
                    </div>
                </div>

            </div>
        </div>
    </section>
     <!-- MENU SECTION END-->
    <div class="content-wrapper <?=$this->uri->segment(1) == 'frontend' ? 'bg-prop' : ''?>">
		<div class="container">
			<?=$content?>
		</div>
    </div>
     <!-- CONTENT-WRAPPER SECTION END-->
    <section class="footer-section">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                   &copy; 2018 | Personality Test</a> 
                </div>

            </div>
        </div>
    </section>
      <!-- FOOTER SECTION END-->
    <!-- JAVASCRIPT FILES PLACED AT THE BOTTOM TO REDUCE THE LOADING TIME  -->
    <!-- CORE JQUERY  -->
    <script src="<?=base_url()?>assets/js/jquery-1.10.2.js"></script>
    <!-- BOOTSTRAP SCRIPTS  -->
    <script src="<?=base_url()?>assets/js/bootstrap.js"></script>
      <!-- CUSTOM SCRIPTS  -->
    <script src="<?=base_url()?>assets/js/custom.js"></script>
	
	<script>
		var survey = []; //Bidimensional array: [ [1,3], [2,4] ]

		//Switcher function:
		$(".rb-tab").click(function(){
		  //Spot switcher:
		  $(this).parent().find(".rb-tab").removeClass("rb-tab-active");
		  $(this).addClass("rb-tab-active");
		});

		//Save data:
		$(".trigger").click(function(){
		  //Empty array:
		  survey = [];
		  //Push data:
		  for (i=1; i<=$(".rb").length; i++) {
			var rb = "rb" + i;
			var rbValue = parseInt($("#rb-"+i).find(".rb-tab-active").attr("data-value"));
			//Bidimensional array push:
			survey.push([i, rbValue]); //Bidimensional array: [ [1,3], [2,4] ]
		  };
		  //Debug:
		  debug();
		});

		//Debug:
		function debug(){
		  var debug = "";
		  for (i=0; i<survey.length; i++) {
			debug += "Nº " + survey[i][0] + " = " + survey[i][1] + "\n";
		  };
		  alert(debug);
		};
	</script>
  
</body>
</html>
