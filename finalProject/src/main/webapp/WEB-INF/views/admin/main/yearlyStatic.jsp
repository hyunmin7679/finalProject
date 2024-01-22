<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="row" >
	<div class="col-lg-6 col-md-12 col-7 mb-4">
		<div class="card">
			<div class="card-body ">
				<div
					class="card-title d-flex align-items-start justify-content-between">
					<div class="avatar flex-shrink-0">
						<svg class="rounded" xmlns="http://www.w3.org/2000/svg" width="40" height="40" viewBox="0 0 24 24" style="background-color:rgb(230, 255, 230); fill: rgb(128, 255, 128);transform: ;msFilter:;"><path d="M12 2a10 10 0 1 0 10 10A10 10 0 0 0 12 2zm0 18a8 8 0 1 1 8-8 8 8 0 0 1-8 8z"></path><path d="M12 11c-2 0-2-.63-2-1s.7-1 2-1 1.39.64 1.4 1h2A3 3 0 0 0 13 7.12V6h-2v1.09C9 7.42 8 8.71 8 10c0 1.12.52 3 4 3 2 0 2 .68 2 1s-.62 1-2 1c-1.84 0-2-.86-2-1H8c0 .92.66 2.55 3 2.92V18h2v-1.08c2-.34 3-1.63 3-2.92 0-1.12-.52-3-4-3z"></path></svg>
					</div>
				</div>
				<span class="fw-semibold d-block mb-1">${curryear} 매출액</span>
				<h3 class="card-title mb-2">₩${currsalesdf}</h3>
				<small class="text-${dfsalesdiff.contains('-') ? 'danger' : 'success'} fw-semibold"><i
					class="bx bx-${dfsalesdiff.contains('-') ? 'down' : 'up'}-arrow-alt"></i> ${dfsalesdiff}%</small>
			</div>
		</div>
	</div>
	<div class="col-lg-6 col-md-12 col-6 mb-4">
		<div class="card">
			<div class="card-body">
				<div
					class="card-title d-flex align-items-start justify-content-between">
					<div class="avatar flex-shrink-0">
						<svg class="rounded" xmlns="http://www.w3.org/2000/svg" width="40" height="40" viewBox="0 0 24 24" style="background-color: rgb(204, 245, 255); fill: rgb(0, 204, 255);transform: ;msFilter:;"><path d="M21 4H3a1 1 0 0 0-1 1v14a1 1 0 0 0 1 1h18a1 1 0 0 0 1-1V5a1 1 0 0 0-1-1zm-1 11a3 3 0 0 0-3 3H7a3 3 0 0 0-3-3V9a3 3 0 0 0 3-3h10a3 3 0 0 0 3 3v6z"></path><path d="M12 8c-2.206 0-4 1.794-4 4s1.794 4 4 4 4-1.794 4-4-1.794-4-4-4zm0 6c-1.103 0-2-.897-2-2s.897-2 2-2 2 .897 2 2-.897 2-2 2z"></path></svg>
					</div>
				</div>
				<span class="fw-semibold d-block mb-1">${curryear} 수익</span>
				<h3 class="card-title text-nowrap mb-1">₩${currprofitdf }</h3>
				<small class="text-${dfsalesdiff.contains('-') ? 'danger' : 'success'} fw-semibold"><i
					class="bx bx-${dfsalesdiff.contains('-') ? 'down' : 'up'}-arrow-alt"></i> ${dfprofitdiff }%</small>
			</div>
		</div>
	</div>
	<div class="col-6 mb-4">
		<div class="card">
			<div class="card-body">
				<div
					class="card-title d-flex align-items-start justify-content-between">
					<div class="avatar flex-shrink-0">
						<svg class="rounded text-decoration-line-through" xmlns="http://www.w3.org/2000/svg" width="40" height="40" viewBox="0 0 24 24" style="background-color:rgb(255, 179, 179);  fill: rgb(255, 51, 51);transform: ;msFilter:;"><path d="M12 6C7.03 6 2 7.546 2 10.5v4C2 17.454 7.03 19 12 19s10-1.546 10-4.5v-4C22 7.546 16.97 6 12 6zm-8 8.5v-1.197a9.989 9.989 0 0 0 2 .86v1.881c-1.312-.514-2-1.126-2-1.544zm12 .148v1.971c-.867.179-1.867.31-3 .358v-2a21.75 21.75 0 0 0 3-.329zm-5 2.33a18.788 18.788 0 0 1-3-.358v-1.971c.959.174 1.972.287 3 .33v1.999zm7-.934v-1.881a9.931 9.931 0 0 0 2-.86V14.5c0 .418-.687 1.03-2 1.544zM12 13c-5.177 0-8-1.651-8-2.5S6.823 8 12 8s8 1.651 8 2.5-2.823 2.5-8 2.5z"></path></svg>
					</div>
				</div>
				<span class="fw-semibold d-block mb-1">${curryear} 지출액</span>
				<h3 class="card-title text-nowrap mb-2">₩${currexpensedf }</h3>
				<small class="text-${dfsalesdiff.contains('-') ? 'success' : 'danger'} fw-semibold"><i
					class="bx bx-${dfsalesdiff.contains('-') ? 'down' : 'up'}-arrow-alt"></i> ${dfexpensediff }%</small>
			</div>
		</div>
	</div>
	<div class="col-6 mb-4">
		<div class="card">
			<div class="card-body">
				<div
					class="card-title d-flex align-items-start justify-content-between">
					<div class="avatar flex-shrink-0">
						<svg class="rounded" xmlns="http://www.w3.org/2000/svg" width="40" height="40" viewBox="0 0 24 24" style="background-color:rgb(255, 255, 230); fill: rgb(255, 255, 26);transform: ;msFilter:;"><path d="M21 4H2v2h2.3l3.28 9a3 3 0 0 0 2.82 2H19v-2h-8.6a1 1 0 0 1-.94-.66L9 13h9.28a2 2 0 0 0 1.92-1.45L22 5.27A1 1 0 0 0 21.27 4 .84.84 0 0 0 21 4zm-2.75 7h-10L6.43 6h13.24z"></path><circle cx="10.5" cy="19.5" r="1.5"></circle><circle cx="16.5" cy="19.5" r="1.5"></circle></svg>
					</div>
				</div>
				<span class="fw-semibold d-block mb-1">${curryear} 주문수량</span>
				<h3 class="card-title mb-2">${currordersdf}&nbsp;건</h3>
				<small class="text-${dforderdiff.contains('-') ? 'danger' : 'success'} fw-semibold"><i
					class="bx bx-${dforderdiff.contains('-') ? 'down' : 'up'}-arrow-alt"></i> ${dforderdiff }%</small>
			</div>
		</div>
	</div>
</div>