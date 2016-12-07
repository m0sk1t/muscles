<article class="ya-dialoges ya-container">
	<div class="ya-narrower">
		<div class="ya-row">
			<div class="ya-grid-4-5">

			</div>
		</div>
	</div>
	<section>
		<span>
			<span>
				<div ng-repeat="d in dialogs track by $index" ng-click="set_messages(d, $index);">
					{{with_user(d)}} <!-- <i class="fa fa-lg fa-close" ng-click="delete_dialog(d, $index)"></i> -->
				</div>
			</span>
			<span>
				<div ng-repeat="m in messages">{{m.text}}</div>
				<form ng-submit="add_message()" ng-show="messages.length">
					<input type="text" ng-model="message">
				</form>
			</span>
		</span>
	</section>
</article>
