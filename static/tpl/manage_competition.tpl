<article>
	<section>
		<h3>{{competition.title}}</h3>

		<input type="date" placeholder="end" ng-model="competition.end"><br />
		<input type="date" placeholder="start" ng-model="competition.start"><br />
		<input type="text" placeholder="city" ng-model="competition.city"><br />
		<input type="text" placeholder="place" ng-model="competition.place"><br />
		<input type="text" placeholder="title" ng-model="competition.title"><br />
		<input type="text" placeholder="nomination" ng-model="competition.nomination"><br />
		<input type="text" placeholder="description" ng-model="competition.description"><br />
		<button ng-click="update_competition()">Save</button>
	</section>
</article>
