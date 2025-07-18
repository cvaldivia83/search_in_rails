// enhanced-resolve@5.18.1 downloaded from https://ga.jspm.io/npm:enhanced-resolve@5.18.1/lib/index.js

import*as e from"graceful-fs";import t from"./CachedInputFileSystem.js";import r from"./ResolverFactory.js";import o from"./getPaths.js";import s from"./forEachBail.js";import"process";import"buffer";import"../_/BQK3avjs.js";import"tapable";import"./createInnerContext.js";import"./util/path.js";import"path";import"./SyncAsyncFileSystemDecorator.js";import"./DescriptionFileUtils.js";import"./getInnerRequest.js";import"./AliasPlugin.js";import"./AppendPlugin.js";import"./JoinRequestPlugin.js";import"./ModulesInHierarchicalDirectoriesPlugin.js";import"./ModulesInRootPlugin.js";import"./TryNextPlugin.js";import"./UnsafeCachePlugin.js";import"module";var n={};const i=o.basename;
/** @typedef {import("./Resolver")} Resolver */
/** @typedef {import("./Resolver").ResolveRequest} ResolveRequest */
/** @typedef {import("./Resolver").ResolveStepHook} ResolveStepHook */n=class CloneBasenamePlugin{
/**
   * @param {string | ResolveStepHook} source source
   * @param {string | ResolveStepHook} target target
   */
constructor(e,t){this.source=e;this.target=t}
/**
   * @param {Resolver} resolver the resolver
   * @returns {void}
   */apply(e){const t=e.ensureHook(this.target);e.getHook(this.source).tapAsync("CloneBasenamePlugin",((r,o,s)=>{const n=/** @type {string} */r.path;const a=/** @type {string} */i(n);const c=e.join(n,a);
/** @type {ResolveRequest} */const l={...r,path:c,relativePath:r.relativePath&&e.join(r.relativePath,a)};e.doResolve(t,l,"using path: "+c,o,s)}))}};var a=n;var c={};
/** @typedef {import("./Resolver")} Resolver */
/** @typedef {import("./Resolver").ResolveStepHook} ResolveStepHook */c=class LogInfoPlugin{
/**
   * @param {string | ResolveStepHook} source source
   */
constructor(e){this.source=e}
/**
   * @param {Resolver} resolver the resolver
   * @returns {void}
   */apply(e){const t=this.source;e.getHook(this.source).tapAsync("LogInfoPlugin",((e,r,o)=>{if(!r.log)return o();const s=r.log;const n="["+t+"] ";e.path&&s(n+"Resolving in directory: "+e.path);e.request&&s(n+"Resolving request: "+e.request);e.module&&s(n+"Request is an module request.");e.directory&&s(n+"Request is a directory request.");e.query&&s(n+"Resolving request query: "+e.query);e.fragment&&s(n+"Resolving request fragment: "+e.fragment);e.descriptionFilePath&&s(n+"Has description data from "+e.descriptionFilePath);e.relativePath&&s(n+"Relative path from description file is: "+e.relativePath);o()}))}};var l=c;var u=e;try{"default"in e&&(u=e.default)}catch(e){}var p={};const m=u;const f=t;const g=r;
/** @typedef {import("./PnpPlugin").PnpApiImpl} PnpApi */
/** @typedef {import("./Resolver")} Resolver */
/** @typedef {import("./Resolver").FileSystem} FileSystem */
/** @typedef {import("./Resolver").ResolveCallback} ResolveCallback */
/** @typedef {import("./Resolver").ResolveContext} ResolveContext */
/** @typedef {import("./Resolver").ResolveRequest} ResolveRequest */
/** @typedef {import("./ResolverFactory").Plugin} Plugin */
/** @typedef {import("./ResolverFactory").UserResolveOptions} ResolveOptions */
/** @typedef {{
 * (context: object, path: string, request: string, resolveContext: ResolveContext, callback: ResolveCallback): void;
 * (context: object, path: string, request: string, callback: ResolveCallback): void;
 * (path: string, request: string, resolveContext: ResolveContext, callback: ResolveCallback): void;
 * (path: string, request: string, callback: ResolveCallback): void;
 * }} ResolveFunctionAsync
 */
