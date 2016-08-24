<article>
	<section>
		<span>
			<div ng-repeat="d in dialogs" ng-click="messages = d.messages">
				{{d.users[0].fio}} vs {{d.users[1].fio}}
			</div>
		</span>
		<span>
			<div ng-repeat="m in messages">{{m.text}}</div>
		</span>
	</section>
</article>
