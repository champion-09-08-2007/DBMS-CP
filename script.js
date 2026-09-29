const CLUBS = {Robotics:'#d94a1e', Music:'#8b3fc4', Literary:'#a06a00', Sports:'#0b7a6b', Coding:'#2f4fd6', Drama:'#c22458'};
const ME = 'Robotics'; // the club the signed-in coordinator manages

let events = [
  {id:1, title:'Line Follower Bot Workshop', club:'Robotics', date:'2026-10-03', time:'10:00 AM', venue:'Lab 204, Engineering Block', cap:40, going:31, desc:'Build and tune a line-following robot from scratch. Kits provided. Bring a laptop.', att:['Diya Patil','Rohan Shinde','Sana Khan','Kabir Jadhav']},
  {id:2, title:'Open Mic Night', club:'Music', date:'2026-10-05', time:'6:30 PM', venue:'Amphitheatre', cap:120, going:64, desc:'Sing, play or recite. Sign up on the spot, or just come to listen.', att:[]},
  {id:4, title:'Poetry and Chai Evening', club:'Literary', date:'2026-10-08', time:'5:00 PM', venue:'Canteen Lawn', cap:50, going:22, desc:'An informal circle of original poems over chai.', att:[]},
  {id:6, title:'Street Play Auditions', club:'Drama', date:'2026-10-07', time:'3:30 PM', venue:'Seminar Hall 2', cap:30, going:30, desc:'Auditions for the annual fest street play. No experience needed.', att:[]},
  {id:3, title:'24-Hour Hackathon', club:'Coding', date:'2026-10-10', time:'9:00 AM', venue:'Central Library Hall', cap:80, going:78, desc:'Teams of three or four build something students actually need. Food and prizes included.', att:[]},
  {id:5, title:'Inter-Department Football', club:'Sports', date:'2026-10-12', time:'4:00 PM', venue:'Main Ground', cap:200, going:90, desc:'Knockout tournament. Register your department team at the desk.', att:[]},
  {id:7, title:'Drone Flight Basics', club:'Robotics', date:'2026-10-15', time:'11:00 AM', venue:'Sports Complex Court', cap:25, going:9, desc:'Learn safe flying, calibration and basic aerial photography.', att:['Ishaan More','Neha Kulkarni']}
];
let mine = new Set([2]);   
let view = 'discover', cat = 'All', q = '', sort = 'date';
const checked = {};        

