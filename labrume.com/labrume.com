<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Labrume | Gaming Creator</title>
<link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@400;700&display=swap" rel="stylesheet">
<style>
:root{
  --bg:#0a0a0f;
  --card:#12121a;
  --accent:#00f7ff;
  --accent2:#ff00e6;
  --text:#ffffff;
}
body{
  margin:0;
  font-family:'Orbitron', sans-serif;
  background:var(--bg);
  color:var(--text);
  scroll-behavior:smooth;
}
header{
  text-align:center;
  padding:80px 20px;
  background: radial-gradient(circle at top, #111, #000);
}
h1{
  font-size:3em;
  text-shadow:0 0 15px var(--accent);
}
p{
  color:#bbb;
}
.btn{
  display:inline-block;
  margin:10px;
  padding:12px 25px;
  border-radius:30px;
  background:linear-gradient(45deg,var(--accent),var(--accent2));
  color:#000;
  font-weight:bold;
  text-decoration:none;
  transition:0.3s;
}
.btn:hover{
  transform:scale(1.1);
  box-shadow:0 0 20px var(--accent);
}
section{
  max-width:1000px;
  margin:auto;
  padding:60px 20px;
  opacity:0;
  transform:translateY(40px);
  transition:0.6s;
}
section.show{
  opacity:1;
  transform:translateY(0);
}
.card{
  background:var(--card);
  padding:25px;
  border-radius:15px;
  margin:20px 0;
  box-shadow:0 0 20px #000;
}
iframe{
  width:100%;
  height:400px;
  border-radius:10px;
}
.stats{
  display:flex;
  justify-content:space-around;
  flex-wrap:wrap;
}
.stat{
  margin:10px;
  font-size:1.2em;
}
.toggle{
  position:fixed;
  top:20px;
  right:20px;
  cursor:pointer;
  background:#222;
  padding:10px;
  border-radius:50%;
}
footer{
  text-align:center;
  padding:20px;
  color:#666;
}
</style>
</head>
<body>

<div class="toggle" onclick="toggleMode()">🌙</div>

<header>
  <h1>Labrume</h1>
  <p>Gaming Creator • YouTuber • Community Builder</p>
  <a class="btn" href="https://www.youtube.com/@labrume_gaming" target="_blank">YouTube</a>
  <a class="btn" href="https://discord.gg/gVHG4katDH" target="_blank">Discord</a>
</header>

<section>
  <h2>🚀 About Me</h2>
  <div class="card">
    <p>I’m Labrume, a passionate gaming creator. I make videos, stream, and build an awesome community. Join the journey and let’s grow together.</p>
  </div>
</section>

<section>
  <h2>🎥 Latest Videos</h2>
  <div class="card">
    <iframe src="https://www.youtube.com/embed?listType=user_uploads&list=labrume_gaming" allowfullscreen></iframe>
  </div>
</section>

<section>
  <h2>📊 Live Stats</h2>
  <div class="card stats">
    <div class="stat">Subscribers: <span id="subs">Loading...</span></div>
    <div class="stat">Views: <span id="views">Loading...</span></div>
  </div>
</section>

<section>
  <h2>💬 Join My Discord</h2>
  <div class="card">
    <p>Chat, play, and connect with the community.</p>
    <a class="btn" href="https://discord.gg/gVHG4katDH" target="_blank">Join Now</a>
  </div>
</section>

<section>
  <h2>🔥 What I Do</h2>
  <div class="card">
    <ul>
      <li>🎮 Gaming Content</li>
      <li>🔥 Live Streams</li>
      <li>💬 Community Events</li>
    </ul>
  </div>
</section>

<footer>
  <p>© 2026 Labrume</p>
</footer>

<script>
// Scroll animation
const sections = document.querySelectorAll("section");
window.addEventListener("scroll", ()=>{
  sections.forEach(sec=>{
    const top = sec.getBoundingClientRect().top;
    if(top < window.innerHeight - 100){
      sec.classList.add("show");
    }
  });
});

// Dark/light mode
function toggleMode(){
  document.body.classList.toggle("light");
}

// Fake stats (replace later with API)
document.getElementById("subs").innerText = "???";
document.getElementById("views").innerText = "???";
</script>

</body>
</html>
<script>
// === CONFIG ===
const channel = "labrume_gaming"; // your handle

// Fetch stats
fetch(`https://api.socialkit.dev/youtube/channel-stats?url=https://www.youtube.com/@${channel}`)
  .then(res => res.json())
  .then(data => {
    document.getElementById("subs").innerText = format(data.subscriberCount);
    document.getElementById("views").innerText = format(data.viewCount);
  })
  .catch(() => {
    document.getElementById("subs").innerText = "Unavailable";
    document.getElementById("views").innerText = "Unavailable";
  });

// Format numbers (nice display like 1.2K)
function format(num) {
  if(num >= 1000000) return (num/1000000).toFixed(1) + "M";
  if(num >= 1000) return (num/1000).toFixed(1) + "K";
  return num;
}
</script>
<div class="stat">
  👥 Subscribers<br><strong id="subs">Loading...</strong>
</div>

<div class="stat">
  👀 Views<br><strong id="views">Loading...</strong>
</div>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Labrume | Ultimate Gaming Hub</title>
<link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@400;700&display=swap" rel="stylesheet">
<script src="https://www.gstatic.com/firebasejs/8.10.0/firebase-app.js"></script>
<script src="https://www.gstatic.com/firebasejs/8.10.0/firebase-database.js"></script>
<style>
body{margin:0;font-family:'Orbitron',sans-serif;background:#0a0a0f;color:white}
header{text-align:center;padding:60px;background:#000}
h1{font-size:3em;color:#00f7ff}
.btn{padding:10px 20px;margin:5px;border-radius:20px;background:#00f7ff;color:#000;text-decoration:none;cursor:pointer}
section{padding:40px;max-width:1000px;margin:auto}
.card{background:#12121a;padding:20px;border-radius:10px;margin:20px 0}

/* Discord style chat */
.chat-container{display:flex;height:300px;background:#1e1f22;border-radius:10px;overflow:hidden}
.chat-sidebar{width:120px;background:#2b2d31;padding:10px}
.chat-main{flex:1;display:flex;flex-direction:column}
.chat-messages{flex:1;overflow-y:auto;padding:10px}
.chat-input{display:flex}
.chat-input input{flex:1;padding:10px;border:none}
.chat-input button{padding:10px;background:#00f7ff;border:none}
.message{margin:5px 0}
.username{color:#00f7ff;font-weight:bold}

/* particles */
#particles{position:fixed;top:0;left:0;width:100%;height:100%;z-index:-1}
</style>
</head>
<body>

<canvas id="particles"></canvas>

<header>
<h1>Labrume</h1>
<a class="btn" href="https://www.youtube.com/@labrume_gaming" target="_blank">YouTube</a>
<a class="btn" href="https://discord.gg/gVHG4katDH" target="_blank">Discord</a>
<button class="btn" onclick="rickroll()">🎁</button>
</header>

<section>
<h2>📊 Stats</h2>
<div class="card">
Subscribers: <span id="subs">Loading...</span><br>
Views: <span id="views">Loading...</span>
</div>
</section>

<section>
<h2>💬 Live Chat</h2>
<div class="chat-container">
<div class="chat-sidebar">💬 Chat</div>
<div class="chat-main">
<div class="chat-messages" id="messages"></div>
<div class="chat-input">
<input id="msg" placeholder="Message...">
<button onclick="sendMsg()">Send</button>
</div>
</div>
</div>
</section>

<script>
// Firebase config (YOU MUST REPLACE THIS)
const firebaseConfig = {
  apiKey: "YOUR_KEY",
  authDomain: "YOUR_DOMAIN",
  databaseURL: "YOUR_DB",
  projectId: "YOUR_ID",
};
firebase.initializeApp(firebaseConfig);
const db = firebase.database().ref("chat");

function sendMsg(){
  const input = document.getElementById("msg");
  if(input.value.trim()==="")return;
  db.push({user:"User",text:input.value});
  input.value="";
}

db.on("child_added", snap=>{
  const data=snap.val();
  const div=document.createElement("div");
  div.classList.add("message");
  div.innerHTML=`<span class="username">${data.user}:</span> ${data.text}`;
  document.getElementById("messages").appendChild(div);
});

// YouTube stats
fetch("https://api.socialkit.dev/youtube/channel-stats?url=https://www.youtube.com/@labrume_gaming")
.then(r=>r.json())
.then(d=>{
subs.innerText=d.subscriberCount;
views.innerText=d.viewCount;
});

// Fun
function rickroll(){window.open("https://www.youtube.com/watch?v=dQw4w9WgXcQ")}

// particles
const canvas=document.getElementById("particles");
const ctx=canvas.getContext("2d");
canvas.width=window.innerWidth;
canvas.height=window.innerHeight;
let particles=[];
for(let i=0;i<80;i++){
particles.push({x:Math.random()*canvas.width,y:Math.random()*canvas.height,vx:1,vy:1});
}
function animate(){
ctx.clearRect(0,0,canvas.width,canvas.height);
particles.forEach(p=>{
p.x+=p.vx;p.y+=p.vy;
if(p.x>canvas.width||p.y>canvas.height)p.x=p.y=0;
ctx.fillRect(p.x,p.y,2,2);
});
requestAnimationFrame(animate);
}
animate();
</script>

</body>
</html>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Labrume | Final Boss</title>
<link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@400;700&display=swap" rel="stylesheet">
<script src="https://www.gstatic.com/firebasejs/8.10.0/firebase-app.js"></script>
<script src="https://www.gstatic.com/firebasejs/8.10.0/firebase-database.js"></script>
<style>
body{margin:0;font-family:'Orbitron',sans-serif;background:#050507;color:white;overflow-x:hidden}

/* LOADING SCREEN */
#loader{
position:fixed;top:0;left:0;width:100%;height:100%;
background:black;display:flex;justify-content:center;align-items:center;
z-index:9999;font-size:2em;color:#00f7ff;
}

header{text-align:center;padding:80px;background:#000}
h1{font-size:3em;text-shadow:0 0 20px #00f7ff}

.btn{padding:12px 25px;margin:10px;border-radius:25px;background:#00f7ff;color:#000;cursor:pointer;border:none}
.btn:hover{transform:scale(1.1)}

section{padding:50px;max-width:1000px;margin:auto}
.card{background:#111;padding:20px;border-radius:15px;margin:20px 0}

/* CHAT */
.chat{height:300px;background:#1e1f22;border-radius:10px;display:flex;flex-direction:column}
.messages{flex:1;overflow-y:auto;padding:10px}
.input{display:flex}
.input input{flex:1;padding:10px}
.input button{padding:10px;background:#00f7ff;border:none}

.username{color:#00f7ff}

/* MUSIC */
#musicBtn{position:fixed;bottom:20px;right:20px}

/* particles */
canvas{position:fixed;top:0;left:0;z-index:-1}
</style>
</head>
<body>

<div id="loader">Loading Labrume...</div>
<canvas id="bg"></canvas>

<header>
<h1>Labrume</h1>
<a class="btn" href="https://www.youtube.com/@labrume_gaming" target="_blank">YouTube</a>
<a class="btn" href="https://discord.gg/gVHG4katDH" target="_blank">Discord</a>
<button class="btn" onclick="rickroll()">🎁</button>
</header>

<section>
<h2>📊 Stats</h2>
<div class="card">
Subs: <span id="subs"></span><br>
Views: <span id="views"></span>
</div>
</section>

<section>
<h2>💬 Chat</h2>
<div class="chat">
<div class="messages" id="msgs"></div>
<div class="input">
<input id="msg" placeholder="Say something...">
<button onclick="send()">Send</button>
</div>
</div>
</section>

<button id="musicBtn" class="btn" onclick="toggleMusic()">🎵</button>
<audio id="music" loop>
<source src="https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3">
</audio>

<script>
// LOADER
window.onload=()=>{setTimeout(()=>{loader.style.display="none"},1500)}

// FIREBASE (PUT YOUR CONFIG)
const firebaseConfig={apiKey:"YOUR_KEY",databaseURL:"YOUR_DB"};
firebase.initializeApp(firebaseConfig);
const db=firebase.database().ref("chat");

function send(){
let text=msg.value;
if(!text)return;
db.push({user:"User",text});
msg.value="";
}

db.on("child_added",snap=>{
let d=snap.val();
let div=document.createElement("div");
div.innerHTML=`<span class='username'>${d.user}:</span> ${d.text}`;
msgs.appendChild(div);
msgs.scrollTop=msgs.scrollHeight;
});

// YOUTUBE
fetch("https://api.socialkit.dev/youtube/channel-stats?url=https://www.youtube.com/@labrume_gaming")
.then(r=>r.json())
.then(d=>{
subs.innerText=d.subscriberCount;
views.innerText=d.viewCount;
});

// FUN
function rickroll(){window.open("https://www.youtube.com/watch?v=dQw4w9WgXcQ")}

// MUSIC
let playing=false;
function toggleMusic(){
if(!playing){music.play();playing=true}else{music.pause();playing=false}
}

// PARTICLES
const c=document.getElementById("bg"),ctx=c.getContext("2d");
c.width=innerWidth;c.height=innerHeight;
let p=[];
for(let i=0;i<100;i++){p.push({x:Math.random()*c.width,y:Math.random()*c.height})}
function draw(){
ctx.clearRect(0,0,c.width,c.height);
p.forEach(dot=>{dot.y+=1;if(dot.y>c.height)dot.y=0;ctx.fillRect(dot.x,dot.y,2,2)});
requestAnimationFrame(draw);
}
draw();
</script>

</body>
</html>
<script src="https://www.gstatic.com/firebasejs/8.10.0/firebase-auth.js"></script>
<button class="btn" onclick="login()">Login with Google</button>
<button class="btn" onclick="logout()">Logout</button>
<script>
// Firebase config
const firebaseConfig = {
  apiKey: "YOUR_KEY",
  authDomain: "YOUR_DOMAIN",
  databaseURL: "YOUR_DB",
  projectId: "YOUR_ID"
};

firebase.initializeApp(firebaseConfig);

const db = firebase.database().ref("chat");
const auth = firebase.auth();

let currentUser = null;

// LOGIN
function login(){
  const provider = new firebase.auth.GoogleAuthProvider();
  auth.signInWithPopup(provider);
}

// LOGOUT
function logout(){
  auth.signOut();
}

// TRACK USER
auth.onAuthStateChanged(user=>{
  if(user){
    currentUser = user;
    console.log("Logged in as:", user.displayName);
  } else {
    currentUser = null;
  }
});

// SEND MESSAGE
function send(){
  let text = msg.value;
  if(!text || !currentUser) return alert("Login first!");
  
  db.push({
    user: currentUser.displayName,
    text: text
  });
  
  msg.value = "";
}
</script>