$(document).ready(function(){
	var home = window.location.href;
	// alert(home);
	
	$('#tbl-product').DataTable({
		responsive: true,
		dom: 'Rlfrtip',
		colReorder: {
			realtime: true
		},
		columnDefs: [ 
			{ orderable: false, targets: [8] }
		],
	});
	$('#tbl-product-assembly').DataTable({
		responsive: true,
		dom: 'Rlfrtip',
		colReorder: {
			realtime: true
		},
		refreshTableData: function(dt, data) {
			if (!data) {
				data = dt.data();
			}
	 
			dt.clear();
			dt.rows.add( data ).draw();
		},
		columnDefs: [ 
			{ orderable: false, targets: [1] }
		],
	});
	$('#tbl-product-returned').DataTable({
		responsive: true,
		dom: 'Rlfrtip',
		colReorder: {
			realtime: true
		},
		refreshTableData: function(dt, data) {
			if (!data) {
				data = dt.data();
			}
	 
			dt.clear();
			dt.rows.add( data ).draw();
		},
		columnDefs: [ 
			{ orderable: false, targets: [2] }
		],
	});
	
	var table = $('#tbl-verification').DataTable({
		ajax: home + "/products_verification_reload",
		responsive: true,
		columnDefs: [ 
			{ width: "auto", orderable: false, targets: [1] }
		],
		dom: '<lf<t>ip>',
		bLengthChange: true,
		bFilter: true,
		bInfo: true,
		bAutoWidth: true 
	});
	
	setInterval( function () {
		table.ajax.reload( null, false ); 
	}, 1000 );	
	
	$('#tbl-supplier').DataTable({
		responsive: true,
		dom: 'Rlfrtip',
		colReorder: {
			realtime: true
		},
		refreshTableData: function(dt, data) {
			if (!data) {
				data = dt.data();
			}
	 
			dt.clear();
			dt.rows.add( data ).draw();
		},
		columnDefs: [ 
			{ orderable: false, targets: [3] }
		],
	});
	$('#tbl-product-inventory').DataTable({
		responsive: true,
		dom: 'Rlfrtip',
		buttons: [
			'excel', 'pdf', 'print'
		],
		colReorder: {
			realtime: true
		},
		refreshTableData: function(dt, data) {
			if (!data) {
				data = dt.data();
			}
	 
			dt.clear();
			dt.rows.add( data ).draw();
		}
	});
	$('#tbl-sales-inventory').DataTable({
		responsive: true,
		dom: 'Rlfrtip',
		colReorder: {
			realtime: true
		},
		columnDefs: [ 
			{ orderable: false, targets: [1] }
		],
	});
	$('#tbl-users').DataTable({
		responsive: true,
		dom: 'Rlfrtip',
		colReorder: {
			realtime: true
		},
		columnDefs: [ 
			{ orderable: false, targets: [4] }
		],
	});
	$('#tbl-product-log').DataTable({
		responsive: true,
		dom: 'Rlfrtip',
		buttons: [
			'excel', 'pdf', 'print'
		],
		colReorder: {
			realtime: true
		},
		columnDefs: [ 
			{ orderable: false, targets: [0] }
		],
	});
	$('#tbl-system-log').DataTable({
		responsive: true,
		dom: 'Rlfrtip',
		buttons: [
			'excel', 'pdf', 'print'
		],
		colReorder: {
			realtime: true
		},
		columnDefs: [ 
			{ orderable: false, targets: [0] }
		],
	});
	
	// $('.selectpicker').selectpicker();
	
	window.setTimeout(function() {
		$("#alertErr").fadeTo(500, 0).slideUp(500, function(){
			$(this).remove(); 
		});
	}, 1500);

});