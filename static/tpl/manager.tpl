<article>
		<ul>
			<li ng-click="page = 'managers'; get_managers();">managers</li>
			<li ng-click="page = 'videos'; get_videos();">videos</li>
			<li ng-click="page = 'photos'; get_photos();">photos</li>
			<li ng-click="page = 'users'; get_users();">users</li>
			<li ng-click="page = 'topics'; get_topics();">topics</li>
			<li ng-click="page = 'articles'; get_articles();">articles</li>
			<li ng-click="page = 'contests'; get_contests();">contests</li>
			<li ng-click="page = 'hobbies'; get_hobbies();">hobbies</li>
			<li ng-click="page = 'competitions'; get_competitions();">competitions</li>
		</ul>
	<section ng-show="page === 'managers'">
		<span ng-click="add_manager()">Add</span>
		<div ng-show="cred">
			<input type="text" ng-model="cred.login" name=""><br />
			<input type="password" ng-model="cred.password" name=""><br />
			<input type="button" name="" value="Save" ng-click="create_manager()"><br />
			<input type="button" name="" value="Cancel" ng-click="cred = null;"><br />
		</div>
		<div ng-repeat="m in managers track by $index">
			<span ng-click="delete_manager(m._id, $index);" style="background-color: #666;">DEL</span>
			{{m.login}}<br />
			<span>
				permission.users: <input type="checkbox" ng-model="m.permission.users" ng-change="set_permission(m._id, $index);"><br />
				permission.photos: <input type="checkbox" ng-model="m.permission.photos" ng-change="set_permission(m._id, $index);"><br />
				permission.videos: <input type="checkbox" ng-model="m.permission.videos" ng-change="set_permission(m._id, $index);"><br />
				permission.topics: <input type="checkbox" ng-model="m.permission.topics" ng-change="set_permission(m._id, $index);"><br />
				permission.articles: <input type="checkbox" ng-model="m.permission.articles" ng-change="set_permission(m._id, $index);"><br />
				permission.contests: <input type="checkbox" ng-model="m.permission.contests" ng-change="set_permission(m._id, $index);"><br />
				permission.hobbies: <input type="checkbox" ng-model="m.permission.hobbies" ng-change="set_permission(m._id, $index);"><br />
				permission.moderators: <input type="checkbox" ng-model="m.permission.moderators" ng-change="set_permission(m._id, $index);"><br />
				permission.competitions: <input type="checkbox" ng-model="m.permission.competitions" ng-change="set_permission(m._id, $index);"><br />
			</span>
		</div>
	</section>
	<section ng-show="page === 'videos'">
		<div ng-repeat="video in videos track by $index">
			<span style="background-color: #666" ng-click="delete_video(video._id, $index)">DEL</span>{{video.title}}
		</div>
	</section>
	<section ng-show="page === 'photos'">
		<div ng-repeat="photo in photos track by $index">
			<span style="background-color: #666" ng-click="delete_photo(photo._id, $index)">DEL</span>{{photo.title}}
		</div>
	</section>
	<section ng-show="page === 'users'">
		<div ng-repeat="user in users track by $index">
			<span style="background-color: #666" ng-click="delete_user(user._id, $index)">DEL</span>{{user.name + ' ' + user.surname}}
		</div>
	</section>
	<section ng-show="page === 'topics'">
		<div ng-repeat="topic in topics track by $index">
			<span style="background-color: #666" ng-click="delete_topic(topic._id, $index)">DEL</span>{{topic.title}}
		</div>
	</section>
	<section ng-show="page === 'articles'">
		<div ng-click="article = {}">Add</div>
		<text-angular ng-model="article"></text-angular>
		<div ng-repeat="article in articles track by $index">
			<span style="background-color: #666" ng-click="delete_article(article._id, $index)">DEL</span>{{article.title}}
		</div>
	</section>
	<section ng-show="page === 'contests'">
		<div ng-repeat="contest in contests track by $index">
			<span style="background-color: #666" ng-click="delete_contest(contest._id, $index)">DEL</span>{{contest.title}}
		</div>
	</section>
	<section ng-show="page === 'hobbies'">
		<div ng-repeat="hobbie in hobbies track by $index">
			<span style="background-color: #666" ng-click="delete_hobbie(hobbie._id, $index)">DEL</span>{{hobbie.title}}
		</div>
	</section>
	<section ng-show="page === 'competitions'">
		<div ng-repeat="competition in competitions track by $index">
			<span style="background-color: #666" ng-click="delete_competition(competition._id, $index)">DEL</span>{{competition.title}}
		</div>
	</section>
</article>
