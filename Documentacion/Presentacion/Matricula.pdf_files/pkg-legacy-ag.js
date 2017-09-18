define("modules/clean/account_photo_modal/account_header",["require","exports","jquery"],function(e,t,n){"use strict";function a(t,a,_){n(t).add(a).on("click",function(t){t.preventDefault(),e(["modules/clean/account_photo_modal/controller"],function(e){return(0,e.AccountPhotoModalController.show)()})}),n(document).on("db:account_photo:photo_set",function(e){return n(a).addClass(_)}),n(document).on("db:account_photo:photo_deleted",function(e){return n(a).removeClass(_)})}function _(e){a(e.open_modal_button_selector,e.add_photo_link_selector,e.hide_add_photo_link_class)}Object.defineProperty(t,"__esModule",{value:!0}),t.init=a,t.initialize_module=_}),function(){define("modules/clean/dropbox_nav",["jquery","modules/clean/analytics","modules/clean/photos/photos_engagement_logger"],function(e,t,n){return(function(){function a(){e(".carousel-nav-item").click((function(e){return function(){return e.log_click("carousel_nav_link_click")}})(this)),e(".composer-nav-item").click((function(e){return function(){return e.log_click("composer_nav_link_click")}})(this)),e(".mailbox-nav-item").click((function(e){return function(){return e.log_click("mailbox_nav_link_click")}})(this)),e(".carousel-nav-item").click(function(){return n.log_and_send(n.CAROUSEL_NAV_LINK_CLICK)}),e(".photos-nav-item").click(function(){return n.log_and_send(n.PHOTOS_NAV_LINK_CLICK)})}return a.prototype.log_click=function(e){return t.WebMiscActivityLogger.log(e)},a})()})}.call(this),define("modules/clean/growth/admin_console_ad",["require","exports","jquery","modules/clean/analytics","modules/clean/dbmodal","modules/core/browser"],function(e,t,n,a,_,o){"use strict";Object.defineProperty(t,"__esModule",{value:!0});var r=(function(){function e(e,t,r){var i=this;this.handleCTAClick=function(e){e.preventDefault();var t=n(e.target).attr("href");return a.TeamsWebActionsLogger.log("click_admin_console_ad_cta",{},function(){return o.redirect(t)})},this.handleLinkClick=function(e){return e.preventDefault(),a.TeamsWebActionsLogger.log("click_admin_console_ad"),i.modal.show(),n(i.cta_selector).off(),n(i.cta_selector).click(i.handleCTAClick)},this.cta_selector=r,this.modal=new _.DBModal({element_id:t}),n(e).click(this.handleLinkClick)}return e})();t.AdminConsoleAd=r}),function(){define("modules/clean/photos/photos_engagement_logger",["jquery","modules/clean/ajax"],function(e,t){return(function(){function n(){}return n.Platform={WEB:"web",WEB_CAROUSEL:"web_carousel"},n.CAROUSEL_NAV_LINK_CLICK="carousel_nav_link_click",n.PHOTOS_NAV_LINK_CLICK="photos_nav_link_click",n.WEBAPP_VIEW_TIMELINE="webapp_view_gallery",n.WEBAPP_VIEW_ALBUMS_GRID="webapp_view_albums_grid",n.WEBAPP_VIEW_ALBUM="webapp_view_albums",n.WEBAPP_ACTION_ADD_TO_ALBUM="webapp_action_add_to_album",n.WEBAPP_ACTION_REMOVE_FROM_ALBUM="webapp_action_remove_from_album",n.WEBAPP_ACTION_DOWNLOAD="webapp_action_download",n.WEBAPP_ACTION_SHOW_IN_FOLDER="webapp_action_show_in_folder",n.WEBAPP_ACTION_DELETE="webapp_action_delete",n.WEBAPP_SHOW_EXCLUDE_MODAL="webapp_show_exclude_modal",n.ATTEMPT_EXCLUDE_CU_FOLDER="attempt_exclude_cu_folder",n.ATTEMPT_EXCLUDE_DROPBOX_ROOT="attempt_exclude_dropbox_root",n.WEBAPP_GALLERY_SELECT_EVENT="webapp_gallery_select_event",n.WEBAPP_GALLERY_DESELECT_EVENT="webapp_gallery_deselect_event",n.WEBAPP_GALLERY_SELECT_ITEM="webapp_gallery_select_item",n.WEBAPP_GALLERY_DESELECT_ITEM="webapp_gallery_deselect_item",n.WEBAPP_GALLERY_TIME_FIRST_ITEM="webapp_gallery_time_first_item",n.WEBAPP_GALLERY_TIME_EVENTS_OUTLINE="webapp_gallery_time_events_outline",n.WEBAPP_GALLERY_TIME_FIRST_VISIBLE_EVENTS="webapp_gallery_time_first_visible_events",n.WEBAPP_GALLERY_TIME_FIRST_VISIBLE_THUMBS_BATCH="webapp_gallery_time_first_visible_thumbs_batch",n.WEBAPP_GALLERY_EMPTY="webapp_gallery_empty",n.WEBAPP_GALLERY_CONTEXT_MENU_SHOWN="webapp_gallery_context_menu_shown",n.WEBAPP_LIGHTBOX_OPEN="webapp_lightbox_open",n.WEBAPP_LIGHTBOX_DOWNLOAD="webapp_lightbox_download",n.WEBAPP_LIGHTBOX_SELECT_ITEM="webapp_lightbox_select_item",n.WEBAPP_LIGHTBOX_DESELECT_ITEM="webapp_lightbox_deselect_item",n.WEBAPP_LIGHTBOX_FORWARD="webapp_lightbox_forward",n.WEBAPP_LIGHTBOX_BACK="webapp_lightbox_back",n.WEBAPP_LIGHTBOX_SHARE="webapp_lightbox_share",n.WEBAPP_LIGHTBOX_CLOSE_ICON="webapp_lightbox_close_icon",n.WEBAPP_LIGHTBOX_CLOSE_KEY="webapp_lightbox_close_key",n.WEBAPP_TIMELINE_NAVIGATION_SHOWN="webapp_timeline_navigation_shown",n.WEBAPP_TIMELINE_NAVIGATION_TRACK_CLICKED="webapp_timeline_navigation_track_clicked",n.WEBAPP_TIMELINE_NAVIGATION_SCRUBBER_DRAGGED="webapp_timeline_navigation_scrubber_dragged",n.WEBAPP_SHARE_CART_CANCEL="webapp_share_cart_cancel",n.WEBAPP_SHARE_CART_SHARE="webapp_share_cart_share",n.WEBAPP_SHARE_CART_SHARE_FACEBOOK="webapp_share_cart_share_facebook",n.WEBAPP_SHARE_CART_SHARE_TWITTER="webapp_share_cart_share_twitter",n.WEBAPP_SHARE_CART_ITEM_CLICKED="webapp_share_cart_item_clicked",n.WEBAPP_SHARE_DROPDOWN_SEND_LINK="webapp_share_dropdown_send_link",n.WEBAPP_SHARE_DROPDOWN_SHARED_ALBUM="webapp_share_dropdown_shared_album",n.WEBAPP_OPEN_SHARE_MODAL="webapp_open_share_modal",n.WEBAPP_GALLERY_DELETE_MODAL_CONFIRMED="webapp_gallery_delete_modal_confirmed",n.WEBAPP_GALLERY_DELETE_MODAL_CANCELED="webapp_gallery_delete_modal_canceled",n.WEBAPP_GALLERY_REMOVE_FROM_ALBUM_MODAL_CONFIRMED="webapp_gallery_remove_from_album_modal_confirmed",n.WEBAPP_GALLERY_REMOVE_FROM_ALBUM_MODAL_CANCELED="webapp_gallery_remove_from_album_modal_canceled",n.WEBAPP_SHARE_COMPOSER_LINK="webapp_share_composer_link",n.first_log_sent=!1,n.logs_queued=[],n.HACK_prefix_to_replace=null,n.HACK_prefix_replace_with=null,n.HACK_new_platform=null,n.HACK_extra={},n.hack_all_log_prefixes_and_platform=function(e){var t,a,_,o;return o=e.prefix_to_replace,_=e.prefix_replace_with,a=e.new_platform,t=e.extra,n.HACK_prefix_to_replace=o,n.HACK_prefix_replace_with=_,n.HACK_new_platform=a,n.HACK_extra=t},n.apply_hacky_log_overrides=function(t,a,_){var o,r;return n.HACK_prefix_to_replace?(r=0===t.indexOf(n.HACK_prefix_to_replace)?t.replace(n.HACK_prefix_to_replace,n.HACK_prefix_replace_with):0!==t.indexOf(n.HACK_prefix_replace_with)?n.HACK_prefix_replace_with+t:t,o=e.extend({},_,this.HACK_extra),[r,n.HACK_new_platform,o]):[t,a,_]},n.log_and_send=function(e,a,_){var o;return null==a&&(a={}),null==_&&(_=n.Platform.WEB),o=n.apply_hacky_log_overrides(e,_,a),e=o[0],_=o[1],a=o[2],t.SilentBackgroundRequest({url:"/photos/photos_engagement_log",data:{event:e,extra:JSON.stringify(a),platform:_}})},n.log=function(e,t,a){var _,o;return this._init(),n.first_log_sent?(null==t&&(t={}),null==a&&(a=n.Platform.WEB),o=n.apply_hacky_log_overrides(e,a,t),e=o[0],a=o[1],t=o[2],_={event:e,extra:t,platform:a},n.logs_queued.push(_)):(n.log_and_send(e,t,a),void(n.first_log_sent=!0))},n.log_carousel=function(e,t){return n.log(e,t,n.Platform.WEB_CAROUSEL)},n._send_log_batch=function(){if(n.logs_queued.length)return t.SilentBackgroundRequest({url:"/photos/photos_engagement_batch_log",data:{events:JSON.stringify(n.logs_queued)}}),n.logs_queued=[]},n._init=function(){if(!this._initialized)return this._initialized=!0,setInterval(n._send_log_batch,1e4),e(window).unload(n._send_log_batch)},n})()})}.call(this),function(){define("modules/clean/teams/limited_team_invite_modal",["external/underscore","external/react","modules/core/html","modules/core/uri","modules/core/i18n","modules/core/notify","modules/clean/ajax","modules/clean/contacts/contact","modules/clean/react/modal","modules/clean/teams/limited_team_invite_form","modules/clean/viewer","modules/clean/analytics"],function(e,t,n,a,_,o,r,i,s,l,c,u){var m,d,p,f,h,E,g,b;return h=_._,g=_.ungettext,m=i.Contact,p=s.Modal,d=l.LimitedTeamInviteForm,f=u.TeamsWebActionsLogger,t.DOM,E=t.PropTypes,b=c.get_viewer(),t.createClass({displayName:"LimitedTeamInviteModal",propTypes:{onInvited:E.func,onDismiss:E.func,populatedCustomMessage:E.string,populatedContacts:E.arrayOf(E.instanceOf(m)),memberInviteLimit:E.number,maxTeamSize:E.number},getInitialState:function(){return{canProceed:!1,submitting:!1}},_canProceed:function(){var e,t;return(null!=(e=this.refs.members)?e.areAllContactsValid():void 0)&&!(null!=(t=this.refs.members)?t.isEmpty():void 0)},onClickInvite:function(t){return t.preventDefault(),this.refs.members.getFinalData((function(t){return function(_){var i,s,l;if(l=_.emails,s=_.custom_message,i=t._canProceed(),t.setState({canProceed:i}),i)return t.setState({submitting:!0}),r.WebRequest({url:"/account/team/add_users",subject_user:b.work_user,data:{emails:l,custom_message:s,team_id:b.team_id},complete:function(){if(t.isMounted())return t.setState({submitting:!1})},success:function(_){var r,i,s,l,c,u;return _=JSON.parse(_),i=e.values(_.users),i.length>0?(null!=t.props.memberInviteLimit?(s=t.props.memberInviteLimit-i.length,s>0&&(c={tk:t.props.memberInviteLimit,_camp:"flash"},u=a({path:"/team/upgrade",query:c}),l=g('Members invited. You can invite %(num_rem)s more member before you need to upgrade to Dropbox Business. <a href="%(upsell_url)s">Upgrade now.</a>','Members invited. You can invite %(num_rem)s more members before you need to upgrade to Dropbox Business. <a href="%(upsell_url)s">Upgrade now.</a>',s).format({num_rem:s,upsell_url:u.toString()}),o.success(new n(l)))):o.success(g("Member invited.","Members invited.",i.length)),"function"==typeof(r=t.props).onInvited&&r.onInvited(),t.refs.modal.close()):o.error(h("There was a problem completing this request."))},error:function(e){return"rate-limit"===e.getResponseHeader("x-dropbox-app-error")?o.error(new n(h('%(team_name)s has reached the maximum number of team members allowed on Dropbox Basic. Please <a href="/business/contact">contact sales</a> to add more members to your team.').format({team_name:b.team_name}))):o.error(h("There was a problem completing this request."))}})}})(this))},onDismissModal:function(){var e;return f.log("canceled_invite_team_members"),"function"==typeof(e=this.props).onDismiss?e.onDismiss():void 0},onMembersFormChange:function(){return this.setState({canProceed:this._canProceed()})},_getAcceptButtonText:function(){var e;return g("Send invite","Send invites",(null!=(e=this.refs.members)?e.getContacts().length:void 0)||0)},render:function(){return t.createElement(p,{title:h("Invite members to your team"),acceptButtonText:this._getAcceptButtonText(),dismissButtonText:h("Cancel"),onAccept:this.onClickInvite,onDismiss:this.onDismissModal,acceptButtonDisabled:!this.state.canProceed,submitting:this.state.submitting,className:"limited-team-invite-modal",ref:"modal"},t.createElement(d,{ref:"members",user:b.work_user,onChange:this.onMembersFormChange,errorMessageSpaceFixed:!0,populatedCustomMessage:this.props.populatedCustomMessage,populatedContacts:this.props.populatedContacts,autofocusTokenizer:!0,memberInviteLimit:this.props.memberInviteLimit,maxTeamSize:this.props.maxTeamSize}))}})})}.call(this),function(){define("modules/clean/teams/prop_types",["external/react"],function(e){var t;return t=e.PropTypes,{joinableTeam:t.shape({team_id:t.number,team_name:t.string,num_members:t.number,is_invite:t.bool,is_limited:t.bool,join_request_state:t.number,signup_key:t.string,inviting_user_name:t.string,approver_display_name:t.string,members_to_display:t.arrayOf(t.shape({display_name:t.string.isRequired,avatar_url:t.string}))}),suggestedMember:t.shape({id:t.number,email:t.string,display_name:t.string,avatar_url:t.string}),valueLink:function(e){return null==e&&(e=t.any),t.shape({value:e,requestChange:t.func.isRequired})}}})}.call(this),function(){define("modules/clean/teams/suggest_invites_modal",["external/underscore","external/react","modules/core/i18n","modules/core/notify","modules/clean/ajax","modules/clean/react/modal","modules/clean/teams/limited_team_invite_form","modules/clean/viewer"],function(e,t,n,a,_,o,r,i){var s,l,c,u,m;return l=n._,s=o.Modal,c=t.createElement,u=t.DOM,m=i.get_viewer(),t.createClass({displayName:"SuggestInvitesModal",getInitialState:function(){return{canProceed:!1,submitting:!1}},_canProceed:function(){var e,t;return(null!=(e=this.refs.members)?e.areAllContactsValid():void 0)&&!(null!=(t=this.refs.members)?t.isEmpty():void 0)},onClickInvite:function(e){return e.preventDefault(),this.refs.members.getFinalData((function(e){return function(t){var n,o;if(o=t.emails,n=e._canProceed(),e.setState({canProceed:n}),n)return e.setState({submitting:!0}),_.WebRequest({url:"/team/manage/suggest-members",data:{emails:o},complete:function(){return e.setState({submitting:!1})},success:function(){return a.success(l("Thanks for your suggestions! We’ve sent them to the team admin.")),e.refs.modal.close()}})}})(this))},onMembersFormChange:function(){return this.setState({canProceed:this._canProceed()})},render:function(){return c(s,{className:"no-scroll-modal",title:l("Suggest %(team_name)s team members").format({team_name:m.team_name}),acceptButtonText:l("Send suggestions"),dismissButtonText:l("Cancel"),onAccept:this.onClickInvite,acceptButtonDisabled:!this.state.canProceed,submitting:this.state.submitting,ref:"modal"},u.div({className:"suggest_invite_modal_notice"},l("We’ll email your suggestions to your team admin, so they can send out invitations.")),c(r,{ref:"members",user:m.work_user,onChange:this.onMembersFormChange,errorMessageSpaceFixed:!1,includeCustomMessage:!1,emailPlaceholder:l("Email addresses"),autofocusTokenizer:!0}))}})})}.call(this),function(){define("modules/clean/unity_browse_interface",["jquery","modules/clean/unity/check_file_cache","modules/clean/unity/features"],function(e,t,n){if(null!=t&&null!=n)return(function(){function e(){}return e.BATCH_SIZE_LIMIT=100,e.CHECK_FILES_PADDING=50,e.check_file_callback=function(e){return t.set_batch(e)},e.browse_visible_change_callback=function(t,a,_,o){var r,i,s,l,c,u;if(t.length&&(l=Math.max(0,_-e.CHECK_FILES_PADDING),u=Math.min(t.length-1,o+e.CHECK_FILES_PADDING),i=t.slice(l,+u+1||9e9),s=e._get_files_to_check(i),s.length)){for(e._remove_unneeded_items_from_cache(i),c=[];s.length;)r=s.splice(0,e.BATCH_SIZE_LIMIT),c.push(n.check_file_batch(r,a,e.check_file_callback));return c}},e._get_files_to_check=function(e){var n;return(function(){var a,_,o;for(o=[],a=0,_=e.length;a<_;a++)n=e[a],n.bytes>=0&&t.is_cached_and_locally_available(n.ns_id,n.ns_path)!==!0&&o.push(n);return o})()},e._remove_unneeded_items_from_cache=function(e){var a,_,o,r,i;for(_={},r=0,i=e.length;r<i;r++)o=e[r],t.is_cached_and_locally_available(o.ns_id,o.ns_path)===!0&&(a=t.get(o.ns_id,o.ns_path),_[n.server_path(o.ns_id,o.ns_path)]=a);return t.clear(),t.set_batch(_)},e})()})}.call(this),function(){define("modules/dirty/sharing/sharing_model_modals",["jquery","require","modules/clean/analytics"],function(e,t,n){return{initialize_module:function(a){return n.LegacySharingVortexLogger.log("initialize-sharing-model-modals"),t(["dropbox"],function(t){var n,_;return _=t.SharingModel,n=t.Modal,a.instances.forEach(function(t){return e("#"+t.accept_button_dom_id).on("click",function(e){return _.do_remove(n.vars)}),e("#"+t.cancel_button_dom_id).on("click",function(e){return n.hide()})})})}}})}.call(this);
//# sourceMappingURL=pkg-legacy-ag.min.js-vflO0lBdY.map