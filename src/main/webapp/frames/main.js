
  $(document).ready(function(){

	  $("body").on("click", "#listarEntidades",function(event){
			window.location.replace("http://spr.stp.gov.py/entidad.jsp");
		});
		$("body").on("click", "#listarProgramacion",function(event){
			window.location.replace("./programacion.jsp");
		});
		$("body").on("click", "#listarProductos",function(event){
			window.location.replace("./producto.jsp");
		});
		$("body").on("click", "#listarProgramas",function(event){
			window.location.replace("./pnd.jsp");
		});
		
		$("body").on("click", ".fa-minus",function(event){
			var id =event.target.attributes[0].nodeValue;
			 $("#"+id).parent().parent().parent().next().attr("style","display:none" );
			 $("#"+id).parent().parent().parent().parent().attr("class",$("#"+id).parent().parent().parent().parent().attr("class")+" collapsed-box" );
			 $("#"+id).attr("class", "fa fa-plus");
			 event.stopPropagation();
		});
		$("body").on("click", ".fa-plus",function(event){
			var id =event.target.attributes[0].nodeValue;
			 $("#"+id).parent().parent().parent().next().attr("style","display:block" );
			 $("#"+id).parent().parent().parent().parent().attr("class",$("#"+id).parent().parent().parent().parent().attr("class").replace("collapsed-box",""));
			 $("#"+id).attr("class", "fa fa-minus");
			 event.stopPropagation();
		});
		
		//$("textarea").attr('disabled','disabled');
		//$("select").attr('disabled','disabled');
		//$('input[type=text]').attr("disabled",true);
		//$("input").removeAttr('disabled');
		//$('input [type="text"]').attr('disabled','disabled');
		
  });