const $ = s => document.querySelector(s);
const dlg = $('#dlg');
const esc = s => String(s).replace(/[&<>"']/g, c => ({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'}[c]));

function fmt(d){
  const x = new Date(d + 'T00:00');
  return {d:x.getDate(), m:x.toLocaleString('en',{month:'short'}), w:x.toLocaleString('en',{weekday:'long'})};
}
function toast(t){
  const e = $('#toast');
  e.textContent = t;
  e.classList.add('on');
  setTimeout(() => e.classList.remove('on'), 2400);
}
function status(e){
  const left = e.cap - e.going;
  if (left <= 0) return ['Full','warn'];
  if (left <= 5) return ['Only ' + left + ' seats left','warn'];
  return [left + ' seats left','ok'];
}


function row(e){
  const f = fmt(e.date), [s,k] = status(e);
  return `<button class="row" style="--c:${CLUBS[e.club]}" onclick="openEvent(${e.id})">
    <div class="day">${f.d}<span>${f.m}</span></div>
    <div><h3>${esc(e.title)}</h3>
      <div class="meta">${esc(e.club)} Club, ${f.w} at ${e.time}, ${esc(e.venue)}</div></div>
    <div class="side">
      <span class="tag ${mine.has(e.id) ? 'ok' : k}">${mine.has(e.id) ? 'You are going' : s}</span>
      <div class="bar"><i style="width:${Math.min(100, e.going / e.cap * 100)}%"></i></div>
    </div></button>`;
}

function discover(){
  let list = events.filter(e => (cat === 'All' || e.club === cat) && (e.title + e.club + e.venue).toLowerCase().includes(q.toLowerCase()));
  list.sort((a,b) => sort === 'date' ? a.date.localeCompare(b.date) : (b.cap - b.going) - (a.cap - a.going));
  return `<section class="hero"><h1>${events.length} events across campus this fortnight.</h1>
    <p>Pick one, reserve a seat, show up. Every club posts here.</p></section>
    <div class="tools">
      <input id="q" type="search" placeholder="Search events, clubs or venues" value="${esc(q)}" aria-label="Search events">
      <select id="sort" aria-label="Sort events">
        <option value="date">Soonest first</option>
        <option value="spots" ${sort === 'spots' ? 'selected' : ''}>Most seats left</option>
      </select></div>
    <div class="chips">${['All', ...Object.keys(CLUBS)].map(c => `<button class="chip" aria-pressed="${c === cat}" onclick="cat='${c}';render()">${c}</button>`).join('')}</div>
    ${list.length ? `<div class="list">${list.map(row).join('')}</div>` : `<div class="empty">No events match. Clear the search or choose another club.</div>`}`;
}

function rsvps(){
  const list = events.filter(e => mine.has(e.id)).sort((a,b) => a.date.localeCompare(b.date));
  return `<section class="hero"><h1>${list.length ? `You are going to ${list.length} event${list.length > 1 ? 's' : ''}.` : 'No RSVPs yet.'}</h1>
    <p>Cancel any time from the event page.</p></section>
    ${list.length ? `<div class="list">${list.map(row).join('')}</div>` : `<div class="empty">Open Discover and reserve a seat at something.</div>`}`;
}

function organize(){
  const list = events.filter(e => e.club === ME);
  const total = list.reduce((a,e) => a + e.going, 0);
  const cap = list.reduce((a,e) => a + e.cap, 0);
  return `<section class="hero"><h1>Run your club's events.</h1>
    <p>Publish an event, watch RSVPs come in, check people in at the door.</p></section>
    <div class="stats">
      <div class="stat"><b>${list.length}</b>Events live</div>
      <div class="stat"><b>${total}</b>Seats reserved</div>
      <div class="stat"><b>${cap ? Math.round(total / cap * 100) : 0}%</b>Of seats filled</div>
    </div>
    <div class="two">
      <div class="panel"><h2>Create an event</h2>
        <form id="f">
          <label>Title<input name="title" required maxlength="60"></label>
          <div class="row2"><label>Date<input type="date" name="date" required></label><label>Time<input type="time" name="time" required></label></div>
          <div class="row2"><label>Venue<input name="venue" required></label><label>Capacity<input type="number" name="cap" min="1" value="50" required></label></div>
          <label>Description<textarea name="desc" rows="3" required></textarea></label>
          <button class="btn">Publish event</button>
        </form></div>
      <div class="panel"><h2>Your events</h2>
        ${list.length ? `<div class="mine">${list.map(e => `<div class="mrow" style="--c:${CLUBS[e.club]}">
          <div><b>${esc(e.title)}</b><div class="meta">${fmt(e.date).d} ${fmt(e.date).m}, ${e.going} of ${e.cap} seats</div></div>
          <button class="btn ghost" onclick="openManage(${e.id})">Check in</button></div>`).join('')}</div>`
        : `<div class="empty">No events yet. Create your first one.</div>`}</div>
    </div>`;
}

function render(){
  document.querySelectorAll('.nav').forEach(b => b.setAttribute('aria-current', b.dataset.v === view));
  $('#app').innerHTML = {discover, rsvps, organize}[view]();

  const qi = $('#q');
  if (qi) qi.oninput = e => {
    q = e.target.value;
    const p = e.target.selectionStart;
    render();
    const n = $('#q'); n.focus(); n.setSelectionRange(p, p);
  };
  const s = $('#sort');
  if (s) s.onchange = e => { sort = e.target.value; render(); };

  const f = $('#f');
  if (f) f.onsubmit = ev => {
    ev.preventDefault();
    const d = Object.fromEntries(new FormData(f));
    events.push({id:Date.now(), club:ME, going:0, att:[], title:d.title, date:d.date, time:d.time, venue:d.venue, cap:+d.cap, desc:d.desc});
    toast('Event published');
    render();
  };
}

// ---------- Dialogs ----------
function openEvent(id){
  const e = events.find(x => x.id === id), f = fmt(e.date);
  const going = mine.has(id), full = e.going >= e.cap && !going;
  dlg.innerHTML = `<div class="dh" style="--c:${CLUBS[e.club]}"><h2>${esc(e.title)}</h2>
    <div>${esc(e.club)} Club, ${f.w} ${f.d} ${f.m} at ${e.time}</div><div>${esc(e.venue)}</div></div>
    <div class="in"><p style="margin:0">${esc(e.desc)}</p>
      <div class="bar" style="width:100%;--c:${CLUBS[e.club]}"><i style="width:${Math.min(100, e.going / e.cap * 100)}%"></i></div>
      <div class="meta">${e.going} of ${e.cap} seats reserved</div>
      <div class="acts">
        <button class="btn ghost" onclick="dlg.close()">Close</button>
        <button class="btn" ${full ? 'disabled' : ''} onclick="toggle(${id})">${going ? 'Cancel RSVP' : full ? 'Event full' : 'Reserve a seat'}</button>
      </div></div>`;
  dlg.showModal();
}

function toggle(id){
  const e = events.find(x => x.id === id);
  if (mine.has(id)) { mine.delete(id); e.going--; toast('RSVP cancelled'); }
  else { mine.add(id); e.going++; toast('Seat reserved'); }
  dlg.close();
  render();
}

function openManage(id){
  const e = events.find(x => x.id === id);
  checked[id] = checked[id] || new Set();
  dlg.innerHTML = `<div class="dh" style="--c:${CLUBS[e.club]}"><h2>Check-in</h2>
    <div>${esc(e.title)}: ${checked[id].size} of ${e.att.length} arrived</div></div>
    <div class="in">
      ${e.att.length ? e.att.map(n => `<label class="chk"><input type="checkbox" ${checked[id].has(n) ? 'checked' : ''} data-n="${esc(n)}" onchange="chk(${id}, this.dataset.n, this.checked)">${esc(n)}</label>`).join('')
        : '<div class="empty">No named attendees yet. RSVPs will show up here.</div>'}
      <div class="acts"><button class="btn" onclick="dlg.close()">Done</button></div>
    </div>`;
  dlg.showModal();
}

function chk(id, name, on){
  on ? checked[id].add(name) : checked[id].delete(name);
  openManage(id);
}

// ---------- Init ----------
document.querySelectorAll('.nav').forEach(b => b.onclick = () => { view = b.dataset.v; render(); });
dlg.addEventListener('click', e => { if (e.target === dlg) dlg.close(); });
render();
