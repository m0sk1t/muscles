<article>
	<section>
		<h3>{{contest.title}}</h3>

		<input type="text" placeholder="type" ng-model="contest.type"><br />
		<input type="text" placeholder="title" ng-model="contest.title"><br />
		<input type="number" placeholder="prize" ng-model="contest.prize"><br />
		<input type="date" placeholder="dateEnd" ng-model="contest.dateEnd"><br />
		<input type="date" placeholder="dateStart" ng-model="contest.dateStart"><br />
		<input type="number" placeholder="freeVoices" ng-model="contest.freeVoices"><br />
		<input type="number" placeholder="paidVoices" ng-model="contest.paidVoices"><br />
		<input type="text" placeholder="description" ng-model="contest.description"><br />
		<div>
			<div ng-repeat="p in contest.participants track by $index">
				{{p.name}}<div ng-click="del($index);"></div>
			</div>
		</div>
		<button ng-click="update_contest()">Save</button>
	</section>
</article>
