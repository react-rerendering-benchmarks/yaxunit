"use strict";(self.webpackChunkdocumentation=self.webpackChunkdocumentation||[]).push([[8209],{6535:(e,t,s)=>{s.d(t,{A:()=>v});var a=s(6540),i=s(4164),r=s(2415),n=s(4581),l=s(8774),c=s(1312),o=s(6347),d=s(9169);function m(e){const{pathname:t}=(0,o.zy)();return(0,a.useMemo)((()=>e.filter((e=>function(e,t){return!(e.unlisted&&!(0,d.ys)(e.permalink,t))}(e,t)))),[e,t])}const u={sidebar:"sidebar_re4s",sidebarItemTitle:"sidebarItemTitle_pO2u",sidebarItemList:"sidebarItemList_Yudw",sidebarItem:"sidebarItem__DBe",sidebarItemLink:"sidebarItemLink_mo7H",sidebarItemLinkActive:"sidebarItemLinkActive_I1ZP"};var b=s(4848);function g(e){let{sidebar:t}=e;const s=m(t.items);return(0,b.jsx)("aside",{className:"col col--3",children:(0,b.jsxs)("nav",{className:(0,i.A)(u.sidebar,"thin-scrollbar"),"aria-label":(0,c.T)({id:"theme.blog.sidebar.navAriaLabel",message:"Blog recent posts navigation",description:"The ARIA label for recent posts in the blog sidebar"}),children:[(0,b.jsx)("div",{className:(0,i.A)(u.sidebarItemTitle,"margin-bottom--md"),children:t.title}),(0,b.jsx)("ul",{className:(0,i.A)(u.sidebarItemList,"clean-list"),children:s.map((e=>(0,b.jsx)("li",{className:u.sidebarItem,children:(0,b.jsx)(l.A,{isNavLink:!0,to:e.permalink,className:u.sidebarItemLink,activeClassName:u.sidebarItemLinkActive,children:e.title})},e.permalink)))})]})})}var h=s(5600);function j(e){let{sidebar:t}=e;const s=m(t.items);return(0,b.jsx)("ul",{className:"menu__list",children:s.map((e=>(0,b.jsx)("li",{className:"menu__list-item",children:(0,b.jsx)(l.A,{isNavLink:!0,to:e.permalink,className:"menu__link",activeClassName:"menu__link--active",children:e.title})},e.permalink)))})}function p(e){return(0,b.jsx)(h.GX,{component:j,props:e})}function x(e){let{sidebar:t}=e;const s=(0,n.l)();return t?.items.length?"mobile"===s?(0,b.jsx)(p,{sidebar:t}):(0,b.jsx)(g,{sidebar:t}):null}function v(e){const{sidebar:t,toc:s,children:a,...n}=e,l=t&&t.items.length>0;return(0,b.jsx)(r.A,{...n,children:(0,b.jsx)("div",{className:"container margin-vert--lg",children:(0,b.jsxs)("div",{className:"row",children:[(0,b.jsx)(x,{sidebar:t}),(0,b.jsx)("main",{className:(0,i.A)("col",{"col--7":l,"col--9 col--offset-1":!l}),children:a}),s&&(0,b.jsx)("div",{className:"col col--2",children:s})]})})})}},9140:(e,t,s)=>{s.r(t),s.d(t,{default:()=>u});s(6540);var a=s(4164),i=s(6820),r=s(1213),n=s(7559),l=s(6535),c=s(2557),o=s(1463),d=s(1107),m=s(4848);function u(e){let{tags:t,sidebar:s}=e;const u=(0,i.b)();return(0,m.jsxs)(r.e3,{className:(0,a.A)(n.G.wrapper.blogPages,n.G.page.blogTagsListPage),children:[(0,m.jsx)(r.be,{title:u}),(0,m.jsx)(o.A,{tag:"blog_tags_list"}),(0,m.jsxs)(l.A,{sidebar:s,children:[(0,m.jsx)(d.A,{as:"h1",children:u}),(0,m.jsx)(c.A,{tags:t})]})]})}},6133:(e,t,s)=>{s.d(t,{A:()=>l});s(6540);var a=s(4164),i=s(8774);const r={tag:"tag_zVej",tagRegular:"tagRegular_sFm0",tagWithCount:"tagWithCount_h2kH"};var n=s(4848);function l(e){let{permalink:t,label:s,count:l}=e;return(0,n.jsxs)(i.A,{href:t,className:(0,a.A)(r.tag,l?r.tagWithCount:r.tagRegular),children:[s,l&&(0,n.jsx)("span",{children:l})]})}},2557:(e,t,s)=>{s.d(t,{A:()=>o});s(6540);var a=s(6820),i=s(6133),r=s(1107);const n={tag:"tag_Nnez"};var l=s(4848);function c(e){let{letterEntry:t}=e;return(0,l.jsxs)("article",{children:[(0,l.jsx)(r.A,{as:"h2",id:t.letter,children:t.letter}),(0,l.jsx)("ul",{className:"padding--none",children:t.tags.map((e=>(0,l.jsx)("li",{className:n.tag,children:(0,l.jsx)(i.A,{...e})},e.permalink)))}),(0,l.jsx)("hr",{})]})}function o(e){let{tags:t}=e;const s=(0,a.Q)(t);return(0,l.jsx)("section",{className:"margin-vert--lg",children:s.map((e=>(0,l.jsx)(c,{letterEntry:e},e.letter)))})}},6820:(e,t,s)=>{s.d(t,{Q:()=>r,b:()=>i});var a=s(1312);const i=()=>(0,a.T)({id:"theme.tags.tagsPageTitle",message:"Tags",description:"The title of the tag list page"});function r(e){const t={};return Object.values(e).forEach((e=>{const s=function(e){return e[0].toUpperCase()}(e.label);t[s]??=[],t[s].push(e)})),Object.entries(t).sort(((e,t)=>{let[s]=e,[a]=t;return s.localeCompare(a)})).map((e=>{let[t,s]=e;return{letter:t,tags:s.sort(((e,t)=>e.label.localeCompare(t.label)))}}))}}}]);