/** @typedef {{
 * (context: object, path: string, request: string): string|false;
 * (path: string, request: string): string|false;
 * }} ResolveFunction
 */const y=new f(m,4e3);const h={environments:["node+es3+es5+process+native"]};const v=g.createResolver({conditionNames:["node"],extensions:[".js",".json",".node"],fileSystem:y});
/**
 * @type {ResolveFunctionAsync}
 */const resolve=
/**
 * @param {object|string} context
 * @param {string} path
 * @param {string|ResolveContext|ResolveCallback} request
 * @param {ResolveContext|ResolveCallback=} resolveContext
 * @param {ResolveCallback=} callback
 */
(e,t,r,o,s)=>{if(typeof e==="string"){s=/** @type {ResolveCallback} */o;o=/** @type {ResolveContext} */r;r=t;t=e;e=h}typeof s!=="function"&&(s=/** @type {ResolveCallback} */o);v.resolve(e,t,/** @type {string} */r,/** @type {ResolveContext} */o,/** @type {ResolveCallback} */s)};const d=g.createResolver({conditionNames:["node"],extensions:[".js",".json",".node"],useSyncFileSystemCalls:true,fileSystem:y});
/**
 * @type {ResolveFunction}
 */const resolveSync=
/**
 * @param {object|string} context
 * @param {string} path
 * @param {string=} request
 */
(e,t,r)=>{if(typeof e==="string"){r=t;t=e;e=h}return d.resolveSync(e,t,/** @type {string} */r)};
/** @typedef {Omit<ResolveOptions, "fileSystem"> & Partial<Pick<ResolveOptions, "fileSystem">>} ResolveOptionsOptionalFS */
/**
 * @param {ResolveOptionsOptionalFS} options Resolver options
 * @returns {ResolveFunctionAsync} Resolver function
 */function create(e){const t=g.createResolver({fileSystem:y,...e});
/**
   * @param {object|string} context Custom context
   * @param {string} path Base path
   * @param {string|ResolveContext|ResolveCallback} request String to resolve
   * @param {ResolveContext|ResolveCallback=} resolveContext Resolve context
   * @param {ResolveCallback=} callback Result callback
   */return function(e,r,o,s,n){if(typeof e==="string"){n=/** @type {ResolveCallback} */s;s=/** @type {ResolveContext} */o;o=r;r=e;e=h}typeof n!=="function"&&(n=/** @type {ResolveCallback} */s);t.resolve(e,r,/** @type {string} */o,/** @type {ResolveContext} */s,n)}}
/**
 * @param {ResolveOptionsOptionalFS} options Resolver options
 * @returns {ResolveFunction} Resolver function
 */function createSync(e){const t=g.createResolver({useSyncFileSystemCalls:true,fileSystem:y,...e});
/**
   * @param {object|string} context custom context
   * @param {string} path base path
   * @param {string=} request request to resolve
   * @returns {string|false} Resolved path or false
   */return function(e,r,o){if(typeof e==="string"){o=r;r=e;e=h}return t.resolveSync(e,r,/** @type {string} */o)}}
/**
 * @template A
 * @template B
 * @param {A} obj input a
 * @param {B} exports input b
 * @returns {A & B} merged
 */const mergeExports=(e,t)=>{const r=Object.getOwnPropertyDescriptors(t);Object.defineProperties(e,r);/** @type {A & B} */
return Object.freeze(e)};p=mergeExports(resolve,{get sync(){return resolveSync},create:mergeExports(create,{get sync(){return createSync}}),ResolverFactory:g,CachedInputFileSystem:f,get CloneBasenamePlugin(){return a},get LogInfoPlugin(){return l},get forEachBail(){return s}});var j=p;export{j as default};

