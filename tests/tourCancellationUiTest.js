const fs=require('fs'),vm=require('vm'),assert=require('assert');
const source=fs.readFileSync(require('path').join(__dirname, '../view/client/assets/js/userBook/bookUserShow.js'),'utf8');
const a=source.indexOf('function requestCancelFinalBuy('),b=source.indexOf('\nfunction ',a+10);
const code=source.slice(a,b<0?source.length:b);
function run(ids,credit){
 let posted,invalid=false,disabled=false;
 const form={0:{reset(){}},find(selector){return{val(){},map(){return{get(){return ids}}}}},serializeArray(){return [{name:'FactorNumber',value:'999111'},{name:'comment',value:'test'},...(credit?[{name:'backCredit',value:'on'}]:[{name:'cardNumber',value:'123'},{name:'accountOwner',value:'Owner'},{name:'NameBank',value:'Bank'}])];}};
 const target={children(){return{removeClass(){}}},prop(k,v){disabled=v}};
 const $=selector=>selector===target?target:selector===form?form:selector==='#cancelBuyForm'?form:typeof selector==='string'&&selector.startsWith('form#')?form:{is(){return true;}};
 $.each=(data,fn)=>data.forEach(x=>fn.call(x));$.alert=()=>{invalid=true};
 $.post=(url,data,cb)=>{posted=data;return{always(fn){fn();}}};
 const context={$,document:{getElementById(){return{style:{}}}},amadeusPath:'/',useXmltag:x=>x};
 vm.createContext(context);vm.runInContext(code,context);context.requestCancelFinalBuy('tour','999111',target);
 return{posted,invalid,disabled};
}
assert.deepStrictEqual(run(['1','3'],true).posted['passengerIds[]'],['1','3']);
assert.strictEqual(run(['1'],true).posted.FactorNumber,'999111');
assert.strictEqual(run([],true).posted,undefined);
assert.deepStrictEqual(run(['2'],false).posted['passengerIds[]'],['2']);
// Explicit brackets preserve PHP arrays even with traditional jQuery serialization.
const selected = run(['1'], true).posted;
const wire = new URLSearchParams();
Object.entries(selected).forEach(([key, value]) => {
 if (Array.isArray(value)) value.forEach(id => wire.append(key, id));
 else if (value !== undefined) wire.append(key, value);
});
assert.strictEqual(wire.get('passengerIds[]'), '1');
assert.strictEqual(wire.has('passengerIds'), false);
console.log('PASS: passenger selections reach the server; wallet requires no card; bank details and empty-selection validation.');
