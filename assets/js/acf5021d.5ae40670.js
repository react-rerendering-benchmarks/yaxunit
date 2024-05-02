"use strict";(self.webpackChunkdocumentation=self.webpackChunkdocumentation||[]).push([[7861],{9389:(e,t,n)=>{n.r(t),n.d(t,{assets:()=>A,contentTitle:()=>V,default:()=>_,frontMatter:()=>I,metadata:()=>k,toc:()=>N});var r=n(4848),l=n(8453),a=n(6540),s=n(4164),i=n(3104),o=n(6347),u=n(205),c=n(7485),d=n(1682),h=n(9466);function p(e){return a.Children.toArray(e).filter((e=>"\n"!==e)).map((e=>{if(!e||(0,a.isValidElement)(e)&&function(e){const{props:t}=e;return!!t&&"object"==typeof t&&"value"in t}(e))return e;throw new Error(`Docusaurus error: Bad <Tabs> child <${"string"==typeof e.type?e.type:e.type.name}>: all children of the <Tabs> component should be <TabItem>, and every <TabItem> should have a unique "value" prop.`)}))?.filter(Boolean)??[]}function b(e){const{values:t,children:n}=e;return(0,a.useMemo)((()=>{const e=t??function(e){return p(e).map((e=>{let{props:{value:t,label:n,attributes:r,default:l}}=e;return{value:t,label:n,attributes:r,default:l}}))}(n);return function(e){const t=(0,d.X)(e,((e,t)=>e.value===t.value));if(t.length>0)throw new Error(`Docusaurus error: Duplicate values "${t.map((e=>e.value)).join(", ")}" found in <Tabs>. Every value needs to be unique.`)}(e),e}),[t,n])}function m(e){let{value:t,tabValues:n}=e;return n.some((e=>e.value===t))}function f(e){let{queryString:t=!1,groupId:n}=e;const r=(0,o.W6)(),l=function(e){let{queryString:t=!1,groupId:n}=e;if("string"==typeof t)return t;if(!1===t)return null;if(!0===t&&!n)throw new Error('Docusaurus error: The <Tabs> component groupId prop is required if queryString=true, because this value is used as the search param name. You can also provide an explicit value such as queryString="my-search-param".');return n??null}({queryString:t,groupId:n});return[(0,c.aZ)(l),(0,a.useCallback)((e=>{if(!l)return;const t=new URLSearchParams(r.location.search);t.set(l,e),r.replace({...r.location,search:t.toString()})}),[l,r])]}function g(e){const{defaultValue:t,queryString:n=!1,groupId:r}=e,l=b(e),[s,i]=(0,a.useState)((()=>function(e){let{defaultValue:t,tabValues:n}=e;if(0===n.length)throw new Error("Docusaurus error: the <Tabs> component requires at least one <TabItem> children component");if(t){if(!m({value:t,tabValues:n}))throw new Error(`Docusaurus error: The <Tabs> has a defaultValue "${t}" but none of its children has the corresponding value. Available values are: ${n.map((e=>e.value)).join(", ")}. If you intend to show no default tab, use defaultValue={null} instead.`);return t}const r=n.find((e=>e.default))??n[0];if(!r)throw new Error("Unexpected error: 0 tabValues");return r.value}({defaultValue:t,tabValues:l}))),[o,c]=f({queryString:n,groupId:r}),[d,p]=function(e){let{groupId:t}=e;const n=function(e){return e?`docusaurus.tab.${e}`:null}(t),[r,l]=(0,h.Dv)(n);return[r,(0,a.useCallback)((e=>{n&&l.set(e)}),[n,l])]}({groupId:r}),g=(()=>{const e=o??d;return m({value:e,tabValues:l})?e:null})();(0,u.A)((()=>{g&&i(g)}),[g]);return{selectedValue:s,selectValue:(0,a.useCallback)((e=>{if(!m({value:e,tabValues:l}))throw new Error(`Can't select invalid tab value=${e}`);i(e),c(e),p(e)}),[c,p,l]),tabValues:l}}var x=n(2303);const v={tabList:"tabList__CuJ",tabItem:"tabItem_LNqP"};function j(e){let{className:t,block:n,selectedValue:l,selectValue:a,tabValues:o}=e;const u=[],{blockElementScrollPositionUntilNextRender:c}=(0,i.a_)(),d=e=>{const t=e.currentTarget,n=u.indexOf(t),r=o[n].value;r!==l&&(c(t),a(r))},h=e=>{let t=null;switch(e.key){case"Enter":d(e);break;case"ArrowRight":{const n=u.indexOf(e.currentTarget)+1;t=u[n]??u[0];break}case"ArrowLeft":{const n=u.indexOf(e.currentTarget)-1;t=u[n]??u[u.length-1];break}}t?.focus()};return(0,r.jsx)("ul",{role:"tablist","aria-orientation":"horizontal",className:(0,s.A)("tabs",{"tabs--block":n},t),children:o.map((e=>{let{value:t,label:n,attributes:a}=e;return(0,r.jsx)("li",{role:"tab",tabIndex:l===t?0:-1,"aria-selected":l===t,ref:e=>u.push(e),onKeyDown:h,onClick:d,...a,className:(0,s.A)("tabs__item",v.tabItem,a?.className,{"tabs__item--active":l===t}),children:n??t},t)}))})}function y(e){let{lazy:t,children:n,selectedValue:l}=e;const s=(Array.isArray(n)?n:[n]).filter(Boolean);if(t){const e=s.find((e=>e.props.value===l));return e?(0,a.cloneElement)(e,{className:"margin-top--md"}):null}return(0,r.jsx)("div",{className:"margin-top--md",children:s.map(((e,t)=>(0,a.cloneElement)(e,{key:t,hidden:e.props.value!==l})))})}function D(e){const t=g(e);return(0,r.jsxs)("div",{className:(0,s.A)("tabs-container",v.tabList),children:[(0,r.jsx)(j,{...e,...t}),(0,r.jsx)(y,{...e,...t})]})}function E(e){const t=(0,x.A)();return(0,r.jsx)(D,{...e,children:p(e.children)},String(t))}const T={tabItem:"tabItem_Ymn6"};function w(e){let{children:t,hidden:n,className:l}=e;return(0,r.jsx)("div",{role:"tabpanel",className:(0,s.A)(T.tabItem,l),hidden:n,children:t})}const I={sidebar_position:1,sidebar_label:"\u0423\u0441\u0442\u0430\u043d\u043e\u0432\u043a\u0430 \u043f\u043b\u0430\u0433\u0438\u043d\u0430 \u0434\u043b\u044f EDT"},V="\u0423\u0441\u0442\u0430\u043d\u043e\u0432\u043a\u0430 \u043f\u043b\u0430\u0433\u0438\u043d\u0430 \u0434\u043b\u044f \u0440\u0430\u0431\u043e\u0442\u044b \u0441 \u0442\u0435\u0441\u0442\u0430\u043c\u0438",k={id:"getting-started/install/install-plugin",title:"\u0423\u0441\u0442\u0430\u043d\u043e\u0432\u043a\u0430 \u043f\u043b\u0430\u0433\u0438\u043d\u0430 \u0434\u043b\u044f \u0440\u0430\u0431\u043e\u0442\u044b \u0441 \u0442\u0435\u0441\u0442\u0430\u043c\u0438",description:"\u0414\u043b\u044f \u0442\u043e\u0433\u043e, \u0447\u0442\u043e \u0431\u044b \u0432\u0430\u043c \u0438 \u043d\u0430\u043c \u0431\u044b\u043b\u043e \u043f\u0440\u043e\u0449\u0435 \u043f\u0438\u0441\u0430\u0442\u044c \u0442\u0435\u0441\u0442\u044b \u043c\u044b \u0440\u0430\u0437\u0440\u0430\u0431\u043e\u0442\u0430\u043b\u0438 \u043f\u043b\u0430\u0433\u0438\u043d \u0434\u043b\u044f 1\u0421:Enterprise Development Tools (EDT).",source:"@site/docs/getting-started/install/install-plugin.md",sourceDirName:"getting-started/install",slug:"/getting-started/install/install-plugin",permalink:"/yaxunit/docs/getting-started/install/install-plugin",draft:!1,unlisted:!1,editUrl:"https://github.com/bia-technologies/yaxunit/docs/getting-started/install/install-plugin.md",tags:[],version:"current",sidebarPosition:1,frontMatter:{sidebar_position:1,sidebar_label:"\u0423\u0441\u0442\u0430\u043d\u043e\u0432\u043a\u0430 \u043f\u043b\u0430\u0433\u0438\u043d\u0430 \u0434\u043b\u044f EDT"},sidebar:"tutorialSidebar",previous:{title:"\u0423\u0441\u0442\u0430\u043d\u043e\u0432\u043a\u0430",permalink:"/yaxunit/docs/getting-started/install/"},next:{title:"\u041f\u043b\u0430\u0433\u0438\u043d \u0434\u043b\u044f EDT",permalink:"/yaxunit/docs/getting-started/edt-plugin/"}},A={},N=[];function S(e){const t={a:"a",admonition:"admonition",code:"code",h1:"h1",img:"img",li:"li",p:"p",pre:"pre",ul:"ul",...(0,l.R)(),...e.components};return(0,r.jsxs)(r.Fragment,{children:[(0,r.jsx)(t.h1,{id:"\u0443\u0441\u0442\u0430\u043d\u043e\u0432\u043a\u0430-\u043f\u043b\u0430\u0433\u0438\u043d\u0430-\u0434\u043b\u044f-\u0440\u0430\u0431\u043e\u0442\u044b-\u0441-\u0442\u0435\u0441\u0442\u0430\u043c\u0438",children:"\u0423\u0441\u0442\u0430\u043d\u043e\u0432\u043a\u0430 \u043f\u043b\u0430\u0433\u0438\u043d\u0430 \u0434\u043b\u044f \u0440\u0430\u0431\u043e\u0442\u044b \u0441 \u0442\u0435\u0441\u0442\u0430\u043c\u0438"}),"\n","\n","\n",(0,r.jsxs)(t.p,{children:["\u0414\u043b\u044f \u0442\u043e\u0433\u043e, \u0447\u0442\u043e \u0431\u044b \u0432\u0430\u043c \u0438 \u043d\u0430\u043c \u0431\u044b\u043b\u043e \u043f\u0440\u043e\u0449\u0435 \u043f\u0438\u0441\u0430\u0442\u044c \u0442\u0435\u0441\u0442\u044b \u043c\u044b \u0440\u0430\u0437\u0440\u0430\u0431\u043e\u0442\u0430\u043b\u0438 \u043f\u043b\u0430\u0433\u0438\u043d \u0434\u043b\u044f 1\u0421",":Enterprise"," Development Tools (EDT)."]}),"\n",(0,r.jsx)(t.p,{children:"\u0421 \u0435\u0433\u043e \u043f\u043e\u043c\u043e\u0449\u044c\u044e \u0432\u044b \u0441\u043c\u043e\u0436\u0435\u0442\u0435:"}),"\n",(0,r.jsxs)(t.ul,{children:["\n",(0,r.jsx)(t.li,{children:"\u0417\u0430\u043f\u0443\u0441\u043a\u0430\u0442\u044c \u0438 \u043e\u0442\u043b\u0430\u0436\u0438\u0432\u0430\u0442\u044c \u0441\u0432\u043e\u0438 \u0442\u0435\u0441\u0442\u044b;"}),"\n",(0,r.jsx)(t.li,{children:"\u041f\u0440\u043e\u0441\u043c\u0430\u0442\u0440\u0438\u0432\u0430\u0442\u044c \u0440\u0435\u0437\u0443\u043b\u044c\u0442\u0430\u0442\u044b \u0432\u044b\u043f\u043e\u043b\u043d\u0435\u043d\u0438\u044f."}),"\n",(0,r.jsxs)(t.li,{children:["\u0418 ",(0,r.jsx)(t.a,{href:"https://github.com/bia-technologies/edt-test-runner/blob/develop/docs/%D0%A4%D1%83%D0%BD%D0%BA%D1%86%D0%B8%D0%B8.md",children:"\u0447\u0442\u043e-\u0442\u043e \u0435\u0449\u0435"})]}),"\n"]}),"\n",(0,r.jsxs)(t.p,{children:["\u0414\u043b\u044f \u0443\u0441\u0442\u0430\u043d\u043e\u0432\u043a\u0438 \u043f\u043b\u0430\u0433\u0438\u043d\u0430 \u0432\u0430\u043c \u043d\u0435\u043e\u0431\u0445\u043e\u0434\u0438\u043c\u043e \u0432\u043e\u0441\u043f\u043e\u043b\u044c\u0437\u043e\u0432\u0430\u0442\u044c\u0441\u044f \u0441\u0442\u0430\u043d\u0434\u0430\u0440\u0442\u043d\u044b\u043c \u0444\u0443\u043d\u043a\u0446\u0438\u043e\u043d\u0430\u043b\u043e\u043c Eclipse (EDT) ",(0,r.jsx)(t.code,{children:"\u0423\u0441\u0442\u0430\u043d\u043e\u0432\u0438\u0442\u044c \u043d\u043e\u0432\u043e\u0435 \u041f\u041e..."}),"."]}),"\n",(0,r.jsxs)(t.ul,{children:["\n",(0,r.jsx)(t.li,{children:"\u041e\u0442\u043a\u0440\u044b\u0432\u0430\u0435\u043c EDT."}),"\n",(0,r.jsxs)(t.li,{children:["\u041f\u0435\u0440\u0435\u0445\u043e\u0434\u0438\u043c \u043a ",(0,r.jsx)(t.code,{children:"\u0423\u0441\u0442\u0430\u043d\u043e\u0432\u0438\u0442\u044c \u043d\u043e\u0432\u043e\u0435 \u041f\u041e"})," (\u0432 \u043c\u0435\u043d\u044e ",(0,r.jsx)(t.code,{children:"\u0421\u043f\u0440\u0430\u0432\u043a\u0430"}),");"]}),"\n",(0,r.jsx)(t.li,{children:"\u0414\u043e\u0431\u0430\u0432\u043b\u044f\u0435\u043c \u043d\u043e\u0432\u044b\u0439 \u0440\u0435\u043f\u043e\u0437\u0438\u0442\u043e\u0440\u0438\u0439;"}),"\n"]}),"\n",(0,r.jsxs)(E,{children:[(0,r.jsx)(w,{value:"master",label:"\u041e\u0441\u043d\u043e\u0432\u043d\u043e\u0439 \u0440\u0435\u043f\u043e\u0437\u0438\u0442\u043e\u0440\u0438\u0439",children:(0,r.jsx)(t.pre,{children:(0,r.jsx)(t.code,{className:"language-url",children:"https://bia-technologies.github.io/edt-test-runner/repository\n"})})}),(0,r.jsx)(w,{value:"develop",label:"Develop",children:(0,r.jsx)(t.pre,{children:(0,r.jsx)(t.code,{className:"language-url",children:"https://bia-technologies.github.io/edt-test-runner/dev/repository\n"})})}),(0,r.jsx)(w,{value:"old-2023-02",label:"\u0414\u043b\u044f \u0432\u0435\u0440\u0441\u0438\u0439 EDT \u0434\u043e 2023-02",children:(0,r.jsx)(t.pre,{children:(0,r.jsx)(t.code,{className:"language-url",children:"https://bia-technologies.github.io/edt-test-runner/repository/updates/23.x\n"})})})]}),"\n",(0,r.jsx)(t.p,{children:(0,r.jsx)(t.img,{alt:"\u0423\u0441\u0442\u0430\u043d\u043e\u0432\u043a\u0430 \u043f\u043b\u0430\u0433\u0438\u043d\u0430",src:n(8659).A+"",width:"940",height:"512"})}),"\n",(0,r.jsx)(t.admonition,{title:"\u0441\u043e\u0432\u0435\u0442",type:"tip",children:(0,r.jsxs)(t.p,{children:["\u0414\u043b\u044f \u0443\u0441\u043a\u043e\u0440\u0435\u043d\u0438\u044f \u0443\u0441\u0442\u0430\u043d\u043e\u0432\u043a\u0438 \u043c\u043e\u0436\u043d\u043e \u0443\u0431\u0440\u0430\u0442\u044c \u0433\u0430\u043b\u043e\u0447\u043a\u0443 ",(0,r.jsx)(t.code,{children:"\u041e\u0431\u0440\u0430\u0449\u0430\u0442\u044c\u0441\u044f \u0432\u043e \u0432\u0440\u0435\u043c\u044f \u0438\u043d\u0441\u0442\u0430\u043b\u043b\u044f\u0446\u0438\u0438 \u043a\u043e \u0432\u0441\u0435\u043c \u0441\u0430\u0439\u0442\u0430\u043c ..."})]})}),"\n",(0,r.jsxs)(t.ul,{children:["\n",(0,r.jsx)(t.li,{children:"\u041d\u0430\u0436\u0438\u043c\u0430\u0435\u043c \u0434\u0430\u043b\u0435\u0435;"}),"\n",(0,r.jsx)(t.li,{children:"\u041f\u0440\u0438\u043d\u0438\u043c\u0430\u0435\u043c \u043b\u0438\u0446\u0435\u043d\u0437\u0438\u044e;"}),"\n",(0,r.jsx)(t.li,{children:"\u0421\u043e\u0433\u043b\u0430\u0448\u0430\u0435\u043c\u0441\u044f \u0441 \u043f\u0440\u0435\u0434\u0443\u043f\u0440\u0435\u0436\u0434\u0435\u043d\u0438\u0435\u043c \u0431\u0435\u0437\u043e\u043f\u0430\u0441\u043d\u043e\u0441\u0442\u0438;"}),"\n",(0,r.jsxs)(t.li,{children:["\u0418 \u043f\u0435\u0440\u0435\u0437\u0430\u0433\u0440\u0443\u0436\u0430\u0435\u043c IDE.","\n",(0,r.jsx)(t.admonition,{title:"\u043f\u0440\u0438\u043c\u0435\u0447\u0430\u043d\u0438\u0435",type:"note",children:(0,r.jsx)(t.p,{children:"EDT \u0431\u0443\u0434\u0435\u0442 \u0434\u043e\u043b\u0433\u043e \u043f\u0435\u0440\u0435\u0437\u0430\u0433\u0440\u0443\u0436\u0430\u0442\u044c\u0441\u044f \u0438 \u044d\u0442\u043e \u043d\u043e\u0440\u043c\u0430\u043b\u044c\u043d\u043e."})}),"\n"]}),"\n"]})]})}function _(e={}){const{wrapper:t}={...(0,l.R)(),...e.components};return t?(0,r.jsx)(t,{...e,children:(0,r.jsx)(S,{...e})}):S(e)}},8659:(e,t,n)=>{n.d(t,{A:()=>r});const r=n.p+"assets/images/plugin-install-from-rep-a3b9e909d84edff8dc96c44f806241cf.png"},8453:(e,t,n)=>{n.d(t,{R:()=>s,x:()=>i});var r=n(6540);const l={},a=r.createContext(l);function s(e){const t=r.useContext(a);return r.useMemo((function(){return"function"==typeof e?e(t):{...t,...e}}),[t,e])}function i(e){let t;return t=e.disableParentContext?"function"==typeof e.components?e.components(l):e.components||l:s(e.components),r.createElement(a.Provider,{value:t},e.children)}}}]);