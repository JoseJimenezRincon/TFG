define(["external/mcl/classnames","external/react","external/mcl/icon_action"],function(e,t,r){return(function(e){function t(n){if(r[n])return r[n].exports;var a=r[n]={exports:{},id:n,loaded:!1};return e[n].call(a.exports,a,a.exports,t),a.loaded=!0,a.exports}var r={};return t.m=e,t.c=r,t.p="",t(0)})({0:function(e,t,r){"use strict";Object.defineProperty(t,"__esModule",{value:!0}),r(8);var n=r(189);t.TertiaryLink=n.Link;var a=r(190);t.TertiaryList=a.List},3:function(t,r){t.exports=e},4:function(e,r){e.exports=t},8:function(e,t){},107:function(e,t){e.exports=r},189:function(e,t,r){"use strict";var n=this&&this.__assign||Object.assign||function(e){for(var t,r=1,n=arguments.length;r<n;r++){t=arguments[r];for(var a in t)Object.prototype.hasOwnProperty.call(t,a)&&(e[a]=t[a])}return e},a=this&&this.__rest||function(e,t){var r={};for(var n in e)Object.prototype.hasOwnProperty.call(e,n)&&t.indexOf(n)<0&&(r[n]=e[n]);if(null!=e&&"function"==typeof Object.getOwnPropertySymbols)for(var a=0,n=Object.getOwnPropertySymbols(e);a<n.length;a++)t.indexOf(n[a])<0&&(r[n[a]]=e[n[a]]);return r};Object.defineProperty(t,"__esModule",{value:!0});var i=r(3),c=r(4),o=r(107);t.Link=function(e){var t=e.children,r=e.className,s=e.href,l=e.icon,u=a(e,["children","className","href","icon"]),f=i("mc-tertiary-link-button",r);return c.createElement("button",n({href:s,className:f},u),c.createElement("span",{className:"mc-tertiary-link-button-content"},l&&c.createElement("span",{className:"mc-tertiary-icon-wrapper"},c.createElement(o.IconAction,{name:l})),c.createElement("span",{className:"mc-tertiary-icon-text"},t)))},t.Link.displayName="TertiaryLink"},190:function(e,t,r){"use strict";var n=this&&this.__assign||Object.assign||function(e){for(var t,r=1,n=arguments.length;r<n;r++){t=arguments[r];for(var a in t)Object.prototype.hasOwnProperty.call(t,a)&&(e[a]=t[a])}return e},a=this&&this.__rest||function(e,t){var r={};for(var n in e)Object.prototype.hasOwnProperty.call(e,n)&&t.indexOf(n)<0&&(r[n]=e[n]);if(null!=e&&"function"==typeof Object.getOwnPropertySymbols)for(var a=0,n=Object.getOwnPropertySymbols(e);a<n.length;a++)t.indexOf(n[a])<0&&(r[n[a]]=e[n[a]]);return r};Object.defineProperty(t,"__esModule",{value:!0});var i=r(3),c=r(4);t.List=function(e){var t=e.children,r=e.className,o=a(e,["children","className"]),s=i("mc-tertiary-list",r);return c.createElement("ul",n({className:s},o),t&&c.Children.map(t,function(e){return c.createElement("li",{className:"mc-tertiary-list-element",key:e.key||void 0},c.cloneElement(e))}))},t.List.displayName="TertiaryList"}})});
//# sourceMappingURL=tertiary_link.min.js-vfl3Lnaj1.map