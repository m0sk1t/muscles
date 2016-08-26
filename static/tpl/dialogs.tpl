<article>
	<section>
		<span>
			<span>
				<div ng-repeat="d in dialogs track by $index" ng-click="set_messages(d);">
					{{with_user(d)}} <i class="fa fa-lg fa-close" ng-click="delete_dialog(d, $index)"></i>
				</div>
			</span>
			<span>
				<div ng-repeat="m in messages">{{m.text}}</div>
			</span>
		</span>
	</section>
</article>
