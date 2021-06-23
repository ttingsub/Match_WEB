<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/c3/0.7.15/c3.min.css">
<style type="text/css">
#tabs { overflow:hidden;  border-bottom:1px solid #3367d6; }
#tabs li { float:left;   width:100px;  line-height:40px;  color:#3367d6; 
		 border:1px solid #3367d6;  border-bottom:none;  cursor:pointer;	
}
#tabs li.active { color:#fff;  background-color:#3367d6 }
#tabContent { height:520px; margin:20px 0;  }

.c3-axis, .c3-chart { font-size:16px; font-weight:bold; }

.legend { width:1000px;  margin:0 auto; }
.legend ul li { display:inline-block; }
.legend ul li:not(:first-child) { margin-left:30px; }
.legend .legend-item { width:15px; height:15px; display:inline-block; margin:2px 5px 0; }
.legend ul li * { vertical-align:middle; }

#tabContent .chart-top { display:none; }
#tabContent .active { display:block; }

</style>

<script type="text/javascript" 
	src="https://cdnjs.cloudflare.com/ajax/libs/c3/0.7.15/c3.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/d3/5.16.0/d3.min.js"></script>

<script type="text/javascript">
$(document).on('click', '#tabs li', function(){
	$('#tabs li').removeClass();
	$(this).addClass('active');
	var idx = $(this).index();
	
	$('#tabContent .chart-top').removeClass('active');
	$('#tabContent .chart-top').eq(idx).addClass('active');
	
	if ( idx==0 ) department_graph( $('[name=graph]:checked').val() );
	else if( idx==1 ) hirement_graph( $('[name=unit]:checked').val() );
	
}).on('change', '[name=graph]', function(){	//막대/도넛 그래프형태 선택
	department_graph( $(this).val() );
	
}).on('change', '[name=unit], #top3', function(){	//년도별/월별 데이터조회단위 선택
	if( $('#top3').prop('checked') )   //top3 체크된 경우
		hirement_graph_top3( $('[name=unit]:checked').val() );
	else
		hirement_graph( $('[name=unit]:checked').val() );
	
});

$(function(){
	$('#tabs li').eq(0).trigger('click');
});

function department_graph( graph ){ //부서원수 시각화
	$('#chart').html('');
	$.ajax({
		url: 'visual/department',
		success: function( response ){
			//console.log( response )
			//[ ['부서원수', 30, 200, 100, 400, 150, 250] ] : 선그래프
			//[ ['영업부', 30], ['총부부', 120], ] : 파이그래프
			var count = [ '부서원수' ], name = [ '부서명' ], info = [];
			$(response).each(function(){
				count.push( this.COUNT );
				name.push( this.DEPARTMENT_NAME );
				info.push( [ this.DEPARTMENT_NAME, this.COUNT ] );
			});
			if( graph=='bar' )
				make_chart( graph, [ name, count ] ); //선/막대 그래프
			else
				make_chart( graph, info ); //파이/도넛 그래프
			
		},error: function(req,text){
			alert(text+':'+req.status);
		}
	});
	
}

function hirement_graph_top3( unit ){ //상위3위 부서별 채용인원수 시각화
	$('.legend').css('display', 'none');
	$('#chart').html('');
	$.ajax({
		url: 'visual/top3/' + unit,
		success: function( response ){
			var info = [];
			console.log( response )
// 			 columns: [  ['영업부', 30, 200, 100, 400, 150, 250],
// 			             ['개발부', 130, 100, 140, 200, 150, 50]  ]
			
			if( unit=='year'){
				info.push ( ['부서명', '2001', '2002', '2003', '2004'
							 		 , '2005', '2006', '2007', '2008'] );
				$(response).each( function(){
					info.push( new Array( this.department_name
								, this.y2001, this.y2002, this.y2003, this.y2004
								, this.y2005, this.y2006, this.y2007, this.y2008 ) );
				});
			}else{
				info.push( ['부서명', '01', '02', '03', '04', '05', '06'
									, '07', '08', '09', '10', '11', '12' ] );
				$(response).each(function(){
					info.push( [ this.DEPARTMENT_NAME, this.M01, this.M02, this.M03, this.M04
													 , this.M05, this.M06, this.M07, this.M08
													 , this.M09, this.M10, this.M11, this.M12 ] );
				});
			}
			make_chart_top3(unit, info);
			
		},error: function(req,text){
			alert(text+':'+req.status);
		}
	});
}

function make_chart_top3(unit, info){ //TOP3 부서별 년도별/월별 채용인원수 시각화
	var chart = c3.generate({
		bindto: '#chart',
		data: { columns: info, labels:true, type: unit=='year'?'bar':'line', x:'부서명'	},
		axis: { x:{type:'category'}, y:{text:'TOP3 부서별 채용인원수', position:'outer-middle'} },
		size: { width:1000, height:420 },
		bar: { width:25 },
		grid: { y:{ show:true } },
		padding: { bottom:50 },
		legend: { item: { tile:{width:15, height:15} }, padding:40 }
	});
	$('.c3-line').css('stroke-width', '3px');
	$('.c3-legend-item').css('font-size', '16px');
}

