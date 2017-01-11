<article>
    <section>
        <h3>{{contest.title}}</h3>
        <div>{{contest.type}}</div>
        <div>{{contest.title}}</div>
        <div>{{contest.prize}}</div>
        <div>{{contest.dateEnd}}</div>
        <div>{{contest.dateStart}}</div>
        <div>Лайки: {{count_free_likes()}}</div>
        <div>Платные лайки: {{count_paid_likes()}}</div>
        <div>{{contest.description}}</div>
        <div>Конец срока приёма заявок: {{contest.dateParticipate}}</div>
        <div>Все конкурсанты ({{contest.participants.length}})</div>
        <div>Только новые ({{count_new_participants();}})</div>
        <div>
            <span ng-repeat="p in contest.participants">
				<a href="#/user/{{p.id}}" target="_blank">Посмотреть профиль пользователя</a>
				<img ng-src="{{p.avatar}}" style="width: 200px" />
				{{p.name}}
				<span ng-if="p.likes.paid.indexOf(options.user._id) === -1" ng-click="add_paid_like(p.id)">
					PLike
					</span>
            <span ng-if="p.likes.free.indexOf(options.user._id) === -1" ng-click="add_free_like(p.id)">
				like
				</span>
            </span>
        </div>
        <button ng-if="expired();" ng-click="participate()">{{contest.participants.indexOf(options.user._id) === -1? 'Принять участие': 'Отказаться от участия'}}</button>
    </section>
</article>