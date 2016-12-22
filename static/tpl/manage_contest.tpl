<article>
	<section>
		<h3>{{contest.title}}</h3>

		<input type="text" placeholder="type" ng-model="contest.type"><br />
		<input type="text" placeholder="title" ng-model="contest.title"><br />
		<input type="number" placeholder="prize" ng-model="contest.prize">руб.<br />
		<input type="date" placeholder="dateEnd" ng-model="contest.dateEnd"><br />
		<input type="date" placeholder="dateStart" ng-model="contest.dateStart"><br />
		<input type="text" placeholder="description" ng-model="contest.description"><br />
		<input type="date" placeholder="dateParticipate" ng-model="contest.dateParticipate"><br />
		<div>
			<div ng-repeat="p in contest.participants track by $index" style="width: 25%">
				<img ng-src="{{p.avatar}}">
				<a href="#/manage/user/{{p.id}}">Посмотреть профиль пользователя</a>
				{{p.name}}<div ng-click="del($index);">DEL</div>
			</div>
		</div>
		<button ng-click="update_contest()">Save</button>
	</section>
</article>
