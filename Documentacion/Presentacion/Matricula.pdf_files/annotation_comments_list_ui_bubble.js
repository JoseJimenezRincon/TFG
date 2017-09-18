(function(){define(["jquery","external/classnames","external/react","external/react-dom","modules/clean/activity/activity_user","modules/clean/datetime","modules/clean/keycode","modules/clean/react/file_comments/conversation_or_input_card","modules/clean/comments/components/ui_constants","modules/clean/comments/lib/click_outside","modules/constants/file_viewer"],function(t,e,n,o,i,s,r,a,p,l,u){var c,d,m,y;return i.ActivityUser,r.KeyCode,d=a.ConversationCard,m=p.DEFAULT_ANNOTATION_COMMENT_INPUT_MAX_HEIGHT,c=l.ClickOutside,y=n.DOM,n.createClass({displayName:"AnnotationCommentsListUIBubble",mixins:[n.addons.PureRenderMixin],propTypes:{user:n.PropTypes.object,activity:n.PropTypes.object,x:n.PropTypes.number.isRequired,y:n.PropTypes.number.isRequired,annotation:n.PropTypes.object,commentActivity:n.PropTypes.object,position:n.PropTypes.string,maxHeight:n.PropTypes.number,replyText:n.PropTypes.string,onMouseEnter:n.PropTypes.func,onMouseLeave:n.PropTypes.func,onConversationExpand:n.PropTypes.func,actionCreators:n.PropTypes.object.isRequired,isDemoMode:n.PropTypes.bool},getDefaultProps:function(){return{maxHeight:m,isDemoMode:!1}},getInitialState:function(){return{button_disabled:!0,show_post_button:!1,initial_text:""}},onConversationExpand:function(){var t;return this._scrollToBottom(),"function"==typeof(t=this.props).onConversationExpand?t.onConversationExpand():void 0},onReplyInputBlur:function(){return this.props.actionCreators.updateAnnotationReplyFocused(!1)},onReplyInputFocus:function(){return this.props.actionCreators.updateAnnotationReplyFocused(!0)},_handleOutsideClick:function(t){return this.props.actionCreators.hideAnnotationConversation()},onCancelComment:function(){return this.props.actionCreators.cancelAnnotationComment()},onAddReply:function(t,e){return this.props.actionCreators.addReply({targetActivityKey:e.activity_key,body:{text:t}})},_getReplyCommentInput:function(){var t,e;return null!=(t=this.refs.conversationCard)&&null!=(e=t.refs.threadedCommentActivityUI)?e.refs.commentInput:void 0},_getRawReplyInput:function(){var t;return(null!=(t=this._getReplyCommentInput())?t.getRawCommentInput():void 0)||""},_saveReplyDraft:function(){var t,e,n;return t=this._getRawReplyInput(),n=t.length>0&&t!==(null!=(e=this._getReplyCommentInput())?e.getPlaceholderText():void 0)?t:null,this.props.actionCreators.updateAnnotationReplyText({activityKey:this.props.commentActivity.activity_key,text:n})},_getRevisionDateTime:function(){var t;if(t=this._getRevision(),null!=t.when&&!isNaN(new Date(null!=t.when)))return""+s.ago(new Date(1e3*t.when))},_getRevision:function(){return this.props.commentActivity.comment.comment_metadata.revision},_isOnOldRevision:function(){return!1},_scrollToBottom:function(){var e;return e=o.findDOMNode(this.refs.annotationBubbleField),t(e).animate({scrollTop:e.scrollHeight},{duration:300})},_renderConversation:function(){var t,e;return e={ref:"threadedCommentActivityUI",key:"annotation_bubble_threaded_"+this.props.commentActivity.activity_key,activity:this.props.activity,commentActivity:this.props.commentActivity,user:this.props.user,shouldUseSimpleModals:!1,shouldHidePhotoAvatars:!1,shouldAutoLinkify:!0,shouldShowPostText:u.MAESTRO_ENABLED,onReplyInputFocus:this.onReplyInputFocus,onReplyInputBlur:this.onReplyInputBlur,replyText:this.props.replyText,onCommentExpanded:this.onConversationExpand,isInAnnotationBubble:!0,onCancelComment:this.onCancelComment,onInputChange:this._saveReplyDraft,onAddComment:this.onAddReply},n.createElement(d,{ref:"conversationCard",shouldInitiallyShowNotifyHint:!1,initialUsersToNotify:null!=(t=this.props.commentActivity)?t.users_to_notify:void 0,commentProps:e,actionCreators:this.props.actionCreators,isDemoMode:this.props.isDemoMode})},_renderComments:function(){var t,n;return n={"comments-holder":!0},t={maxHeight:this.props.maxHeight},y.div({className:"annotation-bubble__field",ref:"annotationBubbleField",style:t},this._isOnOldRevision()?y.div({className:"annotation-bubble__field__old-revision"},"On older revision, updated "+this._getRevisionDateTime()):void 0,y.div({className:e(n)},y.div({className:"comment-list"},this._renderConversation())))},render:function(){var t,o,i,s;return s=!0,i=s?25:0,o={"annotation-bubble-container":!0,"annotation-bubble-invisible-border":s},t={left:this.props.x-i},this.props.position.indexOf("bottom")>=0?t.bottom=this.props.y-i:t.top=this.props.y-i,n.createElement(c,{onClickOutside:this._handleOutsideClick},y.div({onMouseOver:this.onMouseOver,onMouseLeave:this.props.onMouseLeave,onMouseEnter:this.props.onMouseEnter,className:e(o),style:t},y.div({className:"annotation-bubble bubble-dropdown "+this.props.position},this._renderComments(),y.div({className:"bubble-arrow-border"}),y.div({className:"bubble-arrow"}))))}})})}).call(this);
//# sourceMappingURL=annotation_comments_list_ui_bubble.min.js-vfl-Ih0Ro.map