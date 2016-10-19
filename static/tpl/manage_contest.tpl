<article>
	<section>
		<h3>{{contest.title}}</h3>

		<input type="text" ng-model="contest.type">
		<input type="text" ng-model="contest.title">
		<input type="number" ng-model="contest.prize">
		<input type="date" ng-model="contest.dateEnd">
		<input type="date" ng-model="contest.dateStart">
		<input type="number" ng-model="contest.freeVoices">
		<input type="number" ng-model="contest.paidVoices">
		<input type="text" ng-model="contest.description">
		<div>
			<div ng-repeat="p in contest.participants track by $index">
				{{p.name}}<div ng-click="del($index);"></div>
			</div>
		</div>
		<button ng-click="update_contest()">Save</button>
	</section>
</article>
