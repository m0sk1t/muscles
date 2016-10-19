<article>
	<section>
		<h3>{{competition.title}}</h3>

		<input type="date" ng-model="competition.date">
		<input type="text" ng-model="competition.city">
		<input type="text" ng-model="competition.place">
		<input type="text" ng-model="competition.title">
		<input type="text" ng-model="competition.nomination">
		<input type="text" ng-model="competition.description">
		<button ng-click="update_competition()">Save</button>
	</section>
</article>
