<article style="display: flex;">
	<ul style="flex: 1; font-size: 1.5rem; list-style-type: none;">
		<li>Управление</li>
		<li ng-show="manager.permission.managers" ng-class="{'active': page === 'managers'}" ng-click="page = 'managers'; get_managers();">Менеджерами</li>
		<li ng-show="manager.permission.users" ng-class="{'active': page === 'users'}" ng-click="page = 'users'; get_users();">Пользователями</li>
		<li ng-show="manager.permission.articles" ng-class="{'active': page === 'articles'}" ng-click="page = 'articles'; get_articles();">Статьями</li>
		<li ng-show="manager.permission.contests" ng-class="{'active': page === 'contests'}" ng-click="page = 'contests'; get_contests();">Конкурсами</li>
		<li ng-show="manager.permission.competitions" ng-class="{'active': page === 'competitions'}" ng-click="page = 'competitions'; get_competitions();">Соревнованиями</li>
		<li ng-show="manager.permission.sports" ng-class="{'active': page === 'sports'}" ng-click="page = 'sports'; get_sports();">Видами спорта</li>
		<li ng-show="manager.permission.photos" ng-class="{'active': page === 'photos'}" ng-click="page = 'photos'; get_photos();">Пользовательскими фото</li>
		<li ng-show="manager.permission.videos" ng-class="{'active': page === 'videos'}" ng-click="page = 'videos'; get_videos();">Пользовательскими видео</li>
		<li ng-show="manager.permission.topics" ng-class="{'active': page === 'topics'}" ng-click="page = 'topics'; get_topics();">Пользовательскими объявлениями</li>
		<li ng-show="manager.permission.hobbies" ng-class="{'active': page === 'hobbies'}" ng-click="page = 'hobbies'; get_hobbies();">Дополнительной информацией</li>
	</ul>
	<section
		ng-show="page === 'managers'"
		style="flex: 3; overflow-y: auto;"
	>
		<span ng-click="add_manager()">Add</span>
		<div ng-show="cred">
			<input type="text" ng-model="cred.login"><br />
			<input type="password" ng-model="cred.password"><br />
			<input type="button" value="Save" ng-click="create_manager()"><br />
			<input type="button" value="Cancel" ng-click="cred = null;"><br />
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
				permission.sports: <input type="checkbox" ng-model="m.permission.sports" ng-change="set_permission(m._id, $index);"><br />
				permission.hobbies: <input type="checkbox" ng-model="m.permission.hobbies" ng-change="set_permission(m._id, $index);"><br />
				permission.managers: <input type="checkbox" ng-model="m.permission.managers" ng-change="set_permission(m._id, $index);"><br />
				permission.competitions: <input type="checkbox" ng-model="m.permission.competitions" ng-change="set_permission(m._id, $index);"><br />
			</span>
		</div>
	</section>
	<section
		ng-show="page === 'videos'"
		style="display: flex; flex-wrap: wrap; flex: 3; overflow-y: auto;"
	>
		<div ng-repeat="video in videos track by $index" style="width: 10%">
			<span style="background-color: #666" ng-click="delete_video(video._id, $index)">DEL</span>{{video.title}}
			<img ng-src="{{video.thumbnail}}">
		</div>
	</section>
	<section 
		ng-show="page === 'photos'"
		style="display: flex; flex-wrap: wrap; flex: 3; overflow-y: auto;"
	>
		<div ng-repeat="photo in photos track by $index" style="width: 10%">
			<span style="background-color: #666" ng-click="delete_photo(photo._id, $index)">DEL</span>{{photo.title}}
			<img ng-src="{{photo.image}}">
		</div>
	</section>
	<section 
		ng-show="page === 'users'"
		style="flex: 3; overflow-y: auto;"
	>
		<div ng-repeat="user in users track by $index" style="width: 10%">
			<span style="background-color: #666" ng-click="delete_user(user._id, $index)">DEL</span>
			<a href="#/manage/user/{{user._id}}">EDIT</a>{{user.name + ' ' + user.surname}}
			<img ng-src="{{user.avatar || '/images/avatar.jpg'}}">
		</div>
	</section>
	<section 
		ng-show="page === 'topics'"
		style="flex: 3; overflow-y: auto;"
	>
		<div ng-repeat="topic in topics track by $index">
			<span style="background-color: #666" ng-click="delete_topic(topic._id, $index)">DEL</span>{{topic.text}}
		</div>
	</section>
	<section 
		ng-show="page === 'articles'"
		style="flex: 3; overflow-y: auto;"
	>
		<button ng-click="create_article();">Add</button>
		<div ng-repeat="article in articles track by $index">
			<span style="background-color: #666" ng-click="delete_article(article._id, $index)">DEL</span>
			<a href="#/manage/article/{{article._id}}">EDIT</a><br />
			<h3>{{article.title}}</h3>
			<div ng-bind-html="article_html(article.text)"><div>
		</div>
	</section>
	<section 
		ng-show="page === 'contests'"
		style="flex: 3; overflow-y: auto;"
	>
		<button ng-click="create_contest()">Add</button>
		<div ng-repeat="contest in contests track by $index">
			<span style="background-color: #666" ng-click="delete_contest(contest._id, $index)">DEL</span>
			<a href="#/manage/contest/{{contest._id}}">EDIT</a><br />
			{{contest.title}}
		</div>
	</section>
	<section 
		ng-show="page === 'hobbies'"
		style="flex: 3; overflow-y: auto;"
	>
		<div ng-repeat="hobbie in hobbies track by $index">
			<span style="background-color: #666" ng-click="delete_hobbie(hobbie._id, $index)">DEL</span>{{hobbie.title}}
		</div>
	</section>
	<section 
		ng-show="page === 'sports'"
		style="flex: 3; overflow-y: auto;"
	>
		<div ng-repeat="sport in sports track by $index">
			<span style="background-color: #666" ng-click="delete_sport(sport._id, $index)">DEL</span>
			{{sport.title}}
		</div>
	</section>
	<section 
		ng-show="page === 'competitions'"
		style="flex: 3; overflow-y: auto;"
	>
		<button ng-click="create_competition()">Add</button>
		<div ng-repeat="competition in competitions track by $index">
			<span style="background-color: #666" ng-click="delete_competition(competition._id, $index)">DEL</span>
			<a href="#/manage/competition/{{competition._id}}">EDIT</a>
			{{competition.title}}
		</div>
	</section>
</article>
