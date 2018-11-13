$(document).ready(function(){
	var home = window.location.href;
	
	var table = $('#tbl-product').DataTable({
		ajax: home + "/frontend/index_reload",
		responsive: true,
		columnDefs: [ 
			{ width: "10%", orderable: false, targets: [7] }
		]
	});
	
	var table2 = $('#tbl-verification').DataTable({
		ajax: home + "/frontend/validation_reload",
		responsive: true,
		columnDefs: [ 
			{ width: "auto", orderable: false, targets: [1] }
		],
		dom: '<lf<t>ip>',
		bLengthChange: false,
		bFilter: true,
		bInfo: false,
		bAutoWidth: false 
	});
	
	setInterval( function () {
		table.ajax.reload( null, false ); 
	}, 1000 );	
	
	setInterval( function () {
		table2.ajax.reload( null, false ); 
	}, 1000 );	
	
	$('.modal-get-item #btn-get-item').click(function(){
		var id = $(this).attr('data-id');
		var item_get = $('#getItemValue-'+id).val();
		var item_stock = $('#getProductStocks-'+id).val();
		// alert(item_get + " > " + item_stock);
		// return false;
		if(item_get == "" || item_get == 0){
			alert("Item Value Not Have Value");
			return false;
		}else if(parseInt(item_get) < 0){
			alert("Not Applicable");
			return false;
		}else if(parseInt(item_get) > item_stock){
			alert("Item Value Not Be Higher To Product Stocks");
			return false;
		}else if(parseInt(item_get) < item_stock){
			return true;
		}else if(parseInt(item_stock) == 0){
			alert("No Product Stocks");
			return false;
		}else{
			return true;
		}
	});
	
	$('.modal-update-item #btn-update-item').click(function(){
		var id = $(this).attr('data-id');
		var item_get = $('#getItemValue-'+id).val();
		var item_stock = $('#getProductStocks-'+id).val();
		// alert(item_get + " > " + item_stock);
		// return false;
		if(item_get == "" || item_get == 0){
			alert("Item Value Not Have Value");
			return false;
		}else if(parseInt(item_get) < 0){
			alert("Not Applicable");
			return false;
		}else if(parseInt(item_get) > item_stock){
			alert("Item Value Not Be Higher To Product Stocks");
			return false;
		}else if(parseInt(item_get) < item_stock){
			return true;
		}else if(parseInt(item_stock) == 0){
			alert("No Product Stocks");
			return false;
		}else{
			return true;
		}
	});
	
	window.setTimeout(function() {
		$("#alert-fade").fadeTo(500, 0).slideUp(500, function(){
			$(this).remove(); 
		});
	}, 1500);
	
	$('#print-now').click(function(){
		// alert('Hello World');
		// window.print();
	});
	
	$('.print').on('click', function() {
		$.print("#printable");
	});

});
$(document).on('submit', '#formClearAllItem', function() {
    return confirm("Are you sure, you want to clear all items?");
});
$(document).on('submit', '#formDelItem', function() {
    return confirm("Are you sure, you want to remove this item?");
});