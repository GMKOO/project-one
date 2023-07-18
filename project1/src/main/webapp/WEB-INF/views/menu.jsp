<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="./css/menu.css">
	<nav>
		<ul>
			<li onclick="link('')">Main</li>
			<li onclick="link('board')">Board</li>
			<li onclick="link('board2')">D:</li>
			<li onclick="link('mooni')">:D</li>
			<li onclick="link('notice')">Notice</li>
		</ul>
	</nav>
	<div style="height: 50px; width: 100%;"></div>
	<script>
	function link(url) { 
		location.href="./"+url;
		
	}
	
	
	</script>
	
	
	
	
	
	