function hirement_graph( unit ){ //채용인원수 시각화
	$('#chart').html('');
	$.ajax({
		url: 'visual/' + unit,
		success: function( response ){
			//console.log( response )
			var name = [ unit ], count = [ '채용인원수' ];
			$(response).each(function(){
				name.push( this.UNIT );
				count.push( this.COUNT );
			});
			make_chart_hirement( unit, [ name, count ] );
			
		},error: function(req,text){
			alert(text+':'+req.status);
		}
	});
}


function make_chart_hirement( unit, info ){ //그래프 만들기
	$('.legend').css('display', 'none');

	var chart = c3.generate({
		bindto : '#chart',
		data : {
			columns: info,  type: 'bar', x: unit, labels: true,
			color: function(c, d){ return colors[ setColor(d.value) ]; }
		},
		axis: { x: { type:'category' }  },
		size: { width:1000, height:420 },
		bar: { width:30 },
		grid: { y: { show:true } },
		legend: { hide: true }
	});
	
	$('.legend-item').each(function(idx){
		$(this).css('background-color', colors[idx]);
	});
	$('.legend').css('display', 'block');
}

function make_chart( graph, info ){ //그래프 만들기
	//1.선그래프(기본)
	//line_type( info );
	
	//2.파이그래프
	//pie_type( info );
	$('.legend').css('display', 'none');
	
	if( graph=='donut' )
		//3.도넛그래프
		donut_type( info );
	else
		//4.막대그래프
		bar_type( info );

}

var colors = [ '#6394ff', '#fc6500', '#0f8c24', '#0000ff', '#6600a6', '#ff99ff'
				, '#ff0000', '#7568ff', '#804100', '#bdd92e', '#5db8fc', '#ffbdbd' ];

function bar_type( info ){
	console.log(info )
	var chart = c3.generate({
		bindto: '#chart',
		data: { columns:info, type:'bar', x:'부서명', labels:true /* 데이터라벨 */ , 
				//color: function(c, d){ return colors[ d.index ]; } /* 부서별로 색상을 다르게 */
				color: function(c, d){ return colors[ setColor(d.value) ]; } /* 사원수별로 색상을 다르게 */
		}, 
		axis: { x:{ type:'category', tick:{ rotate:-60} },
				y:{ label: { text:info[1][0], position: 'outer-middle' }   }
		},
		legend: { hide:true }, /*범례숨기기*/ 
		size: { width:1000, height:420 },
		bar: { width:30 },  /* 막대그래프 굵기 */
		grid: { y:{ show:true } } /* y축 그리드 */
	});	
	$('.legend-item').each( function(idx){
		$(this).css('background-color', colors[idx]);
	});
	$('.legend').css('display', 'block');
}

function setColor( value ){
	if( value<=10 ) return 0;
	else if( value<=20 ) return 1;
	else if( value<=30 ) return 2;
	else if( value<=40 ) return 3;
	else if( value<=50 ) return 4;
	else                 return 5;
}

function donut_type( info ){
	var chart = c3.generate({
		bindto: '#chart',
		data: {
			columns: info, type: 'donut'
		},
		size: { width:1000, height:470 },
		padding: { bottom: 50 },
		donut: {
			label: { 
				format: function(v, r, id){ return (r*100).toFixed(1) + '%('+ v +'명)'; }
			},
			width: 90,  /* 도넛두께 */
			title: '부서별 사원수'  
		}
	});	
}

function pie_type( info ){
	var chart = c3.generate({
		bindto: '#chart',
		data: {
			columns: info,
			type: 'pie'
		},
		pie: {
			label: { 
				format: function(v, r, id){
					return (r*100).toFixed(1) + '%('+ v +'명)';
				}
			}
		},
		size: { width:1000, height:470 },
		padding: { bottom: 50 }
	});	
}

function line_type(info){
	var chart = c3.generate({
		bindto: '#chart',
	    data: {
	        columns: info,
	        x: '부서명'
	    },
	    size: { width:1000, height:420 },
	    axis: {
	        x: { type: 'category' }
	    }
	});
}
</script>
</head>
<body>
<h3>사원정보 시각화</h3>

<!-- 부서별사원수 시각화 / 채용인원수 시각화 -->
<div class='w-pct80' style="margin:0 auto;">
<ul id='tabs'>
	<li class='active'>부서원수</li>
	<li>채용인원수</li>
</ul>
</div>
<div id='tabContent'>
	<div class='chart-top'>
		<label><input type='radio' name='graph' value='bar' checked />막대그래프</label>
		<label><input type='radio' name='graph' value='donut'  />도넛그래프</label>
	</div>
	<div class='chart-top'>
		<label style='margin-right:40px;'><input type='checkbox' id='top3' />TOP3 부서</label>
		<label><input type='radio' name='unit' value='year' checked />년도별</label>
		<label><input type='radio' name='unit' value='month'  />월별</label>
	</div>
	
	<div id='chart'></div>
	<div class='legend'>
		<ul><li><span class='legend-item'></span><span>0~10명</span></li>
			<li><span class='legend-item'></span><span>11~20명</span></li>
			<li><span class='legend-item'></span><span>21~30명</span></li>
			<li><span class='legend-item'></span><span>31~40명</span></li>
			<li><span class='legend-item'></span><span>41~50명</span></li>
			<li><span class='legend-item'></span><span>50명초과</span></li>
		</ul>
	</div>
</div>


</body>
</html>