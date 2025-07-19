// detect-libc@2.0.4 downloaded from https://ga.jspm.io/npm:detect-libc@2.0.4/lib/detect-libc.js

import*as n from"child_process";import t from"process";import*as e from"fs";var r={};var c=t;const s=()=>c.platform==="linux";let i=null;const o=()=>{if(!i)if(s()&&c.report){const n=c.report.excludeNetwork;c.report.excludeNetwork=true;i=c.report.getReport();c.report.excludeNetwork=n}else i={};return i};r={isLinux:s,getReport:o};var l=r;var a=e;try{"default"in e&&(a=e.default)}catch(n){}var u={};const d=a;const f="/usr/bin/ldd";
/**
 * Read the content of a file synchronous
 *
 * @param {string} path
 * @returns {string}
 */const y=n=>d.readFileSync(n,"utf-8")
/**
 * Read the content of a file
 *
 * @param {string} path
 * @returns {Promise<string>}
 */;const m=n=>new Promise(((t,e)=>{d.readFile(n,"utf-8",((n,r)=>{n?e(n):t(r)}))}));u={LDD_PATH:f,readFileSync:y,readFile:m};var v=u;var L=n;try{"default"in n&&(L=n.default)}catch(n){}var p={};const h=L;const{isLinux:S,getReport:b}=l;const{LDD_PATH:x,readFile:w,readFileSync:N}=v;let G;let g;const R="getconf GNU_LIBC_VERSION 2>&1 || true; ldd --version 2>&1 || true";let C="";const F=()=>C||new Promise((n=>{h.exec(R,((t,e)=>{C=t?" ":e;n(C)}))}));const I=()=>{if(!C)try{C=h.execSync(R,{encoding:"utf8"})}catch(n){C=" "}return C};
/**
 * A String constant containing the value `glibc`.
 * @type {string}
 * @public
 */const B="glibc";
/**
 * A Regexp constant to get the GLIBC Version.
 * @type {string}
 */const U=/LIBC[a-z0-9 \-).]*?(\d+\.\d+)/i;
/**
 * A String constant containing the value `musl`.
 * @type {string}
 * @public
 */const _="musl";const A=n=>n.includes("libc.musl-")||n.includes("ld-musl-");const D=()=>{const n=b();return n.header&&n.header.glibcVersionRuntime?B:Array.isArray(n.sharedObjects)&&n.sharedObjects.some(A)?_:null};const P=n=>{const[t,e]=n.split(/[\r\n]+/);return t&&t.includes(B)?B:e&&e.includes(_)?_:null};const V=n=>n.includes("musl")?_:n.includes("GNU C Library")?B:null;const k=async()=>{if(G!==void 0)return G;G=null;try{const n=await w(x);G=V(n)}catch(n){}return G};const M=()=>{if(G!==void 0)return G;G=null;try{const n=N(x);G=V(n)}catch(n){}return G};
/**
 * Resolves with the libc family when it can be determined, `null` otherwise.
 * @returns {Promise<?string>}
 */const O=async()=>{let n=null;if(S()){n=await k();n||(n=D());if(!n){const t=await F();n=P(t)}}return n};
/**
 * Returns the libc family when it can be determined, `null` otherwise.
 * @returns {?string}
 */const j=()=>{let n=null;if(S()){n=M();n||(n=D());if(!n){const t=I();n=P(t)}}return n};
/**
 * Resolves `true` only when the platform is Linux and the libc family is not `glibc`.
 * @returns {Promise<boolean>}
 */const H=async()=>S()&&await O()!==B
/**
 * Returns `true` only when the platform is Linux and the libc family is not `glibc`.
 * @returns {boolean}
 */;const T=()=>S()&&j()!==B;const z=async()=>{if(g!==void 0)return g;g=null;try{const n=await w(x);const t=n.match(U);t&&(g=t[1])}catch(n){}return g};const E=()=>{if(g!==void 0)return g;g=null;try{const n=N(x);const t=n.match(U);t&&(g=t[1])}catch(n){}return g};const q=()=>{const n=b();return n.header&&n.header.glibcVersionRuntime?n.header.glibcVersionRuntime:null};const J=n=>n.trim().split(/\s+/)[1];const K=n=>{const[t,e,r]=n.split(/[\r\n]+/);return t&&t.includes(B)?J(t):e&&r&&e.includes(_)?J(r):null};
/**
 * Resolves with the libc version when it can be determined, `null` otherwise.
 * @returns {Promise<?string>}
 */const Q=async()=>{let n=null;if(S()){n=await z();n||(n=q());if(!n){const t=await F();n=K(t)}}return n};
/**
 * Returns the libc version when it can be determined, `null` otherwise.
 * @returns {?string}
 */const W=()=>{let n=null;if(S()){n=E();n||(n=q());if(!n){const t=I();n=K(t)}}return n};p={GLIBC:B,MUSL:_,family:O,familySync:j,isNonGlibcLinux:H,isNonGlibcLinuxSync:T,version:Q,versionSync:W};var X=p;const Y=p.GLIBC,Z=p.MUSL,$=p.family,nn=p.familySync,tn=p.isNonGlibcLinux,en=p.isNonGlibcLinuxSync,rn=p.version,cn=p.versionSync;export{Y as GLIBC,Z as MUSL,X as default,$ as family,nn as familySync,tn as isNonGlibcLinux,en as isNonGlibcLinuxSync,rn as version,cn as versionSync};

