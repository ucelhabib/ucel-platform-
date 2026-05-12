[index.html](https://github.com/user-attachments/files/27636519/index.html)
<!DOCTYPE html>
<html lang="tr">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1">
<meta name="theme-color" content="#1f4e8c">
<title>Üçel Yapısal Çelik - Yönetim Platformu</title>
<style>
*,*::before,*::after{box-sizing:border-box;margin:0;padding:0;-webkit-tap-highlight-color:transparent}
:root{
  --p:#1f4e8c;--pl:#2e75b6;--o:#ee7e2c;--ok:#27ae60;--err:#e74c3c;--w:#f39c12;
  --bg:#f1f4f8;--surf:#fff;--t:#1a2332;--m:#7c8a9c;--bd:#e1e7ee;
}
html,body{font-family:-apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,Arial,sans-serif;
  background:var(--bg);color:var(--t);line-height:1.45;min-height:100vh}
button,input,select,textarea{font-family:inherit;font-size:inherit}

/* LOGIN */
#login{position:fixed;inset:0;z-index:9999;
  background:linear-gradient(135deg,#0f172a 0%,#1f4e8c 50%,#2e75b6 100%);
  display:flex;align-items:center;justify-content:center;padding:20px}
#login.hidden{display:none}
.login-card{background:#fff;border-radius:16px;padding:32px 28px;max-width:420px;width:100%;
  box-shadow:0 20px 60px rgba(0,0,0,.35)}
.login-logo{text-align:center;margin-bottom:22px}
.login-logo img{max-width:240px;height:auto}
.login-logo p{font-size:12px;color:var(--m);margin-top:6px}
.login-form label{display:block;font-size:11px;font-weight:700;color:var(--m);
  margin-bottom:5px;text-transform:uppercase;letter-spacing:.5px}
.login-form input{width:100%;padding:12px 14px;border:2px solid var(--bd);border-radius:10px;
  font-size:14px;margin-bottom:14px;background:#fff;color:var(--t);transition:border-color .15s}
.login-form input:focus{outline:none;border-color:var(--pl)}
.login-btn{width:100%;padding:14px;background:linear-gradient(135deg,var(--o),#d96a17);
  color:#fff;border:none;border-radius:10px;font-size:15px;font-weight:700;cursor:pointer;margin-top:8px}
.login-btn:active{transform:scale(.98)}
.login-err{color:var(--err);font-size:12px;margin-top:8px;text-align:center;min-height:16px}
.login-hint{text-align:center;font-size:11px;color:var(--m);margin-top:18px;
  padding-top:14px;border-top:1px solid var(--bd);line-height:1.7}
.login-hint strong{color:var(--p)}

/* AUTH STRIP */
.auth-strip{background:linear-gradient(135deg,#0f172a,#1e293b);color:#fff;padding:8px 18px;
  display:flex;align-items:center;justify-content:space-between;gap:10px;
  position:sticky;top:0;z-index:200;box-shadow:0 2px 10px rgba(0,0,0,.2)}
.auth-strip .left{display:flex;align-items:center;gap:12px;min-width:0;flex:1}
.auth-strip .logo-mini{height:32px;width:auto;background:#fff;padding:3px 6px;border-radius:5px;flex-shrink:0}
.auth-strip .av{width:32px;height:32px;border-radius:50%;color:#fff;font-weight:700;font-size:13px;
  display:flex;align-items:center;justify-content:center;flex-shrink:0}
.auth-strip .name{font-weight:700;font-size:13px}
.auth-strip .sub{font-size:11px;opacity:.75}
.notif-btn{background:rgba(255,210,63,.2);border:1px solid #ffd23f;color:#ffd23f;
  padding:6px 12px;border-radius:6px;cursor:pointer;font-size:12px;font-weight:600;position:relative}
.notif-badge{background:var(--o);color:#fff;border-radius:10px;padding:1px 6px;font-size:10px;margin-left:3px;font-weight:800}
.logout-btn{background:rgba(231,76,60,.25);color:#fff;border:1px solid rgba(255,255,255,.2);
  padding:6px 12px;border-radius:6px;cursor:pointer;font-size:12px;font-weight:600}
.logout-btn:hover{background:rgba(231,76,60,.45)}

/* APP */
#app{display:none}
#app.show{display:block}
.layout{display:grid;grid-template-columns:240px 1fr;min-height:calc(100vh - 49px)}
.sidebar{background:var(--p);color:#fff;padding:14px 0;overflow-y:auto}
.sidebar-section{padding:14px 18px 6px;font-size:10px;font-weight:700;letter-spacing:1px;
  text-transform:uppercase;opacity:.5}
.sidebar-item{padding:10px 18px;font-size:13px;cursor:pointer;display:flex;align-items:center;gap:10px;
  border-left:3px solid transparent;transition:all .15s}
.sidebar-item:hover{background:rgba(255,255,255,.08)}
.sidebar-item.active{background:rgba(255,255,255,.12);border-left-color:var(--o);font-weight:600}
.sidebar-item .ico{font-size:16px;width:22px;text-align:center}
.sidebar-badge{margin-left:auto;background:var(--err);color:#fff;font-size:10px;padding:2px 6px;
  border-radius:10px;font-weight:700}
.sidebar-badge.ok{background:var(--ok)}
.sidebar-foot{padding:14px 18px;margin-top:14px;border-top:1px solid rgba(255,255,255,.15);
  font-size:11px;opacity:.7}

.main{background:var(--bg);padding:20px 24px 60px;overflow-x:hidden}
.page-h{display:flex;justify-content:space-between;align-items:center;margin-bottom:18px;
  flex-wrap:wrap;gap:12px}
.page-title{font-size:22px;font-weight:800;color:var(--p)}
.page-sub{font-size:13px;color:var(--m);margin-top:2px}

.btn{background:var(--p);color:#fff;border:none;padding:8px 14px;border-radius:8px;
  font-size:13px;font-weight:600;cursor:pointer;transition:opacity .15s;
  display:inline-flex;align-items:center;gap:6px}
.btn:hover{opacity:.9}
.btn:active{transform:scale(.97)}
.btn.sm{padding:5px 10px;font-size:11px}
.btn.sec{background:#fff;color:var(--t);border:1px solid var(--bd)}
.btn.ok{background:var(--ok)}
.btn.err{background:var(--err)}
.btn.w{background:var(--w);color:var(--t)}

.banner{background:#ecfdf5;color:#065f46;border-left:4px solid var(--ok);
  padding:10px 14px;border-radius:8px;margin-bottom:16px;font-size:13px;
  display:flex;gap:10px;align-items:center}
.banner.warn{background:#fff7ed;color:#9a3412;border-left-color:var(--w)}
.banner.err{background:#fef2f2;color:#991b1b;border-left-color:var(--err)}
.banner .ico{font-size:18px}

.kpi-grid{display:grid;grid-template-columns:repeat(auto-fit,minmax(170px,1fr));
  gap:12px;margin-bottom:20px}
.kpi{background:#fff;padding:14px 16px;border-radius:12px;box-shadow:0 1px 4px rgba(0,0,0,.04);
  border-left:4px solid var(--pl)}
.kpi.err{border-left-color:var(--err)}
.kpi.ok{border-left-color:var(--ok)}
.kpi.w{border-left-color:var(--w)}
.kpi-label{font-size:11px;color:var(--m);text-transform:uppercase;letter-spacing:.5px;font-weight:700}
.kpi-val{font-size:26px;font-weight:800;color:var(--p);margin-top:4px;line-height:1}
.kpi-val.r{color:var(--err)}
.kpi-val.g{color:var(--ok)}
.kpi-sub{font-size:11px;color:var(--m);margin-top:4px}

.dept-grid{display:grid;grid-template-columns:repeat(auto-fit,minmax(260px,1fr));gap:12px;margin-bottom:20px}
.dept-card{background:#fff;border-radius:12px;overflow:hidden;box-shadow:0 1px 4px rgba(0,0,0,.05);
  cursor:pointer;transition:transform .15s}
.dept-card:hover{transform:translateY(-2px);box-shadow:0 6px 18px rgba(0,0,0,.08)}
.dept-head{padding:12px 14px;color:#fff;display:flex;justify-content:space-between;align-items:center}
.dept-head .nm{font-weight:700;font-size:14px}
.dept-head .ic{font-size:22px;opacity:.9}
.dept-body{padding:12px 14px}
.dept-body .row{display:flex;justify-content:space-between;padding:4px 0;font-size:12px}
.dept-body .row .lbl{color:var(--m)}
.dept-body .row .val{font-weight:700}
.dept-body .row .val.r{color:var(--err)}
.dept-body .row .val.g{color:var(--ok)}

.dh-tp{background:linear-gradient(135deg,#0f5132,#198754)}
.dh-sa{background:linear-gradient(135deg,#1f4e8c,#2e75b6)}
.dh-st{background:linear-gradient(135deg,#0c5460,#138496)}
.dh-ur{background:linear-gradient(135deg,#c04a1b,#e67e22)}
.dh-sv{background:linear-gradient(135deg,#084298,#3b82f6)}
.dh-mn{background:linear-gradient(135deg,#0f5132,#27ae60)}
.dh-mu{background:linear-gradient(135deg,#842029,#dc3545)}

.section-h{display:flex;justify-content:space-between;align-items:center;margin:20px 0 10px;flex-wrap:wrap;gap:8px}
.section-h h2{font-size:14px;color:var(--p);font-weight:700;text-transform:uppercase;letter-spacing:.5px}
.section-h .toolbar{display:flex;gap:6px;flex-wrap:wrap}

.table-wrap{background:#fff;border-radius:12px;overflow:hidden;box-shadow:0 1px 4px rgba(0,0,0,.05);
  overflow-x:auto;margin-bottom:14px}
table{width:100%;border-collapse:collapse;font-size:13px}
th{text-align:left;padding:10px 12px;background:#f8fafc;font-size:10px;text-transform:uppercase;
  color:var(--m);font-weight:700;letter-spacing:.4px;border-bottom:2px solid var(--bd);white-space:nowrap}
td{padding:10px 12px;border-bottom:1px solid var(--bd);vertical-align:middle}
tr:last-child td{border-bottom:none}
tr:hover td{background:#fafbfd}
tr.click{cursor:pointer}

.pill{display:inline-block;padding:3px 9px;border-radius:12px;font-size:11px;font-weight:700;white-space:nowrap}
.pl-gray{background:#e5e7eb;color:#374151}
.pl-yellow{background:#fef3c7;color:#92400e}
.pl-blue{background:#dbeafe;color:#1e40af}
.pl-purple{background:#e9d5ff;color:#6b21a8}
.pl-green{background:#d1fae5;color:#065f46}
.pl-red{background:#fee2e2;color:#991b1b}
.pl-orange{background:#fed7aa;color:#9a3412}
.pl-cyan{background:#cffafe;color:#155e75}

.av-mini{width:24px;height:24px;border-radius:50%;color:#fff;font-size:10px;font-weight:700;
  display:inline-flex;align-items:center;justify-content:center}
.progress{height:6px;background:var(--bg);border-radius:3px;overflow:hidden;min-width:70px}
.pbar{height:100%;background:linear-gradient(90deg,var(--pl),var(--ok));border-radius:3px;transition:width .4s}

/* TASK CARD */
.task-card{background:#fff;padding:12px 14px;border-radius:10px;margin-bottom:6px;
  box-shadow:0 1px 3px rgba(0,0,0,.04);display:flex;gap:12px;align-items:flex-start;transition:background .1s}
.task-card:hover{background:#fafbfd}
.task-card.done{opacity:.6}
.check{width:22px;height:22px;border-radius:50%;border:2px solid #cdd5df;flex-shrink:0;
  margin-top:2px;cursor:pointer;transition:all .15s}
.check:hover{border-color:var(--ok)}
.check.checked{background:var(--ok);border-color:var(--ok);position:relative}
.check.checked::after{content:'\2713';color:#fff;font-weight:bold;font-size:14px;
  position:absolute;top:50%;left:50%;transform:translate(-50%,-50%)}
.task-info{flex:1;min-width:0;cursor:pointer}
.task-title{font-size:14px;font-weight:600}
.task-title.done{text-decoration:line-through;color:#9ca3af}
.task-sub{display:flex;gap:8px;align-items:center;font-size:11px;color:var(--m);margin-top:4px;flex-wrap:wrap}
.task-sub .due{color:var(--err);font-weight:700}
.task-actions{display:flex;gap:4px}
.icon-btn{background:transparent;border:none;cursor:pointer;width:28px;height:28px;border-radius:6px;
  font-size:14px;color:var(--m);transition:all .15s}
.icon-btn:hover{background:var(--bg);color:var(--t)}
.icon-btn.err:hover{background:#fef2f2;color:var(--err)}

/* MODAL */
.modal-bg{position:fixed;inset:0;background:rgba(15,23,42,.6);display:none;align-items:center;
  justify-content:center;z-index:1000;padding:16px;backdrop-filter:blur(4px)}
.modal-bg.show{display:flex;animation:fade .15s}
@keyframes fade{from{opacity:0}to{opacity:1}}
.modal{background:#fff;border-radius:14px;max-width:520px;width:100%;max-height:90vh;
  display:flex;flex-direction:column;box-shadow:0 20px 60px rgba(0,0,0,.3)}
.modal-h{padding:18px 22px 12px;border-bottom:1px solid var(--bd);display:flex;
  justify-content:space-between;align-items:center}
.modal-h h3{color:var(--p);font-size:17px}
.modal-h .x{background:#f1f4f8;border:none;width:30px;height:30px;border-radius:50%;
  cursor:pointer;font-size:14px}
.modal-b{padding:16px 22px;overflow-y:auto}
.modal-f{padding:12px 22px;border-top:1px solid var(--bd);display:flex;gap:8px;justify-content:flex-end}
.frow{margin-bottom:12px}
.frow label{display:block;font-size:11px;font-weight:700;color:var(--m);
  margin-bottom:4px;text-transform:uppercase;letter-spacing:.5px}
.frow input,.frow select,.frow textarea{width:100%;padding:9px 12px;border:1.5px solid var(--bd);
  border-radius:8px;font-size:13px;background:#fff;color:var(--t);font-family:inherit}
.frow textarea{min-height:60px;resize:vertical}
.frow input:focus,.frow select:focus,.frow textarea:focus{outline:none;border-color:var(--pl)}
.fgrid{display:grid;grid-template-columns:1fr 1fr;gap:10px}
@media(max-width:500px){.fgrid{grid-template-columns:1fr}}

/* TOAST */
.toast-wrap{position:fixed;bottom:20px;left:50%;transform:translateX(-50%);z-index:5000;
  display:flex;flex-direction:column;gap:8px;align-items:center;pointer-events:none}
.toast{background:var(--ok);color:#fff;padding:10px 18px;border-radius:10px;
  box-shadow:0 8px 24px rgba(0,0,0,.2);font-size:13px;font-weight:600;animation:tin .2s}
.toast.err{background:var(--err)}
.toast.w{background:var(--w);color:var(--t)}
.toast.info{background:var(--pl)}
@keyframes tin{from{transform:translateY(20px);opacity:0}to{transform:translateY(0);opacity:1}}

/* NOTIF PANEL */
.notif-panel{position:fixed;top:60px;right:14px;width:340px;max-height:440px;background:#fff;
  border-radius:12px;box-shadow:0 12px 40px rgba(0,0,0,.25);z-index:300;display:none;overflow:hidden}
.notif-panel.show{display:block}
.notif-h{padding:12px 16px;border-bottom:1px solid var(--bd);font-weight:700;font-size:13px;color:var(--p);
  display:flex;justify-content:space-between;align-items:center}
.notif-list{max-height:380px;overflow-y:auto}
.notif-item{padding:10px 14px;border-bottom:1px solid var(--bd);font-size:12px;cursor:pointer}
.notif-item:hover{background:#fafbfd}
.notif-item .when{font-size:10px;color:var(--m);margin-top:3px}

.menu-btn{display:none;background:rgba(255,255,255,.18);border:none;color:#fff;width:32px;height:32px;
  border-radius:6px;font-size:16px;cursor:pointer}
.sb-overlay{display:none;position:fixed;inset:0;background:rgba(0,0,0,.4);z-index:80}
.sb-overlay.show{display:block}

/* PAGE switcher */
.page{display:none}
.page.show{display:block}

/* RESPONSIVE */
@media(max-width:880px){
  .menu-btn{display:inline-flex}
  .layout{grid-template-columns:1fr}
  .sidebar{position:fixed;left:-260px;top:49px;width:240px;height:calc(100vh - 49px);
    z-index:90;transition:left .25s}
  .sidebar.show{left:0;box-shadow:8px 0 30px rgba(0,0,0,.2)}
  .main{padding:14px}
  .page-title{font-size:18px}
  .kpi-val{font-size:22px}
  table{font-size:11px}
  th,td{padding:8px}
  .auth-strip{padding:6px 12px}
  .auth-strip .name{font-size:12px}
  .auth-strip .sub{display:none}
  .auth-strip .logo-mini{height:28px}
}
</style>
</head>
<body>

<!-- ========== LOGIN ========== -->
<div id="login">
  <div class="login-card">
    <div class="login-logo">
      <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAlgAAAC8CAYAAACkLNBhAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAABmJLR0QA/wD/AP+gvaeTAAAACXBIWXMAAFxGAABcRgEUlENBAAAAB3RJTUUH6gUMBw038WFvSwAAgABJREFUeNrsnXd8FMX7xz8zW64ml94JndCrgoUioiDYsffee/3Ze++9YkH92hURRQUUARHpvbf0nsv1uy0z8/vjkhAQFRA4wH3zWu5y2fLM7Ob2s8/zzDMEFv955iwsgcsm0wmzNqWtLfe1jWise1Rn3TWDdWIChTHNTNdMoaQl2/MJIZJmsFAoYtSkJNl1zsV6SaIr3HZlcV6qY9mgbhklr3yxXFvy6bmJbpaFhYWFhUXCIIk2wGLvs6nUiwse/AFnjOji+n1FVXt/RB8UjBqHaAbvq5u80OQilXEoAoAQ8W0ICAQhTe8BEBL/lMQXiVJNlWhlslNZ6rbL32Yk26a8c+/hlfe+NF88csPQRDfZwsLCwsJir2IJrP8IQghc8chkFLVJsy/fXN+z0hs5MhQ1R0U0s5fBWDrjoEKQuG4CAQgBAQFIXGSRlp8JIOKrNIssgWbhRUAJgUQJU2W62ibT99pluz7/6KGR5cvX1aJXl6xEd4OFhYWFhcVewRJYBziff7cMg3sV0FvfmJETihlj6vyxE6IGO1wzeBrjzd4obBFUTf83i6cdFVik9XZNv6eEcJddWZ7iVB7vWuD+xhvUtfEPHAVCrMvOwsLCwuLAxrrTHaBc++hkFKS75DWVvl7l9eEzGgKx4zWTFTEuJIEt4T0gfhGI3Siwmi+q5s9lmYZT3er4/DT7Q9/NLq1pnHqRJbIsLCwsLA5orLvcAYQQAg+/OQM92mfYJ8xcf/C68sYzNZOfohs8mzUlU5EW4UQAQZo11J4RWC37BAghItVtm5rrUa8Nm2L9yLZ2XH/NsER3mYWFhYWFxR7BElgHCBfe9TXaZibLCzfX9YuZ7OYGf3RMRGfJQqBV+A9bYoJ7VWCR+CaEwKHSX/NT7Jevqwiun/vskUjKTU9011lYWFhYWOx2aKINsPh3PPnmDNRurCOqXen9y8ryFzbXBCaV1gbPDMfM5Lgw+msVLZr+a3kVAvF/cVHVehThv6ZJl8UMcYQvxt44sm9Owa3jVya6+ywsLCwsLPYIlgdrP+X6Bybi+yWlOLRbXlZ5ffBif0S/OqKzNpxvCQU2jwJs9iDFaRohSChovMQCI0SYNkWGJEkgBGBMQDM4QIjKOUiz0NqSs0V23oNF0PKeEoLMZNt7xw3Mva7GFws/ce0hie5OCwsLCwuL3YolsPZDrnl0EpKdqrp0Y92Y6sbIbRHNOIQJ0JbE9WbXFYDmzyilkCUSUhW5WpWljYosraeEbHLZlapQWKvt2TETKckOEAJ4fVGsLmmkSW5bQTBitDWZ6KmbvGfM4G1NJhy8af9kJwUWtqwFRZL0TI963ZR5NW/deHIHvHDrkER3q4WFhYWFxW5DTrQBFjvOs+/MxC2XvIGYwYoWLyu/2R/WztJNngQ0eZdIPMwHxGO/skx1mUqbXXZlcUqSfZ7brizISXNtGtQ1p+HsE3prTDeFbFMAADP+4pgPvjwDh/fNl3+cX5ZRXBPq5Q3pxwSixpiozjtzAWlXJDohgMG46gsbt58/qnDOhprI8kT3rYWFhYWFxe7E8mDtBwghcPUjk9AmO9kxe3n5aVXe8F2hmFHUHLYTrTxKEqWGXZE2JTttM5Jd6o8umzLv+EM61Hw6dbU56bWz/5Ud736xGMP75tF7P1iUu7kmdELU4FdqpujNBXbKgxXPk4+HCrNTbO9edXTbK+dt8BlPXH9oorvawsLCwsJit2AJrH2c8Z/MwwVn3YIL7rmxaGOV7y5vMHaabjBHS7kFAJQSqIpc77IrM1w25YvcVNesq8f2r1m6roZddc6g3W7T8+N+x02frME5h+YWFtdFrglp7Ard5B7aUgE+zt8JrOa8MFWmDVlJ6om6yWf//NJoqz6WhYWFhcUBgXU324e54K4vkZZkV1eVecfW+SMPhKJGERdNNRIIIEtUOFVlc4rb9lVWivPzg4tyly/dVKeNu2Uk1FTXHrfv9Du+x6BumfIvS2tOrPVrT0Y01hEtAmpHBFb8fYpTee++UzpdMX+T37jr0oMT3e0WFhYWFhb/Gktg7YOs3VSHq5/6Hu1zUtqsKa3/v/pA9HzD5EnN3h2JUqYq0nKP0/ZBn05Zky4a3XvTwrXV/IozB+51WydOWYMTR3bFsTdNGlDZGHvFYOKQ5jJZ/ySwmr1YdoXWtMtwHKOZfMmkp0cmuvstLCwsLCz+NVYdrH2M6x/5Fo01QZriUo9atL7qs1pf5BqjKZFdkqhw2pRl6Un2G7sVpI3+7d2Lnx/QIXvDQf0KEyKuAODEkV3xzrhZKPfGFma45EtVicwlAHamfJZuiuyYKU6b9PS7+GNReULaYWFhYWFhsTuxPFj7EFc9MhGqRN3LNtVeUe+P/l/UMDOFACilcKhySXaqe3ybrKR3Zq6tLL3umL644cLDE21yC2++MQM/lkQBxg+paIh+HNZZe+yIByvu6oLHKS8c1ClllMl4w0u3DU50cywsLCwsLP4VlgdrH2Dq9DVA2uXw+sId5qwse72yIfh4RDMyhQBsiuzP8jjf6t8554TPbj32gc45KaUbPr1mnxJXAHDFlcPQPceFCfMq/8hKsd2ryjS0M26smM67ldRF+62tCCe6KRYWFhYWFv8aqw5Wgnng5ano2j6DnnDu4BHrKrxPBKN6fyEASZJYits+J9PjfPTI/u1+8Yc1Pa3jvj1v36M3DMG1T0xHUZ7786/mVg5qCOrX7YjGIgBMJpwxg4/46f2V0+oaQ8hMdSe6ORYWFhYWFruMFSJMIFc++DXyM5Icvy0vu7zSG7o7ohmZhBDYVbk6Lcn5Uv8uue/MW11Re9novrjojMTkWO0KZ93zE1x2ucOK0sC3wSjrQcjfhwhJ00SFHqf8y+i+mcdHdBZ51Jo+x8LCwsJiP8YKESaIsTd9CMZ59g/zNjxdUut7MhIzMmWJsrQkx5SOeWmnPHTRsCezU521v79/+X4lrgDgypO6Y9yXazZ5nMrLskTYjqa8a4YoWlkWKthYHUl0EywsLCwsLP4VVohwL3PpHZ+hLBSBy670WrKh+mlfODaScxC7KldneFwv9myf9dbMxcXeYYd3whGDOyfa3F1i2EFtcP3TM2BXpQmh1Q0X+yLGDilExkW2zkRPb8hYl+g2WFhYWFhY/BssD9Ze5IJbP8bbj59OZC6OWrax+qPGUGwUAUGq2z4jLz3p1KevGvVU25wU7/KvbtjvK5of3iMTb/64qdah0PckSviOOLEYF3JEZz2nL2/AZ5PXJLoJFhYWFhYWu4wlsPYS1zz4NQ7r004ZdeW4C4qrfe+HYkZvRaL+DI/ziUN7tDlz5aaa2RkuG7/90mGJNnW3cMaY7jjlsHy0z3H94FClDcA/JPzF07AQirLO/JezKMTOVNKysLCwsLDYt7AE1l7gzucno11+qvv9KYtuKqvzv6SZZn6Ky7a6Q27qxWMGdr6vssZfXTn1LnTolp1oU3crQ3rn4K27hpc6VOkHQv45E0sIwGC8wz2vzXUu2exPtPkWFhYWFha7zD4Xh3rjy9kYe2Rv6bsZK+xL1lYkq7KUtWhNhdKpMKNAN5i9piEI3RBwOVXkZCQjpjNfIKTVtsn2BF1OW+MhvQtDJw7rrpuMc0WWEtoWIQRGXvYW+nTJy/htafG9vrB2tYBAisvxZcf8tAc+furstas31KBbpwNLWLVm2DXfwqFKI6p82kSTwUXIX4wiBABB4FClzUV5jmGEoOyD+4cn2nwLCwsLC4tdIqECyzAZZImS1z6daftj2eYcfyjWLRCK9dBN1lM3eAfDZDkgSI9ppixR6gQhEmNxPwihFJJEwQXRJUJjkkTDiiI3KrJUYbMpGxw2dbknyb4yNyN53dgjuzdc+MAEc8OEvZfbNOyMV5CS5YJESF5DMPpKVUPwZEWRGnJS3U/36ZT72vIN1cEpb1+23+da/RMXPjgNEiUZy0uDU8Ia7/dPAsumUF/XAtfRjIkFnzxkCSwLCwsLi/2TvX53bwyEkZLkJE+885NnxYbKXmVVjYdFYvrQqGb0MEyRyxhXmRAQTaYRxKeKAQhACCRCWt5zAcSnY4mn7AgCEEJBCIEkSZBlKWxTlFKX07bE47b/2qkg7Y+De+StK6nyx+66aMgea+OqlZUYfNWbOPXInl3nLC99JmaYxzpt6rI2WZ47Hrz0qCl/rCxj15y7b1Vi31N8Mnk1zhzdlQy/7rvX6oPGlcDfCyxZIlpemu2EUNScMuOV0Yk238LCwsLCYpfYawLrwde+Q3qKS5k+b20XbyByfCiinRiKaD01nbk5jw8yo5SCUgpZkqKKInsliVa7HLZ6SkhFmscVLa1u3JTssrNmERUIa8hMS8ojIOnBiJ5qcpGrGyxbN3mGyYSbcUG5ICCEQJFl4bQr9XabPCvd4/y2Q37az09dN6LylwXFfPRhnXZbO6+990usrqmHU5b71Pgj7/hDsf7JTtuE3PTk/yuuadzQMS0FE968eG91+z7BgEsmIM2tnl3j1z/kAvQfBBbaZdovbQiZ78x85ZhEm25hYWFhYbFL7PE6WGff/jba5KQ6lq8vH1ZR6zvHF4iO0HQzl3EBQQCJUthtStRpV4vtNnVhSrJziU2Rl6R6XCXZ6Un1Zx7TP9a7S74WjenC6bBt9xjrS+uR7nEoH32/xLa+vCG1zhvO94e1okBY72NyHBrVzCJNZ6mBsJYZiOhjfUHtxKr68PoxN336ZVFh+lff/Lp2eVVDiF11yoB/1dY/Fm3GIf3HoN+pl/atNMxxoKRbXkbSUz3aZj+5anNt47IvbsayPd3h+yD5aXZQQpbLlDTojGf+na5nHPBHWdLa8mCizbawsLCwsNhl9pjAuvS+8ejWIdcxdc6qYWs2VV8RimpHaTpzCwCUENhtctTlsK202ZTJhTmpv3Vpm718zJAedWXVjez0Yw5q2c/jO3CszoUZAGA0LSEAZRtKG/7o2CaNvPL53OQl66q7lNUEDwmEtVEx3TwsqrFUXyjWNRQ17mkMaJeuLfV+2bEg9Z1NFb7lKzfVseOH7HyBz69/WIJD+rfHZQ98fszcFaUvSTJ1t81Jve6YQUUfzV9Zrv/y3pV7qqv3ebq1SYYQqKgJ6OV6lGf+1XoEACFAslNpVzOnOtFmW1hYWFhY7DK7PUT47PtT0KNTnjTuy1kHV9X5b61rDI7SdNPdHAJ0O+3VyS77D5lpSV8M6NF23r1XjPHOWLBOHHFw0R5rZIMvjAfHzUTfLtnOmYtLu1fUhU7wh7RTglGjyDS5JFEKt9NWneZxvNOjQ+a452/8oPiLn+/EaSO67tD+X//fb7jqnHNw6k0PjC6u9r3NGG9om516w4SXLppx2+PfimfuOnGPtW1/4Muf1uCUI9pIR9wy/eOGoHH6X4UISTyJDg4FL69qYNcHv/pv95uFhYWFxf7LbhNYqzZW4tL7xqN/98K8FesqrqlpCFwSiRnZQghQSuFwqJuTXY6POrfN/uL0UQPWrCupMW69cOSf9rOy2ofOaS7y5oJiuTgYSwrrZrrBeHKW05ZTFYiSNIdafNPhnTb6okYuJYS6Vdkb1A1JojRGIEwAulOReZk/Ig5v92dnyYxFxRjary2589Vf8hauqT6mMRi7JBIzDzaYkGVJQrLbvjIz1fn4MYM6fFNeFww/ftWQvx3p9/anc3DZmWMw9oZnx5TU+N6khKzo0znv5lnLildfM2Ygrr/cGgn33fQNOO7KHzH6uE6PljdE7xICTX36Z4ElCGBXpDfnvzX+ykUrX0L/HgduCQsLCwsLiwOX3RIivPS+97FoVYmUlZZ09OxFGx7wByMDTcYJIRRup63W7bS/0yY37b2nbjll45TfV/EThvcBAMwuqcfGxgjaehx0YbXfVeyL5L+8oLhbjPFuIc3sH9LNTgIiy2TCUR6IuTljUaFHr6qsqd3o9qQ1AiAcQgOQxLlwSRROJoQRMRgyXTZ9ZY0/JFMSawiCp7qE6JbtwbD+7QBAbKporOiQf+47Vz957TdrS70nBiPGDcGI0csbiPWIxNg738xcf2xepvt+oly7/rvfNuK4wR3/1O73v5qLC085Giff8MKYslr/q4pEfxjar8N9vnCs+t7Tj8C5Zw9K9PndJzhueCcMvHwiVJmspwRg/1BxNC/d0U6I/9kWrazXEm27hYWFhYXFrvCvPVi3Pf0ZXA5b6owF666trPXdENWMdACwqYqWmZo0uX1BxtNXnD503ppN1ezy0+PTwPy8sQYSCPE4ZafBuIsJ4qoIaF2W1/mlLKd6XGNM77qyPtyzKqRliqYpU4QQgBDCCVacouBGKivffnzm4BY7VlT7oFBKoiYjNpmqEiFOgwkHpZC5gC4TEmJChBWJ8s4ZSS3bLVpTjf5dc3DtM1ParNxUf6k/rF8dirIMSoBkt21lYbbnvmtP7fvturJG8/ITe7ds97+J83HOiYdh7I1vHFtRG3gGAh+dOKzni/5wLPTkLccn+rzucxx3649QZDK8pC46WTeF/e88WHmp9mn3ndbpuPVVYe3CsT0TbbqFhYWFhcVOs8serJLKepx87SuoaQh0WLOp6vEGf/hUw2CUUApPkmNz+/yMJw/t2/F/JZXe0JABXTD0oCKsrPGDAFLMZE4QpAkhZJcqNdoovFVhNNpl6brFdcHjq8OaJ2owqDLVAJRAgDAu0iC4M8Vh+7ptsu13Q2ytDXvmpADx2VgEgNi6ukAsyS4Rf9SkEiVOAXi4EMkG49riisbGvnkpvNwfEW1SXACAorbpZecd0+OhNycum76h3H9/gz861B/Se2w0fe++8NniFwb2yHn2/177Lfjk1YMxd0kxBvVthzNuff/Ykkrvg2nJzlcGd+/w1obiOuPdJ85O9DndJxFCgDFUCQE/APvfraubHBtL/ajwWg4sCwsLC4v9k13yYP3fs5/j9yUb0S4v49CVGype9PpDB3MuIMsyy0xLnlzUPvue8Y9dsnz24g1icP/OmFvWACZAXYqUBiCTCxEwBa/rm5osPttQNXCdL3LzZn90SEPMyNRMDkKAJEValWqX77VJ9HeTCRLTzb6+mDEuEo4sUsE+6eIkn0eYMN8+b+Q/2rumLgCXJCFomKoQwg3ALUs05o3q9RIl3C5J6J2bgnBUx9HXf4kRBxVmLlpbc1NlQ/iaiMaSVVk2c9JdHw3tW3CPNxCt8NaWIRozR/hD0Uc0zXz61ws2fn3ku53wy4fXJvp87rPc+8ZcMMbbzVhZP8MfNgv/zoOVkaROu+jw7OPKGjXt7iutMKuFhYWFxf7HTnuw/li6AYN6d6Rn3/bGMQtXFj8bjmpdhRBw2NVIdrrn+cEDujy7Yn15IwA4czMwbXM9sSvURQnSDSYYBdncNzdF+6O0rtfbq8rOWOUNX14S0jJiTICAQFWkoFOi09t7HA9CjwWyHJIjbIrNnhRHtDikf72J0NMJM3jbFPJlRLLtkM1dM5MBAAsrvHqKTfGaXAQ0k7uTVTlfkWgsrJv1K6p9wuVQAQBjj5hf93/nHXz/K18tXVJcFXw8EDE6VDVELpwyryQtLyPp6o3rqjJNIc7NSUu6e/p7104f//U8XPihJQT+jjpfDIzxRk1nNQAK/25dWSLIyXQhwg/saYQsLCwsLA5cdkpgfT9jKQb17kguuefd09durn4pFIllAoDbaa/p1Dbr3stPGzZ+zaYq/dtXr8fye8+HBChZDjmLCd65KqS5jnl+2eQZ/9cn541lvnOjGhtWFdG9oIQJSiFRgWRFXp0s01v7pzmnL2iM8UiMfxjUI3PCmr5UFazmmq5pt73LHW8Ho1Qe0SHVUFPTcc9O2D8gP635rbmuLuADEDG4SHUocr5EiLfMF4k0RnX0zk3BB5NXGp8/cvzn5z7ww+aNlf4X/WHj0Hp/7AQI5OblZGzmpvYMVaT5p17zDr567dJEn8d9no5ZDthVia2vDpsxw/jbdV0ORRx9eCEWrPUm2mwLCwsLC4tdgu7oihOmLcCxw/rgigfeP33hquIX6xuDmQCQ5nGVD+zV/rqJr1w/bvWmKv2Qow7Gb8V10EzupoS0CzHWZlaN//gVjRH7V9f3HvRTWeCT32uC9wQZH9/Bo5Y1mDyVUQK7LFW1TVLv1E2998KaxvNSVJodIrR7uUmebCTqd15q/+bh1YEJoVCg1+EZ8rIvN9WLbtmpW9k4d3M1hBDkvHe+z7ps/I8pRfeM+8v2dMlMRszken6So0aixKdznhbSjFSXIpFNDUGcP6YH3v9uJVRVmn9E/4JLs1Od0wggGgLawWF4ivLad61Ly+5giasdZOiAApwwrL1BKW38p3WrG2OlUFVdknb48rSwsLCwsNin2KEYzISpC3HypU/h6KMGDK6q838UCEXbAoDdpqxsk5N+5bR3b5u9aFWJkNM8sEmUCCA7ZDA51S6ZP5V6X23QWUm/NMdnv1QGPt0Y0tvZZVraPcUxpzgYO1HnqHfLVK+LxBSFkIVRQU6EaU7IdNpW1ensLsYFJUI0pCrSE26JOhXBoh0c9FVBSOTmob1abDz61Ylo374Tgo21Y4IGHkm1Ke9u9EVe+f2qHcjRqg2ACyFRQjIAQRWJ1lFCzPZpbgghkD76TRzRryCntDb0QiTGzgAAj9v+7aE9c64urw1XfP7wPx/jv86gi7/G3EYb+ni0dznIRX9XaFSV8HJ5RFxf/bE1GtPCwsLCYv/kH10EqzZU4NPJc3HVRWMOqvOG3moWVylJzpKcDM8VZdUNv11y73uCeZIRMblkcJFKAJqZ5PB+vdl70zJfbLQhMGaFL/psadRsC0qhCxSuDMROsSny/OMK004bmJk8q63H5SSKcpIkS1BUdUCA4TpFkqo9NuWzApd6p4tpr8WioYdePqbv0zcN672VuAKAroUFsLFYppfJD+lU0VKS3D/npnl2qBO6ZiXD5JzVRWK1hJBozOQ5msnl1TV+/FHaAO+PV6IxpFdnpTiv97jUCYQQBCPGCcs3eZ/Oz3Iln/fwz4k+j/s8bdNUYMI6OJS/v+QIAXJS7aieU5loky0sLCwsLHaZf8zBeunDqcjN9BTMXrzh6UZ/uBsQz7nq36Pdbe8/dunsaXNWIrdjG1BA8mlGfsTkgQIbDX29seahpY2R6wIGUxsNs8il0CJGAIkSyJSYeXbl4SFZ7hn90pMXJavqbbHi6qxGkw9KpnScXaIfC8HTIVDuUWiJT2faC4cXQbYnk+NmzJV+9RqpYcOwK5wHa2Nmejs7LXE5VJNQyS4H9TRi6otYY1WYNPodQojYwxNnivtOGva37eydm4pFFV7RENX8qXZbTGMsTzN5PSGIrKkLoGtmMm5+aVaty6HcMXtZVXaVN3ZYtTdyuk2RSi89rtu9ea//YTx51SGJPp/7LL06pOJzvI8k52MI+7efgyWa/ouZvMxV5EF4c6KttrCwsLCw2DX+VmBdcd/7aJuX7pj069J76huDRwgh4HSokXb5GXe9/9ilX7z80VSktctDlDHJRmm+U5YifXLzfK8sWXXpwobQdUHGVUkmMAiBzxSgEgUlEB5V/mlsu9TlNTHjzFWhUGxT0Oi3NqgNtMvkjTeHFN09pbQeI+MTOOPNxZvQPUlRrpu1+ciAYQ41udRNp7QTlxUnGK9hDmSSJOXqVfW+aSd3a1u12R99yBvmD6/VbLOdyVnffzR/3c1tcrIiO9IZ/fPTsL4+KOojWowS1DtkKVeRaBWAyMIKL/rlpmDEDd+u61SQcrXOfJ81BLSiirrINe9NXrt84hOT/vfNzM04aWj7RJ/TfZJ4PpUO8g9BaYkCKoWvbwcPZifaaAsLCwsLi13kLwXWc+//iJsvvB5HXXTp+bUNgQsY45BliWWmJT/94HUnfXj0YT2Q1LsIcyp8UrZLLSj0OML+WKx+dsmmNhPK/Lf6mFAliYIQgJD4KwiQaVOK+3gcvnkN4edVSdIrfNET6jWWzLmYlWdX3rpuzoYWcQUAXJIQYMLJZKWzKit5lIk2UZ314lRASLyjKnhtxDA7dUq28TnrNs3532lHvH/eNwv1SoG3Nc5OnLWparaIhH66YtyE+mSngz999jF/2yGdM5Kwpi4AIUQEQJVm8lwBVEEgQinFpgo/OuTftfSM+0+8Maqz8dEYy6r2Rh685PHTVr/y9cpFQoi/nbvQ4h/RJYlWUMISbYeFhYWFhcUus92EGCEEvvxpPs697eaDK2sb79AN004IQUaKe+KQAV1efOOT6UZ63yJoMZ10THX2UWVKDs5Nbfi9NoSNEbNHg8HzCaWglECSJEgShSRRyBJFmIu2f/giZy0J6m0X+6MdfJr5kULJyFyHfFlIoOSZnnl4Zt563Dd7df5dM5d3NcNBVYuE/W8N7/6qT2MXZTnUa92qtFqWCAglYIQkVZrk8lINj+qyrf8l38zFgJyUL2wS/VoTJGdjFOPKhGOySMrsWwvnDnVK18xkRAwGzeQRAVQ5ZCnJbZOVtXUBdMj34OOpN+LTB46eUpDpfkqRqRGOmh1LakIPjRrUJuWet+cn+pzu10iUxNw2qSE3ZcdqnFlYWFhYWOyLbFdgXfvwBxh1eM+kjWW194ajWjsASHbb17XLz7hv/rJNjSdfdBzunVsMj9vR2RszAoTQ3PGrK+44tUNWcnnEuCbEuZtKBLRJZMUXCkopTEKoDkJBKUwQyWTMdc363/94fNTdFengHS6bv2FsZUwbHKX0rFpIny6J8sc3BmM5l05dIrJlfmgoFAy0S3Kc6VSkV92qPCvVaXs2Lcl9QpfstJP6t81Z3LtNFr5aW2VkuGxf2xVpvaCypFFlQF3MOK1H7WJ63lsTd6hjBuSnwaXKsEk0AiAsIHIIgbS61o+zj+6MG1+czQd2y3wz02P/CgSo92vHzFlRe/Gjl5+N179Zlejzus/BGAegQvzDRM+UoJFSVCuy5QW0sLCwsNh/+VOI8KfflmPU6Q9ixMiDTq/1BkcJIWBTFa0wN/3Jz1/4cuWXU55C2DDxzNAu+TIlmemqHJ5c6XuxJmYUBHRm1MTMIk4IJEpASFxcEdJqoYBMSAiE+GVCViRRZfKUvkf0uXnyYcdXgZ4kHI6+Xs6jksmXyYoSCRHphghHbyczrosp9is4qMgIeS9P96Rc2ynd49I4Fx02LYv6pUwc1b+fAICrJi9FkOGbth7noohuHhLSjAIHkVZtdBZSWZb5jnZO54wkrK31w+A8JFOqMiHSf11ZW7ey2ie6Z3tw3kO/hIoKUx6LaOxgf9joWFEfufbCx96Z+vPCyuWJPrH7Gss3NQK4EMGIgXg6+/YFlERJdZt0u+8fk7UsLCwsLCz2Yf50Fzv71tehyFLbRatKvvMHIz0pIcjO8Hxy2qiBl1Y3+CODjh8CiRAHE6JPJ4+9fFql79V53sgJBoAch1IbE/CEubBtEVi0RVgRQiAREk1XpOtUif6abVcq/YGgo1FSnveb4nxB0OLhEEK0LJxxuEzzXVOS0iK60SM5Fh0lSVJSyOSDIASXKU0ZmOF63S5LkYv6d96qPTd8MhWUEoem6a5Xzxtd7zrmbER++mSnOmljfRAyJSRssByJkCgTwqeZHEuX1uLCyyfgpPP6XVlSHXrZ5JBz0p3v3H1e36tXbm7UrxnbPdHnd5/h8Eu/xuwSGf0KzHdNsf06WBAEWR7bN5/e2u/0WWt8xtijO/+rY1pYWFhYWCSKrUKEX/w4D/97+kpSUtlwaSgc6wkAToetsn1B5nPfzVgcOfPcUeib6yH5bnubLmmuuj9qAv+33B871gCBJFHUmzwrLIRNohSExEOChBJsCRdSSASbJV3/ztS0jd6oxutl9aGQwHlEIk05W3HvV+uwoiRLiMnyuQbIMVSW24dttgleSZkaVWxvhWT1bVlVb9QYK4yYf06MbqBOaLbkwzabtm+v/fK3s8I/fkznbNrxGktnv/kt7vt6huv5qQv6y5LklSnJcciSPcWu4MIxRbj3gREY3Dv7U49bnSaEQGNQP/W1b1YP/nZ2KSb9Xpro87vP8PiVAyEmHyMpquzcbphQAJQABGJl5jlTjM0VgUSbbGFhYWFhsctsFSL8fsZSzFq4rldjIHwh4xyUUmSkusd/8uxVi976fDrslMLQeCqlcH5T0nD1xqB2iZ9xKjV5qUDjieeEENBm7xXdEiakBHAQsuAkB2mYaaKwBrhMJ+RSRaYBIsRSGyEGCDbEmEjXOT9VCEAIAs45hCypggtQAjBi66MKVHAuAqbJlCDj1fPqgqlEVv/UwCS3C05FXiVFTHN9UH/s2Ne/i3HTNM5667sVH1+WXTL0qQ0922Wm9eqa6f7l7nGzq+vfPh8ZWTkt2zPZDkWiAyui4oYP566+/MrBPWuihpnpIEpZaWMYMhM4/b5ffB3ykl4KRsxDYzrzlNdFLhvSO3v21zNKtESf4H2FOm8YU+aU2VNdSkEktv0RgoSAy5SsOLR7Km65cECiTbawsLCwsNhlWjxYT7z9Hd5//DKs2lBxTiAULQAAVZHWOGzqWyMufJLbu3fGgpqAsikQPObb0vpnl3ojF/pMRilp5W0iW/KuqERBpbhHKv77uIdCmMz7uY7zqwn90aD0FqdMP8uxSWOLnOroozz2Y5+77tMrM1TpTZtEwxKNi7L4K4FblubaJTrPIdGaXIdyQweXbUy+y3ZiG4/zuB5t8uf1yM38UwPP7VmAnzfXVbVJdl4iKWpNVHF/xpwpr9kczisHv1g1nrvTvivVpfdnVYQmHD+61+PPzlzbBqeOhxCC3PP1LByR77IHDHFhvY7jykPmoZdNWNTIhYDP1FwBzUBehhv9OqdjSK/saS6n8g0ARDU2en154PANFUGsKvYl+hzvE0ycsRmfT9tAfEH9L0u5y5T4XXZpXY5H3ZldW1hYWFhY7HO0eLD+WLIRZ9z0artla8tOYIxDohTJbsdHP73zffGNj12GX6t8sFHSXxA8U6vzXEYASuiWJHYaz7NqDuttGT3Y9HsQEAIwlZzrkOn7LkV+ghKie2T6bYNuRq7vHPcavb25FgDmS5TcwrjI8epsjMbFQBk87BD8sSRFnmmjOLRHkn2mU6bhddVe/FZRj3yXvVAmIn3lptKl64MaP6lPPH/n8LYZ+GhZGSauqlrfJtlxvu6yHWcwzpLs8m/JTPkibLBCkwNBIR1CIQYtqIsdfdLI7HXnjf95hY2KF48u6mDM8NZEA2GD1oZid/bJdK3qnJFUvKEhlK9KNLahPsg6ZSThqJsmG2lJtndCUfNE3eQpoSi77OUbDpm9cG295cUCkJefCt3kKq+OOf5qHVWhle2znOXUmuPZwsLCwmI/hwDAhKkLcPpNr2HYwUU3biqve940GZLdjvKBvTscoxvmyuwxQ9HeaZOn1wVfiwlxGZXolvwoKV7raqtyDFJzcju2Cg9SAiRJ9LlT89PuWOCPGFe3zfhLwz4oacD/Kn0YluY60aubA23AzHSZzDYEQv/XPb9lvfGrynF+52x63W9rrg9p5qlGLHpLnSHmXl+UieN6d9lqnyKe/EMA4KU5G+hmb7jj2vrgtUGdXdeSFyQEAAGZIJaskNMZkScNKEhLK/NHTqoLaU/KXB/f1oHPzjmsVyg7yVHHhajvkJ6El79ciTZZLscrE1Z/Wu2NneCyK/W9OqSOjuhswcf3Dk30eU44970xF4yLDjNW1M/0hY18QrZOcicAUl3KJ7/cP/C8N6aVsWvO6ptoky0sLCwsLHYZGQB+W7Qed1x2rOe7X5eMNU0GSghSk10/vPPIJatf/HAK5oQNeDU2wODiJNKq7MKWEgxoWraMFmz5uVlcUQI7JdWpEvl0cmWj8UArkbQ9zm+b3iyIvm1axPYqpC+r8eIJf1COGCwrRqSuhqS+VqSwB3/dVDnrkiuv8Nl6DBKvXXcxADRXWG+WUmzAaz+v65rqWBo2GGdCUIKmhoDAFLBrJru9a7K5uaK2fsXRXfImfLWm9rLaqLhBM8XYb1aW33DT0G5mIGZ4N9QHecd0NwZeMSmal+F8X5H1UVGdZVR5oyd+/+SHC6YvrsLwfrmJPtcJ5Y/VdaCESOGY8Wf/lAAIJXCo0twO18xgz1/SI9HmWlhYWFhY/CsoAKzcUIENpTWHRGL6AAHApirhnEzPV0df/BQPd+iAT8f0JlHGz2EgmVvVtCL4i9fWAiwuriRKdLtEX7ijKG/hsAz3DhnXtB/RtGx3nRgoioMx0+5wzFEVZa5QbP3KufzZOkP9qW7Imdfw7Hbtvpw+R7rr4+//tG2uU0HE5LNlSrYMK2yWXwSIcDq4LEYf6Z5uT3p45sZGt035UFEUMyzk9msaou08dqVRM7kjZjIQQnBw1wy0y3HNsqvSMs4FAhHj2HvG3ZD547yKRJ/nhJOX6UZhTlKuLFPPtr8TABSJhFJc8sJ+7ZMxdlRRos21sLCwsLD4V9Dp81bjx7dvRWWdb5SmG04CwOlQl3QqzP6jZ5cCbAjFcNmUlW0jJh/desPWoir+M/nzAoASApmSWIpMH7FJ5KU711by4Vmenbf0L3h1eE+8ObIft0vSpG4exyXZTvUKp902A3ZnL9PuerGcq9M+rYw9V2LQ7kIInPTMuy3bplMDKdAikuDRbUuCEQgIQtCg8TEzy0N3rL55FL2oX8G76XbpCwEgommnPTZ5XscMl+o09Hia1WE9s/DiLT/XpyXbplJKEIqaXVcW+/stXOtN9HlOOBsqAthcFXToBt/O/JcCNpluap/tWtetTVKiTbWwsLCwsPjX0Gm/r8S9L36VEQhGj+BcQKIUKcnOqY/f/Ip/QPd2KI/qiHI+kgEdt/VQAdj6feuQYdPvKAHclH7V2648k0tp9Imu+f/C3L/mucM64aa+baplLt4emJl8arIqvyTJSshUbB0Dkv36WtjfGfnOT5nRtAIAwPXjv0cXKWyvDetnRZlo9+eSq3GByAQUQ1JHPfTzyiSzejPTND1NCIGwiSFzqsMfPzh5/nkNEUP9aMEGnDuyE06/azAyU+xTbIoUMhl3hGPmqGnPPYKJv/23a2IZHPC41XaEkD8NESSEwGWX5j12zcC6DtmOXdm9hYWFhYXFPgWdt2wTVm2s6BqOap0AQJGlQEqS8+cRF47BhrQMHJebYouafLRodvEQbCWuml+3DeE152UplNQmETFuWViPXtExe482xi5JePmIrtBMFjqzc9Z9KTb5x3h9Lgqi2jq5nI5cp90OsfInIulh969ecoNG1VsopaSlhDzBljBhE7rJOm+uqj1no2FPFoRkAIAgBGEuddgYErf8XOztuKQ2DADo1T4FRW08y2wqXSEEoOl82HOfvZG2tvS/WzhzxdparCzxoyGgpzAe71whAAEBCECmxExyyD8PvOw7cempvRJtroWFhYWFxb+GTp29Ar5A9DDDZEkAYLMp6wtz01d165iLmqiB9UGtg8nFQAAtYb/m961f0ZLoLprzxOOYbG4O5/PaSHuvUbcNaIdP11ZrGXbldacs1TWNWEtlBjuF+bxjjp9lPr5Ud/8k7M7Lc1Pc7yuU1G9vP0IIUEKEzpFcGsV9i6pDA5LstvdlSo1mQRZjyN3cGD14RU1cQPXtlIY7z32r0WmXfyeEIKqZHZdvauy4ZEPjXjyt+xafTV2P0I9rQQjaA/GwsSIRw6FKVWlu5Y9Ul/xIip3+WJTrxF/l2llYWFhYWOxPyNWzX1JOuPqFgzkX8VCNw7b4hbvOafzk+z/wcUhDjlM9hAmR2yrZqmXjlreklXurVaxNooQRThqKQ1HB5b2nsAgheGFhMSghs/0x/WpJiJEmJQf5dPkebvNwgMqSSmdluu2ncT2SazJ+3fYnHyaQueHNTrJ/16BJx24MaO/nOszJNiqFTY4UQgiYECRqsCN+uHDwR5/3L+XH9ynE8Bt/RFqSbV6dT2O6yVP8YaP/uvLA/L18bvcZflpYjaG3D0eoMbgx2SH/4HEqS+yqtMBtl1ce1CWt6uIxHYN1fl20L0xLtKkWFhYWFha7Bfrq/37OMQzWU4h4/pXLYZvfadRtAu0K8N3YAQjpbBATYhv1IbAljiaa3v45XEg5X5Ut07t1VY1e3L3tXm3YjQPaocQXMd4Z1eurI23ha2Bok2RZoTabfUW+x/VIpst28WeNrkUNUWM4E7D/hb6CIZCuBby1bTz21wwq55ZEcFHE4J5mdSmEgMZYv4d+WZ22ui4IAOhckIwUt7pClWkD4wK6yQcuf+94MmdF7V7tg32FFIeEm4/riOF9sl86e1ibk79/ZtTdXz1yxNcf3D987fVn9Qm4PW5LXFlYWFhYHFDI5TXe9jHdyBEAFFkKp6e61zjsCpbUBnHH9FVJqxujPXdkRwICzSJLiLh3i5msVA6H6j12OzrY5R3ZzW7l2SO7oe7DKUJwrlCbuybLpd5AgR9T7Oq6QE0Nzrf50kp16cgWy7fJvyIABJXhN5XD2kr8YYVSf4zDAwKQ5kYCMLho743oHWMmrweAbm09ICCVq0v8ZeEYy4pqrNsXv5YmaQb7TyZiTXntJEx5DQCgAcA1ZybaIgsLCwsLiz2L3OALd9IN5iYAZFmqTU12FqcmO+HTTQDIZkK0FWSLcIr/t8V70xJaaxImQjTlYIFAISS1bUqSTVYVPVEN/OC8kQAQAfBa82crV63Ewb/W4IQOKYUCcvb2w4PNEIBK7aKxWBsBwgCBLQVJ4zAuPBGDdS/2ReYCwMCuGTisZ1bguznl6wgwIKaxvEXrvGmA+E8KLAsLCwsLi/8a1BcId+AsXptIlmhFUftcb5d2OdBMDpWSDgLYagZlsZW4Qsvgu23fE0DYFOmn07udHXQrezHDfQd4fUUDbjq0Q/dGLr2tc+SRf9BXBmhGzGSDCWDb3iqMC4R0s/PUJWWoCkQR0UyQ3m8xRaYbCCEwGE+r9kazy+siiW66hYWFhYWFxV6Aci66cNGS4F570wWjYi6HDekSR76d2iTBxVYpVxAtQir+KiBEfIEQTcPvAcJFJTXMz25f9AFGFmbuim17hGkrNuGV00/G2obw4Aix9QalWyvDbSAAOKG2QMyQCMGfPFCEEAgAOuMdxItn0R/WVePog/Jx+NBCeFxKpUQJGIeLUrQJRsxEN9/CwsLCwsJiL0BNxguavVEx3SgmpId54oj+eG50f7RLstUJxspEKxElhIBoEllblmZvVrPQAkzGssIxbcTH5V68tGxzotvZwtT1Vbjvm4lZISFdyQE1Hs38h9IAhKBBFyN0k293dmohBAzGs6dvqrMXJMcLZdoUiqjGSkCgM8ZptTeWsqHCihBaWFhYWFj8F6CAyATi8wXmZ6dqyC5CbmYKhBCkV5anzkZRjNbiqtmb1ey9atpRXHhteQ8qKQaVzj8323XQZSmcPLlofaLbimv/Nw0TikNYXBc+P2KKXv8orJohFEyy5TIhlL+q08QFUpdW+WwravwAgB7tU9ApP0mzK5IQANKTbe1WrrOmzLGwsLCwsPgvINc3huLvBMA4b4TbgfUrg9jQEJJzk5xhwzTXQ5aObhFPHBAEEKTJi8Xjc/Y1CzDOOQihEAQwZHlQrSHeuaNMO0kTYrturJfXViICQqOGfhDhvFiRpFpq6Lijb6fd3tiOKSrWnh0ko99ztecCMlqNBGzug+2xI16uoGaQ6ZvqWkqx+oI6VEVqMEweAmCr92tScqodlg/LwsLCwsLiwIe6nfYsAOBCYOX6ioq2bXNgcg6Tc1kTxEM4XwwuROs8K7TyZjWLKiFEXGxxAd60gBBQRekdArlqNNHowwvWbXXwO/9YjUWffEF8utE3SOX36zlebYzEUhqY2KXG/B1H3/sSfq6I4tS3yWG6yU7c3ft32+SM0V1y0kcX5QAANlQEsbLYFzAZjwkhUNMYQ166Nc+ehYWFhYXFfwHZ6VCTG3yARAk8yU7ouonm+eKYANJscn3UFIxzIQvaWlg151yRrfOzWn4mTSUbCLgsnzkhIn2ytM67+P3lG4lMCSljhHtkyY2xJ14VBq6mhLSDLLc3GDuSclF284INI1SCtU/4yITn0gRu7vfvPFp5HTpB4lpGGXPca0DarTNOCwAypTa3TVZpk6Orc5skCA6sKw8iojEYJoeq0EScYwsLCwsLC4u9TEv1Ty4EwhGtKcS3JRyWaldsNWFOjCYPFWiTsNoqVEjiHivw+EaENr0nIJSAyHIbrtpeGZYuXbtGF64Q5xcKQPIKkqVJ0ggQaotvT+waoY9QRcrihKRHDGPtPUlsebWODf+mkWtr/SjK8mD021Nu0iCP2t3+MQKAc2FoJjebBZbXr4NDwNwD3jgLCwsLCwuLfRs5FIk1EoJUALDbFFt1vR9yXCUwg/PIZm9gapuMjJtqItpJYc6P5Lx5ShwKwUlcYBE0eaywJVSIZrklQAmBpKqHBUz6XVRQm5DldEIEgoSACoAI3soiuRtDU+UEKrcTktRRY2yXBRbnxTjpjRm4/cvp3ddGlBNDGmsJcf7lxMK7MN9wQDPrpm2obWjeZcxgkCWqMs4lAgJVpQiEE1Zv1cLCwsLCwmIvIsc0owFAqkQJitrndFj+23JIhECmxASB/vzxh/iv/37+y1SI9UR1DBaUqoKIFo8VIRQcgGjyWG2p8k5ABQUEh6AElBAQRc1jTdPMCAEQAXAittIzLSFICCgCDbIibUrdxYmin50yD2/P8qqyTM5Y6jVujBLSo/WciVvRamrFXRFYSTaZD8j3MCGATwAM6JIOu0pzpy6o9oRiDNmpdqwp8SfqPFtY7FW4ECAA1TfOInzRNErTC9zm8mlElKwmUr/RqUILOHjVOghfHRCNQio6JIt4Mj0wNfDGSoCzLTsjACAA1QnqyQEIBa9aX80r1wTgTCIkNRs0pzOIbI+YS35spO16ELn7kYxXbwiTg47hapcjBWka+0x2dOSwhYWFxb9EzkhNQnm1F1wIVNX6ZKS40THdjdW1AQBIBtDATRMCwhRcCHAR91qBQxAKzjko4rlFvFX5hvj3GAdA43P6EYASAISAkLiaaX5tPRFg83Q8AgQxw6AbG+rdqqLi+PFfY9IFY3eqcckuJyg4SUtLpyyGVbpmdjcYt4tWhUVJ0wjIZkP+xddvQ89sj2Y25a9tqAhClgjVTU4pgPRkmxnya4k5yxYWu5GmNAKiL/hCYmvnOxFs9IhQYxp0LUNE/BnEntQmcvvByUR15ghTT0c0qHBXSoHQQjJ0DWzp1DSAOGDEABYvvss3LXZAkm2AaBJX24TWm74jmLQ2/rOpR0CIhliUoLYcvLEOECICQ28UJWtgVJcZCPvKsXKmyWyugAg3lpHUvGjo7kOKaWa7kIgFKog7zQt3aoDmF4WUYReaQgtzOSk70d1rYWGxj9KkFQgA2vTKAfC/enCTOefVADoJAUiS1EZs/B+dv3wzT8/P5EyIIAGkPJfNbIxq1QaE3+QiSzTVv+Jki9uHouUREZwLUApwDgAcRMRzsUAAQShoa2NanF6iRZyhKdTIBHI0Ij8baPRd/azHsTbvi5/Fm6eN2OHOuOzwngCg3f7j8vHdc2yf/V7qLa6PaLcYTLQM5xNCIN2p1huMi4DGMkXzXIM7ASEEikRqj+mSE3t97kYAQFVDBPmZzizGhAICeAP65r7dM7BkTiIuCwuLnaf5y8RYN1Ni8ycn88bqXBHwtok8OLKjiIXbgZntwc18cJYFIVLBTDsRwi5ELYk/JPlb9iOMGgBNj1GRYMsxmkugCEMDDG373uPWnxla82duAuKGYBCcNX+eRoACEQsDsTAA9CdBL0QwXn9OxDYAgOCRoAkgIurKfJBVH1/9e7n560elxOYsDT86cj3srhLiTq0gBV29tjG3GUILcsmenOjTYWFhkQCEEAg83hNy0VHu4KtHDxBacBiRlJ4gkhuC10G2LQ6+M3aqevD563jDZsMx/KaWbWVVUSqavTiRmJb546zlalWdL3Z4bgaEEJQQopzUo51G9djG99bXT6tn7Oy4oyqeyM5bpFUTrUJ+hMSNo5SACAJBAEKbJMzfuOpbFzVVbPbhnIlv7zZsP2TY6YuX/jBv07jRA3eqg546phdunbw0NiAv5bF1DcGK4sbI8zrj9riNBBIlUz1gc4OcPSeotFND/YSI55hRQjaRO7/i5XeOwen+KLqf/y2y0xxthBBUliSWk2b3KTLBkm2211fMBISQRX1lujD03T7MkPzDB2KHN2z5mEBWosqws3zmwu+FetBxu9vkHcZYOBVy/6OIPvMzDwzN2dKcrWzf0WKyf9sbO8nfHJNQThRbAwBTHXza3u6yv4XrYRDFSbRpbzr4xsX54YdHd4Jp9IcW6SUMvQuYUQDT8IBzFaI5w7KVNxjbRNib/sZbHli2ftmmx8iWXzS/tt7ZVnkErTf88+PQdntfCEAwCICAMwUgHhB4oMfaAuhDCIEINQKUMlApJKhUjZIVJdH5360GpYvCTx67kuZ0LJEHnezTZ39gui55L9Gnayv03z4AADsQz6e12McRiIdwZLUBghvqoWf9aRVz4wKYiyeD5nRKBmdu7L4vqD0JA9AAgKlDz0u0Lf+ayOT7YRb/QWla26Hmuul3CCNyGAgNQnXVENUpRCzQVjD9JDTiDu3nZ74inrwnGu/MLEu+Zw0kVzpkQrCOUgLGBBjjbeYu2+ghBLF4NI+YBHB2zEwJdXlhavSi/rmrqSmEEIJwzkEJBQhvSmZv1gZxjxVEXEQ1i7f4e4BwAkG2FljNb7fMbbi1yJJt9s5MkjvXx6KhiW0G3H35pN/x1vGH7VRHPTOmD+6duiJa6HF+UxGIXacz3h2Ihy3dqjJr46rVi5GWF6Oqw7mzJ4EQCLtM1x7ZKRMFHieimonaiV9AK7qyAxcCkkTClJCy1CT1T9sacyYBnOfydSs/EZFQLkCah2LG+2LL3Qp/+/dF/vnhf3sf7JzAIiAQMmzqN6KP+2Zz6gc721W7ldjHT4BO/Qy8ev29gBgLiO1M9kiabvBbz0T+585rnYS3o/2xvfVaK4I/7YsCpBqEnAWgNKGd10Tkw5tBUrMlUbYxN/LU6b2hx4aKaPhg6LEimFomOFObB4X8uTua/o7JfvDN3yL2EP+iaU5LaBFz8cdGwbgEZnoAeKBFikDISBAqQCUfa6wuZ5sXryCq/bfwsyf+QTPbrref92KIN5QIKaNdQptn/PwOAAwB8DKAXUtatdi7KHZD6jDgShELzfyrVWyn3Eujr13wkKgvPXH732/7FBTx77WzAVQl2ph/S2j8OVD6nkoiH553htDDLwK0lnry/o+mtJmsDrywTu40VGi/v2kz10zpxP0V5/BA1YVECwxQep94bfjN4xdoKyZBTkl2bqqoaTQY44qmm1nFFfXZnIuapi/MKIBUAeDy/tlwSHjTS/hAKskuQUiGIUQ7ZiKZSLxp1GDcmxUXWDQuqGhTFJA0L80eLAAtr3Faf4lzviVUyHl8G1W1Ff2veqb0h5rEdrSTWpOdZIdTkRtmlTSsA9AdAFSJLkp2qDPzMlLbVQuq7EqOu0xp0KXKa9umxLXZBz9txFczn7G9+OWadlwAskQaslLtNdvbVvjqAM4VXlfZToSD+Vvy0Vqts9WP27+Vka3W23IzEX+18j/tkWz/IwGA2NRsEasFb6jYldOw2+BVm8GrNgGE5ABot337yV9pxe38/PcCdof45yRqOwBl7/fWFmJTXwdxeWS2ak47Ub55CFs2exj02KEwjbZgpk3wLRq/OYS3XY/zPq+qdoZWAmzrUTcQghFwlgpTTyWxYC9B6JmQ5EZWX7468vDw36Dap0TevXKJ46LXG1nlciHn997r1nNvBQC4AHSCJbD2fQRA7C4m9GiKiIX+bk0iwr623FvRbj/5g6NoVf5pf8WsXQff/3UBbyw9RsSCLxJH8mLiznqWV68Ks9p1bYx1PxdCCEKTsoSU16vMccSNt0Un3v6TiPrfYMVzn5dye56hz36rUlYkaaVEqQ9Apm6YngZfqFNlbeMyEVcaMQCSRAk9tlM2X/nuC/V8xHmX56W6oyBE3RjQ+gU084kA5/22BApJS4I7IfHQIBHxxPa4wCIgTb7/rZPc0ZTcjhZh1bqgKecCgrOum91pHWy6uUsTGwa99YhRIlEIGwAoEi1zyNIlS9esX5mqiCJIOzw74VaoEi0v9DhKmn8uqw2jrDacZTLRGQAkSjZ3yHPXByPGnzfeojy3uZHFy14056g1jc3EnwIxopWwImjp29axsr/zYoltP/qLsIxo/Y6QpvOX2MKphP7N8Uk8fEWaOvAv+6Clvc3t2kZi/1WYalsE4l4wsiMr7320+V+h+OBT0OadG9PNuZMHi0D9CdC1o6BHC8BM2vxw09Jb+2Yz9j7NIchWf3pNgisNhnY4oqHDIUnXCn/d6sgjI36CO/Vb7efXV/Da4ojjrCf3oplWEeP9CdH8fdO8/B0t94X/+h/j3kOb/SacY+/KN1Z+/yhktVxud9gVZsnciyHEHYTKJiiN55nG/JJZMr+C+8qfT75t4SvBFwbfwoM173Nf+Q1JN8y8Q87NSildW1xVEdWQaTIuB8Oxfgsnz/u6bEMpjjq0h7G+Pig4F2q3vOzYiS++KvDiq9UAwGMRuJ//cco5RTmH+E3aj0tNKfWCgFDaEhZszr9qEVdkyy19uw/FfwoTbhFYOkjHAKftNMi7JLB+3lADj0053BDqYbKkxDx25e0L+hYuv+7j9bCnOdoJmco7cwnHw+gETkVadvfwbnVfr4x7dNaXB+CwSZ10g+VSAthVadXFY66N/Dj3nURfNxb/McLjrgbtN5SY0z5ul3//qNPZit9OgRbpBWa0jKYl23qo9osH5cSxdV9xCJO7YBoHIRo6CMH6awxv5SziSvkk8voFPwlvtZd2PwSOkx9MtNkWFhY7APNVIPjSMNCU/COFEekmZXS8UpvzdrGU19sGQCHO1D+II+UDYUQIhBgqQnVncH/FXaE3j5vpvnLyxODLw7/nwZqxobeOf4O+dPe5DW6nfS0hBJxzRKLawAnfPuLYUFqLVbV+mFyETC4cBt/6W5fanRiW5UJ9IDxHMBbjXICbHIJxcMZb5iNkjG+zCDAWn7+w+X3rJf5563Xj+4vvF9H6qBH26zsXIRRC4JJxkzAg3dY2CukWRiSPU5W+Orlb7lPf/L6IndwxpZ2Q1bNAd9KzLgQogVBlOm3Qa9PZ2B75EELgj1X1qGmM9TFM7pQoRbJTXtL3kmtwzKDdOkOPhcVfEp34JAzfZkI47cW+GfckL1v3o6gpflyEfAcLU7fHS6n8/WATix2AbMk1heAQWjRFBOqPF3Ul43nJ8u9hd9yESDgv8vI5iP76VqKttbCw+AdY7Vp47l1PRSx4NIhUSlLa/EScafFfEgJIyhrfrbPG0ZTCt2lau9tBlY1gZrYwYh2Dr4wwiT35cwieI0x9CLX1vsRMdjvmSU1zvERieq9pc1a2X7SyGEIAXIgQAFdDWMOa2q0LZXLTgKFrgptMxEUVB2cCwuQQBocwGYS5tVhijDUtrd+zbT6PL5w3CTUmAC7gkOkbPfIy52UkJ+1wZ53zyuc488VP7TXexn7L/eazASGPBiGggHJW7wJjY0BHjYZhuuLsCUqbXWg7jExJhV2iv3XJdIMQgrcnrcOXDw5TdYMPY1xAkYk3Ncm2uE9Ha3CPxZ4nNvUN+EcComxdYeyxc+5mK377TtSW3Sa0aBfBGImH6K1wwx6hldgSpqGIaPAQUbnuWbb8l4m8oeR8sWmRJ/zCKeBsl1JILSws9gIiVA9jxSQXqNyNSOpGtf+ZDSLYlEIdH3XXNuObu4+nGe2PExHvhQAvBJWCxJlaSzM6QsrpXgJJMYW/olA++rAecDvtcxRFDphMT45qRvb6kpoBtQ2BVTyeBKQRCKQ5FdVgvGWul8e++w1JwnD+UGtcwiA5CBNNFdrjZQta8q/i1UVbEtubn5jjoUKyVS4MQVNYEFsS3gWP79NGsDlNUd9aWeMz3xjZa4c7q0qjgEBbw+Yez4m9F6gECIGQbsqXTlhMeuZlQCXieyMi3m40+BUmqLrj+cwEDkWeO7xD5uZ19fFExbmr6zB/TX1BKGr0BQCXXV7fr3PaJs1kGJ/oK8figEUIgfCjx4Gtm++UDhlxKlu/6BbEIr0EZ0156pag2ps097cwDQLTOIjo0XF8/bwziSf7KXPxxNmx754y7MfdnmgzLSwstkFoQcDUCISQIClMbnOQQKsInghUj9SXThgJwQSMKACEiSPlLepMnQ/FDsh2BoALLQQ6ZEAXHNSz/dokp30dAJgmow2+0NF/fHaf9OP3v0OmEIQgokpSitKqRNSsCj9+rQ4fqRHl2GZBJLiA4M2ep3hojzHeFDpk4GbzewFuipafudm0rsni4cXmUKPJwVn8M0PTKKuvco1bsAlfT/tlhztLTc+BPTN/vdOT+ogkK0E0CUCPXVk/YUUZG1rgVqvr6w+OhfwdGTPlHX2wF0JAIoSl2OWJby8o1h8Z2QMAsHyTD7WNscGawQspIbCr0q9Xn/yKr3cHy4NlsWfQl3zXfEPvyjcsfkPUlb8pIsHegjd5rCxxlTBaPFrMVEQ0NFo0lH9l/Pjqo7x4SVbotl6ILv4s0SZaWFi0giZlQ+l5fBTcLAfTC7Tf30yiKblbVlAcC4nNfR8EfhfMJMSRMlcpOupREBpjVSvBKpd5wE2Fprbx0ZOPPgi3XTLGm+x2/EKbktM13Rx+7cMfdl69sRIKpZAIDTIubACk9fUBAIBpcyMspKggNCA4R3yJh/Oal2ZxxU3WIqLiAorFl61+z5pEFt/y2mo73RRtN4XMT09IE9eu9hkpgteQBYsX/2Nn/XjhYPTNSeKHF6R8Z5fI70DcU+ZWZN/gXCfmldYPaRD2jwNK8hghq3RnbkV2ha4sTHH+fFhhGgghePJ/S3HnOT3UxpB2rMk4VWQSTnYrU46/8ySMGJC7E3u2sNgxQo8eC7Z2nhy6c+iporr0G4QD5wnTtLf2FlsknrhHX0DosTTRUH4Lr1z/Kcnrcoh2yRmITdp7ow0tLCz+HiE4Gi5IMYjNPU+YWgdz48weLfnZhIAo9kXG8nkP07TCu4hibxCxwKFmybwR2pxxCH/4C0SwZhiEiEF1zaNF7XMx9NxHkeSyT1JkyQcAkahWsKG09uj33pmMWKMfqkQNRaJQKE1pnubm/KIM/HBZ9+lumNObi4LGSymIJqHFm4RWK08WY+BNuVZxD9eWvKstHqxWS7MnzOTggkJTk3o2Su7nfq2OfTfmlVnPvLGo/CD0vQB/bCj/y8465YlxqFw4U5q/dHk/Q9fatZrsOfBSLyi1Yf14Q7anEEkC2cH8KyEEJEqQ4bR9/fj0tZXpzngB0cXrvfjmt9IeUY0dAQG4HfKqPh1Tl/Tvkpboa8biACRwfXcQxe5ii3+5RzTWvSO0SBGE2LVaIxZ7nmZvFucUEf9wUbX+Y2XsiNMFFTT84r5V1d/C4r+KrdcJsB16GKA6J4CzAG8su8J1yQS1dd6qsQBwXzF5NnFlvgfOnCJcf4/a99SCpGvP6SWM6MVEdf6qdB+9nALAsIO74vD+nZcmu+2LAMBkHMFw9My77zwn9Z0vZ0LnHCYXtQbnTgDSpoYQzju0B4a9sZabmv4zYZwL1pQvxeNFQlsqsTeNJmwWXMwULa/MbA4Vbvmctxo5yFqJNMZYfF+STdHsKYdHbSmncNWB7qePgUPdft3GAfe/A2FP6luiZDzZKLu/0iEVIR7ai3hs0rq7F4cuL4/RyzmVWwoq7ihuVS7pnO7+/I4jivB/w7riy18349MHPkVFXeREzWBZkkSQ4lYn3XXul96xQ9sm+pqxOMCIvHQR5N5HZQtv7SvCW3OXMPXknb2GLRJDfMShgNCi7UVj1et81e83y/3H2GKf351o0ywsLABIeT2RdNWPq2hyzjihh0+JfHntjTQpazFxZ75PXBm/sQAQfu80JmV2fIUk57wAxTkXVBrCKpc/AcFtJDn3BX3eB1EKAHnZqXju/R+DWWnJXymyJADAH4wOWLa29Ohvf1mM+sp6qBLVJEop4yKNNXl6uiZJaJesznZSMg+txFRzHtaWV9Fq4S0jCJu9WFsWviVsyMSWsGKrvK540jvgstuX9mqTvezYXh3RpzB7+72Ulgckpx9putNvEXZ3dqtifEZFdfW5Ndz+MLe5HM1feDtCcxJ/mlMdf/+IbmuO7xYP/c1cUoXbXru4QyRmnsW4gE2WKjJT7N+c+eAI9OloebAsdh/BOw4DbyjJYit+e1E01l4oOFesQoT7GU0FTIVppImazQ+Zsz+7heQX2WJf3pdoyyws/vO4znwLka9vEnKXES8TV/rXIlR3H/dXDJE7DnnWdda4/2V+NwHuSydAn/dxiXrQuXfS5NyvWNXKm0QsOJDI9puTrvpxjnrQOfEJBK8680gMH9QNWenJ36qqvBwADJPZGvzhy+656oTkOQvWgMXFU5XBhBIzmLS8yoeTu+fhj+rw+vZu6RKbMDeL5tLrHPGFxV85axJbbIvwEs3iim8toFpqaLEmMcVEy37AEd9eCBiRYNEfK9Ye99RxA8ikecu320mdslKR4kn5TZJVb3xoYvzp0WDcUy/sFzCbO7VFXO2M98omL810qm9f++0ScXjbDMxbXYuXbrwXJTWhs8Oa2YUSICVJ+ent2w5bNbR39g7v18Linwi/dCHk3iOyRDj8EsKBMwQzmzwiibbMYqdpDhkaMYdoqLjXnP351ejah4QeG5Foyyws/vO4TnkBvG6dVy7odx1xpj0rtPDpxpopU0Nvn/BhbMqjdwSeOfg6ueOhT+m/v/Udq1nzJQRPohkdr6B5vT4LvjxcOI68pWWGZvQqaoPxb39fnpWW/IUsSRBCoL4xOGTCtIWjPvthLqbPWgIuhE4JYjaZZtokivQkFxYtXIZwTVkd06Lr0CyemkcUNr2iyfMEzoGtvFnbX8DioUbBtt5PS9gRQAhqUQNxPnzj+MkF360o2apjNpSUIvnKp9GHNqTX19WMZJy7W5eEEISAUGlLEvAOiishBBSJRlPtyjPPz1hXfl6/QgDABz+sx80vP9Khqj5ynmlyqAr1piXb3ht16xR21UlFib5OLA4Qwk+fBqiKw1w87T4EfWc0z5ZgsX9DCIHQY3ZRs+kuNumtsXzxzwg9OTLRZllY/OdxX/gpiDOt0T7shoepJ+8YIqkfCyPWSUS8V4qo704e9p4KgNHUgofk9oeNnnzttK9tA8/nydf/CqDVpIx3XX48Lr/vXbgcti99wchFjf5wh5hm2Eoq668cMqDo59/nrfaOGt4fQsCnMZYrIJwlvnDk9XOPSJq02f+6BnU4gKbJUeNf/Fum4kB8Dq+m92Kbx+3WM8W11L/aTsiu9XxpkCRoxNZ1nT/wbL6N33Lmy1+UPXJ0Z3Q67y08/uP8osM65R81o8Y4L0IdA7gMufV9aFduSc1t8tiVrwe1Sfu6U7obhxSm4/3Ja3HB6C5k1C0/nOcP610IIUhyKJPGDm07d9lG7/5/A9xe6FQICG5CCJ5o6/Z9hNiOc2nn3U2xyS/CNvp6Gr7vqOsQ8F7e4rmyOCBoChdmoLH6ceng4zaIaGAp1yKgNmeiTbOw+E/jPP4xADC1JV8tJHbPYmPld25WtjCZuNLtICQsdxzqMzbMjNqGXI0z8SbQ7ZiWbbea9frkowZg9NA+aw4/+5HXg6HoUybjJBzRhq3aWHHO9PHPvTxqcG/0H9idA2gAkHFkryJt4ozfTaLYJHBJjU/j/GeB1Dy/YGvR1Zptb0FiB/KhCABOJRpUXKfVcH35lKrww92X1TpOOnf4BcWacl3U5uxOZBtA6W7LTHEq0qo0h/LQ7NKGyOvH98ODQuD4O37E9MWVA3wh7XLGBFxO2ds22zXuk2kbja8fGYFHLt3zF8BuobUQaDWxLWmehJpKHJSGCSE+4vFU2PIuB8/4GcCcRFueeLbquy2dRwiJX3+ECFBJA6E+KMp64ko1IDiAjTu0e23OF9C/fAbmvB+OFN6a2wQzFUtcHWA0lXGAHu0sAvWPSj2Gnhf73y2NiTbLwsIijq3vKUA8WSnQtDQxYZvXLWwlsEYP7YPL73sPNkX+5LeodmaDLzTAMJlU3xi66bJ7n5r1v0lzlhx+eC/ojMdMjlCNP5j12upAVY905xu6RgZFGP/bYk87Ipz+apstFeC33FgIACGpCJls5BUd5HeXNZqjvFLS80xS7ZTS5h3865FVQgioEvVluWz3frSkbN3Ecw9FutuGxz9cjJMHt0v+7JeNd0ViZh6lFOnJtk9evvHQud/9XroPehiahMA2p6GVEOCgUgyyHIAs1xFZrgDIRtgdJVBtxcTmKCOSVCl17N5IAdjGXAnc8XmiG7X3+m47l2+LAI2LKAOyHAKVGqDYakDIJiIrm6Gom4kruRyElBFPeoN8yAk+6Brw9K87dGRj2niQ7MJsUbbuPqFFM/a1q8piN9H0AEoi/tG8ZPmlwTt+eDo2/U3Yh1+RaMssLCx2AXnbD447og8uvefdiv7d2z4XisTe0XTTHgzH2q/eVHnX6cccfPEb700OnX320YAgfhBhe+/Mw9J63Tj+p7NG93qx3MQTnFDsSgjkr7xbWwmqbQVLk7NAh3TI+og0CXbFw2TFHg9JNgmr3SCuZEqNFLvyxFl9Cia28TgwpmsuPp22HmcedRrOuO/pC+p8seOEAJJdyrr2uUkvX/P878aH9xyxN87fdgxu3ftiSzc1jTIjlArIkgkiBUBJLRS1Gqq9HJRuACEbiCupgiSnVpOU9Aa5z9CgcuhYXcQaheRoPRLya+C8RxLTvr3Sf9u/DgmhACUmCA1Bkhohq7WQlXKiqJsBrIfdVUYcjgriyaynnfsHpL7DI3JWFwFAbH3tjtthc6Kf3w/7aQ+Q8J3DroEWHdJkTKJ7yWIP0VT1ncJbeXnSC6dOMn/7dE2ibbKwsNg1/iSwTjiyP659+APkZqZMqPeFRtZ5QxdwLlBd5z/p21+WzJz67m2vvv/Nb6LfoJ6CcVGXYlfS69+9KunpH+dP8Bn6uQFT9GwRS1vlPcWTzP/Oi7XDHp9WuyBCQMiqHCC0HxhBSyWG3XATaiooKpyK9GqXDPfL362pZq+f1B9zV1bj5lfm4IJHnxu4psR3q24wRVVlozDb9eJrN3+y9ptZt+LDPXziturHViE9tAgByQSlIaKofhBSAUkuJYqyGQ5XKXG4SqGqZURVa6XuBwflI8+KSa7M7QiBF/dwKxLFNt6o1tNitnjy5Bhk2Q8q1YCQEmKzlUF1lECSNoLSEuJJrydZbXzywDFhpetQLgBBd7PwEUIgdMsghNct6Sv83osE55a2+q9gxDoh2HCV655fbood/AK3H3NToi2ysLDYSeTtffjKvefjyAufiBbmpj8ZjRmDguFYV90wlYqaxjtPveGVVV99M/uX3yc+jMyCbM4FfOW+cMETJx9adfp7v4wPQ3qKCZCWG3Xzzb/pPdleRtRf3TT+yREm4hsTCEBqaspuCAnGdxOvd5XhtH1xUH7KYxGDRV4/qT8A4P0f1mLEQfl5vy6qfCwUNQopJchOdUw8sn/ehz3HX4yThrTbTadHtLy09koR0jSJNqUchEYgyz5IUi1VbRUgZANUWzFktZi4PZVSRk4dkj0NytCTI3L7g7Yjoj4CcMNusncfo1VSWfPbeEiPxj15lOog1A9ZrodqqwElmwilG6Hai4nbUwFnchVJyWiQuvQNqoPPNRnbJCSpwzYPAntumhPtm6dgv/ZFRXvzjuthaAWJ7k6LvUNTtXcg5Dst+uZF70GPLUm0Tbud7Q7+sLA4sJD/6hfnnnAYLr7qxdXHnTz4sXXF1a/HNMMViel5m8rrnr7iolFnX37/+2uXT3wEK2v8hkxJ+fqGcP6x3Qu++WFDw9DKsHE8bx5C3uxZaWZ72mdn/tK2u6/WrrJdF1etvUISJUh1qF+0T3VeX+yL1L118gAAwOMfLkRBpsv98bQNDzSG9BFCAEkuZVWn/OQHpswtC3756K4Or44X6hLNopE0tUWSBJEkDZQGQEg1UdVqKGopZHUTcblLAWwmTnc1zcj2KkNOjvDGKt0+9Ozt7P+xXe6XfZV43TWOLW7LJkhcdhMqAVQyiCSHQUk9JLkaklxK7I4SOFwlIHQTJKmcZuY1SF0PCqpHXhwTIa+gSenbOdp5e719bO0C8NI1B4uQ73hhTYHz30OP5PLqTSeHH5i5RJ/7BdRBB8h0Ok0PwYTQ/264WwiAyk0Pe1KirbHYQ/ylwLp47FDc++JX6N+97WcvfTStf2llw42GydDoD/dfsqbsuT5FbS4cddkzdVPG3YaFFV4jZrLKgR1ycwSht361ssrh08VRLc6kbf+GdvXRZY8VqxYQgkCFCU4kcFAjy2X7tHeO5/agZtY0i6u73vgd7XNc8kdTN9xQ1RC5yGQcLpvia5PlvveV1+euXDr5Anz56E4eWpIBMEBWdKLaG6GoXlBaDkqLqWovgcNZApu9hLg9VcRmq5W69QvZx1yjmZVrhJLfbZudvbQnOmefhdgcoOmF4DUbTUhSDJJUB0mpASXFRLWVQlY2E7uzhCSnV0GSqmhmrk8+8uwo9BhXOg7czh4vSXSTWohNfAa/nHgrht4+5BTo0fR/v0eL/YlmLxbRI6ckvXfNG+bKX6oSbdNuxoQ75XXiTl0Nwf97CkMAsDk58WQtFzZHoq2x2EPIf/fLh284Bbc//Zk+7OCiJ36ctbxTdb3/OC4Eahr8oxVZeu7YYb1v6tbho/oB+WlYVxfQuUDF8b3aeir94Zd+LfX1ipjI3jpG2MQ+9tAiQADBRI6drA4SNUdVpLey3LZHZxbXh6ZdMhQA8Om0dThhcHv5osd+vrq8NnSHZnBZUWS9bY77uffvGj5xYPcs9OmcsdPHltoUAbpeK7z1F0JSAiQ1o45m5fmUI06MQtO40nHQdra6NiH9xE0d4IzA1CShxxgghJSS++93vIvIB4+C0v8YxL56+nnicLxJHK4qmtexkXbrH+I1xabjuO3lrTyx9/stFgSxuYk29U2HqC5zEmeSX5i64Tjzr6dFYWvmYdjTZxXy4pXHxnOvtnUFW/wniIU7i4o1g0Q0+E2iTdltxL1WDEHvRBH0/ux+YV2iLUogE/79Liz2WeR/WuGQvp3wzbSFNX2KCm81WXFerTfQn3NBqup850yftxbHDu19090vfFXfJTMZSyobWWOM+c7p335+Y3TdDwtrIhfqfB/xArfKzRICADMAwQBJAYSAm0dXZSSlvasKtXZou4wvq0Ox2GsnxnOuvvhlHY49tK1844szr95c6X9U05lbliUUZrk/PLh71nO3vDaHvXbzkF0yy3HqrQAQAjBz69/cn7Cu0uZNBCQqsaWzk7i3Jk0E/dki5MsP3TS8LWFmF9gd623X3/2c8eX7Cb3jO696FsCzAsCSRNrRTOyn10FcHsVcNM2FSCgDppkvIsGCyF3HFAohOoGzjjANQRT7RUKw4r/bFy9eBeJJHwpD7xT/xBJX/zUIAHCmilh4pOuRuRO1UeOFbeiFiTbLwsJiB/lHgTX26AHwBcJIGXDF2tHD+10W040Pg+FYd8NkZGNZ7Tnf/LIY/boW3nTJPe/W98lNwZLyet7vjs+rHzv/kAeS7XLEp7HzTcbdwE6MEtwDCEIAwUE4h8TNsMsMvQfTWBOl6jFuRdLHdMt786CiToufnLWuYXGVj79yQj8AwP3j5kCVqXzx479cvbHC/2goaropJUhNUj85qCjzzg1lvvC4O4YnrF271BdNiV6sfj3Rp37i5KUbPKKxLh2cFwrGOmjjn2wrdK0QgrcD5zkwDQ8Yc0JwSQgBYlM+MeVNglVvTnRT9io87kki5uZ51Pztaxevq0oV/voMCNEOutbenPJRe6HF2oCZ+eA8G4Kngpl2CEGbZzgAUCngl/7OjRv56E5Ih4yS9ZduGQXGpAPWe7VtorPY5juCtF5129kftlnhQKS5LhbTB8c+uC4TQtQm2iQLC4sd5x8FFgCkJLvw7Hs/4O0vZyw6clD32+av2PxWTX0g3zAYKamoP8cfjMqH9+t056FnPlL86wd3AP+7BmWnLSo5uE36Tcuq/b8EYsbdYZ315UIQYO8Ira2/uAUoZ8IptIVOGL8wZizumEQmPHfxmfons5d82yk3y9W5TU7JitpI7Pnj+orCZDsA4PlPFyIr1el+45vlV1c1RO6J6dwtUQqnTf4kNcl2w/RFZXUzXh2798/ajrS/SURxoxHm7Ml2c9nsJOGtzUAskhe6YVgBBDrD1NsLwygUhp4FbqaBi2QIroDzpj7czk2tefpGSd4HC6nuvn5j9WuJ8fMnNuGtTxXeqgyhRQoidwwvhEBnocfawjTawDSywMwUCJEEziUI3tRnf+4X0jSxb6ue/GsbastgTnq3DUzjcAGx/ZG3+yti6xGdRJI5qOQHpXWQ1XowvZ4kpQO2+PSh0GMQoXoQgWQA2WBGOjhLA2eyELxpZDL2ETf5HsLQ2vK60k4wNEtgWVjsR+yQwAKAWy4ajaVrS9GnqHDy9Y9+dOXMBWtf8PojHU3GSaM/fObvSzYUdGmXc5Pdpix46p0fcPtJ/fHLhhr9nuFPfXXjdzfMrQjErvBG9fM1kxduW519dxOvVi5ABBdUsLANrCxFYl90TpLGPfbC9LK62S+Q+sagc319MKd/UUe/x2Gv8IY03j/PDRcl+HzaGsxcWoEGfzT7hz+K76vxRi/TDK5IlMLlkD/JSnXeEAzr+4S44kYQRHYTbdo42Vwxzy18DalgvCB484gCGHp7GEY7IkQHYWi5YCwDzEwC5zYIEZ8VcjvDpUmTkmp9fsR23u3PaJWzIOcOoMaU8QpbPd+NSDADQhSG7zo6H1qsnTCN9jC0AgjRBsxMB2dJ4FyG4ATAXxTFxQ6LqL+DV2wEsbt6wTQOjNIM8R5ritITEFkNQ7WvhGKbSdwpC4kzeZ2gtFLqdFCYhSui6jE3QU7Kj/eF5oc2621QXbLxshUuxCKZIhbqLAL1fYihDYWpHwRTTxZCHLhCi7FkmEY/XrH290SbYmFhsePssMACgD5FhViwcjMO6tH+uxEXPVUtBHnLH4r0Y5yjvjE0WNMrPj36kmfvdDls39zw+CfGkZ2yAQBdMu4uP7dvm/tf+n3j/xqi+gWayc/SGW/L+Jab1M6KrT9P+dLyXAxAQBXmZiePvmYT5pz2bmlD/3S1ru8hQ3DRyMNTq+v9sgBMWaZVXTPv0tfWPYaizGQAwIxFpRjWvxDnPvB9nyXrap9sDOmjTAaoiiSy05yf5qS5bohqZt2VJ/XFLy/vnZMUn1SZEGPtr5K5YKaTlaxNEYHGTBhGYej/Tu4kIqFCmHpbMLMAppkJIdLAuB2Ctw5NbeketHrqJ9sEWw4M/QRgS0hPn/eNzNctcvPqklThq8uCHmtjPH1nOwPoIrRoARjLBzczIXgKmBkXn//Qb9udVWA3dJ7ZUILAoLZQTx58MJipHAhyQQgBQgmIotbAkTyRpOV8SfM7L7Cf/aTP2DhTqJ2GNa35cdPrs9vtGgBhALVG2eKVckHfidEPbnCKurL+wlt5BomGToWpZzdPyn6gENemHDBivZa/Ugx98SSo/Y5PtFkWFhY7wE4JLAA4qEd7fDVlAR55Y9KCQb07XLBgZfEzjYHwSMY4AqFoR80wx336w7xD+3UrfA5tziovmfsy2uZlAAB//Nc1a9qmOO+eV+4dXxvSTm2MGSdGDNadceFsfTP7py/IeJF4ISQiGCVgFEQnlKhUCC/ATYkQbgee3kDyX192cX9S6o/aYoaZCcHtHNBkiXi7Zibry6v9AF5BUeYrEELgphenY9nGOtfYOyaetbrYe0c4ZnQUILCripaZ6nx55MC2T9Q1RhqeumbwHvkSjy36HFJBT8n47gOV11WniGg0W4QDeYHrhhVAiM5grAN0LT8e0mNp4MwFLuT4xMF/8kP9tRg4cO4/LSE9c+MfkjFrgk0EfGki2JiNWKQgfNvwNtBi7SBEB3DeFoaeEQ/pcdefxGeTl6XlbXO/tY747YV+M375AK5337fpX73a/0AQC0IIEEnS4E75jmTkPyN1OWg+ry1ljnOeAs55apf2qbTpB8TPTDgy7vJZUrdDf2fLfv1QBBruJRH/MYKZ0v7eby00z4oRCbQZMHOcystW6Ik2aTchARgBICt0Yxf6b3e2n0ABrASw6L89cvK/w04LLAA4ZeRBEELgivvHLx8yoMvFC1cVP1Bd5z9PN7hN083k8prGG8MRbfAxowc9/Mnk+T+dccub+mfPXoE7j+gKAHxNXWBNUUbSo/dNW/Xamrpgv7BujjK5ONJgvDMTIpmLv59SR6XwJVM2ThbmdLss6WlOW9imKk4ZvMw0mUhxqqxLdmqob7u89LV1AacQYISQiCIRr0ypUR/RtrpxfTZ1FQCQmoZgj6Xra+6q92tjdYPZCCFIdqp1Oemuh04Y0vGdxqAWffraIXh6N1ZJiH79PECQZM6Zcqz+zsvdhRYthGG0gRAF4DxTMNMFztVmEbXdfiFbpiIiTYqglVQ4YIn98BoAkPB9x50tGutPFLqWE+83lgZmusCZHK/fuu3s1q01E9kirlqSyRM4GKOmBKymJA2m3jFhRuyutggBIisNJCX7CZLT9nURagzbTrhzt4pG56VvQQjBwot+mit1PfQ8tu6Pm0iw8WbBmeuAEVkAwFkBWzXLDUK8iTZlNyEDuDPRRiSAZwAsSrQRFnuHXRJYwBYv0zUPfVgx8rAeN/w6f92SmobA3aGIlssYJ/W+8MHBiPZRMBybkJvpeeGXuauXL19XwW447yh0jYfjBADvN6vKf+6T4/nlrfnFqbUhrShm8oMDmtHL5KIr56KNKUQK48IOQAVAHBIJtnXLD9w1tNO4NtmZen3EIEwIO4RQogaTmBAO3WSGRAkxGdcBBHSDm4JAdM1K3aoNKzbWokeHTHLlEz/mfPDDiosr68OXRTTWVghAolSkeRwLurZNv2fcnUdPmzR7E7/shF67/QSw0tUA55m8vvoZBAP5wDZ6oMWJ0iSgthUB4oCK6u0UwlcTfw36xwhfw2lbe6Oa38bDoH+61baavmlfgvvqQAjNBWPZibbl39AsriDLV6lXv/yV+dM73HnteOCO3S96mr+LQo/RRmQXPAxmBEk0/LBgpu2AEVmEZhJXesYBJLD+qxwgF6TFjrDLAquZV+87D/e/MjHy87u3vnbR3e8uW7O5+v5ab3CYaXJZ083kiprGC7z+8NH3vzrps7a5ae999uP8VcUVDez/LjkGAHBS9wKgSWwBmLO82jcn2aaQ79ZUuUp8kXSTi6yqYCwly20rjBnMme+SvccXZS+pNWhhtC4oVJnWhXXTrko0wgU0AH4hhK6ZXPTOTd2uzRNnrMGJw7rirW8W524sbzy1rjF6STBq9GJcUBAKm6r405Ls73Zvn/bc9EVl5RNmrMfYI7rsmTNgGgBnAGNoDgk1J5mL1mllFn9G8K1+3HaI//4425lorAWcyflgpivRtuxyG+JhQZ2kZj/ueGj6V9p713PHxXs+YdF911RE373GQP+iV9iSaV1J0HvxgRBmBQCYmo2VLrUl2gwLC4sd518LLAB48NoTMWbIJlFS6Z019KAup89dtvl8rz98UzAUK+RCIBzT86LVjTc1+MKnry2p/bowJ+3LJ8b9uLCksiH8+n3nbLWvXjkpQFxwhZqWkm2Pd98O2LQ93pm4CFmpLvn72Rs6j7j6w+NmLy0/O6qZvUzGJYBCVihPdtnn5GUmPXF474KfSqr8xppPL8HYT/f0adhjcwAd2BwIN85tENXFIIVdCyC4kmhbdq0BTYLGnfojLTr4rdi4q7nzstf32uEdF7+KyAtnRmle5xd58YpRiIXy8ZfpBn/h/t2hSeb3MpzLBJITeiQBB7ewsNgVdovAAoBBfToAAG6dscz75M2nvnTeHe9MLa6ov87rD58ejhmpnHOEIlp+JGZcFwxpF5RUef/ITEv6/ppHP51+SO/261dsqIzdfdkxSHbvvnmZhBD4evoqZKe5pR/nbMifOnfTYZX1odGhiD4iopl5jMdVjSJLcDttG9KSHa/26pT5v8Vra+qOP7wDuhSm7e3zYfEfh5dUgbbv2RbYj/WjJPuJw/UCW/prUBpz8V4/PO18MGxjbl4RvuewH4kRu2T7Aov8+ZlmR/o7AeeEAIDqcNPCnnki1Ajgt71vhIWFxU6z2wRWM8cO6w0A/Ilxk1eePuqg6z+ePO+j0irvZb5g5PhIzEgVQiCq6clR3RjpC0aPLq/x1S1YUbLA6VB/vfSB/y245tHP1g4b0KnhtFH9dS6EkOiODzBpDgcsWl0ufz19tefCB75uV+eL9AuE9cGazgZHNLOtbjC5KZkJkkS5x2Uvyc1wf1zUNuODJ645Yv30BSXi6euORJdXEn1qLP5rsFAdQidlQjRUyRD7X3izBdU+l7TpMpdEw3AMv2qvH9425mZEnz2V09zO48DMv85Z2hWxlCjRq9gFzSjcINzWQ5+Fxf7CbhdYzdxx6RgA0G979svfjj6s+7wZ89f131hWd3owrJ0YjuntGOPUMBkxQrGsYCg2RpLomKr6YESVpYr5K0o2vvjxjJUet6P0lJvGlQqg2u20Bfp1LSDVDcHgB5MWBob072Ab0r9D+ubKRrJ6U52SkeLKP+HG8TlHXvF22+ue+q5rzGBddIMX6qZIYVyQ5iKHlBIoshR12JQlKcmOz3p2yJz09PUjin9fVs4PiFwNi/0Wc9FUJE8VUvj2Ye2Etwr7XdhYCBBKAZtzhvn9uIh60SMJMaPV3/EfTYuFhYXFXmePCaxmnr7lVADQv5yy8I92+enz3/tmzotrNlZdW1xZf4vJBSGEgICAMQ6TG86YZnQOhLXOhNJjahqCkCWJCSCsKrK+triORDXD77ApgWXrq2yl1b4M3eQkGjOl0mqf22RC5gARAvFakQQghIISCkWRDFWRNyW7bTNT3I5vCnM8v79y2zH+DWVeochSos+DhQX0iS/DmDqeCn+dPdG27DJUNok7dYXU/TDYj/+/RFtjYWFhkTD2uMBq5tSRA2CajL1695ElR15wZYSbBhFCIDMtZbnT6VgZCGt9dIO10U3m4lwQLgRMJmAyLhFCkjWDIRjRQEDSCaHQdRPVDUFQQgFCATAQQuOj8CiFLEumIks+p922WVXl39OSHTNTkxxzzxzVs3rBqkp2zyVD8ertie7+/ZidCN1a7CAhP0QsHB9Vut8iAmB6qaD7mffNwsLCYjez1wQWANz+xBe499nn3N/9tvgIxjlkSUJWimvc5Ldveun25yZkV9X5O3sDkW6aznr6w7FCxngBQLJjmqlyAYeqSI6mwt0tlbZ1gwcdNtWQJBqUZamWSnSzw6ZsSHI5Vrud6sq+XXLLbzzrUP/S9dViQLd8vP9Aorv8AIBz8LUbIWJaQs0QeqzJnv1ZkLRqj6EDRrxQN9leEvb+gKwwuD06IZYAt7Cw+G+zVwXWyo0VcNjVonBU6yEA2FS5Nis1+dczb3wDT918cg2AGiHEbwDI3OXF0g+/rXJRStPmLi9R0jyu1HSPMz2qmaJZYCU5bWJtcX1VbmZyrF1eajgj1eU7elDnSPv8NAFAEELwEYBbz0t0Nx9ACAB2d6bMiuzy8e2iePnShJlCU3JhepdREQnt1et4T7FVDuB+nOMOQvfjIZAWFhYWu4e9emOavnA1hvYvOsJgLJ0AcNjUBYN6dlxXWd/Ysk7TTUYgPrmrv2k5wNnP7qamkWMu+dUNIJpIM0QkBHPqt27IajshIvt9QUkRTx5sqjy/n7bFNKhorJEPFK+ihYWFxa6y1wTWIy9PQsf8LPWpDycPYYyDUgqbIv903VMfxoxF4/DwzYnuisRAM9sAzASXV+0/MouZBcLf2B6mUZdIM3jFJkCSCmEa7RLdJTuEEH/r2SFJKSB2F4S3Zn8OeyYTxVEALbIskUboK6aAKHbJLFtig74bnwMSpXsJBXGnG9xbZjhPuD9BRlhYWOwMe01grS2pxvrSmvaabh4kANhVuTEvM/X3Y4ckg6j76dP6boCm5kIwE5AVJHqi4R3GMFKEr+Fwc+GMedrUd2E7eu8Xk9Rm/Q+xN+6F1KHH4TD0rER3yU4hb//PznbG7VAOPU2E7zjSEPXlibZy12BMEaHG7qJ8/eTYt4/BfsJdCTHDmPImiNNzKK9c/zBMfTvDhP8ix20fLTYKQiWa1e4tXrx0fAKObmFhsQvsNYE1d8VGFGSlDYjpRg4BYFOU5X26tFkX0wxMTHQvJBBWshYwjYAIBxsAkp9oe/4RAoAziKDvZGXMWe8bsyc1/ut97gK8ohi2M29MMaZ+epowjf0iPCgAEFkFychDvCNXb/V72qEffL2JKQ/ptTnRtu4ShEAIDmLqw5VTb3lNBAMJmdeFNVYheHwulKOOOAK+miME59tZa/+p5A4ARJKBzHY/xOujWVhY7A/slaE+dz35Fdb9+AR8ocgQxrlEKYXH7Zh93/UPBvp1aZvoPkgo5srfYK6fFwPTw4m2ZUcRABCLHiq89efVPzAB2q8f79XjR79+GrEX74b5x08ni0Dj4ET3x05hd0blvsN1ecBRf/qVnNMZNBMgngwtHkrcb4LGW6PHDjOXTOvHVv0OLQEV6bVP/g/qBZeliUjgWMF50wTqrRbEI7UErT9r9Y9sZ8E2r3tzAQDOBa8t3gx3SqLProWFxQ6yVwRWTWMAl975Xqamm4cKISBRGrEpyvSBp56E0048KNF9kFCUYSdAOeo0EHfKfnM3JQQQzJRFQ/WtGY+ccURg1NkwS5bvlWMHnj0ObNkcKEcd14/XVdwlDF3dH7xXLcRC9ebSqT5z4eTt/pq0KQR0bTOA/Xa2HGEaKQgHrpH7H+3i79+4V48dm/oq9K8+gKguPhFapH+i+2J3IABAkgRxuKIkvSDR5uymRgmI//Bi8d9gr4QI15VWw2W3ddcMoyMA2FW5ODfDszwn3YN5ie6BBCN1GQipe7+Y8e3HlYm2ZWcgAEQ03EZUbH7Lcc8Zl0UfuGxG+I3r4brypT12zPCbVyJ4xRtwP3DSAF624XmYZqdE98POQpLSTGXk+VxoMeDxX//8+4wCwO2pQ9BrgvP9r/wEIXFlGAuPZctn/Oa8f+obWpdDuO3ws/bK4Y2f3oBy7CldReX6m8HM/Ut8/y0kRpwpXsRCiTbk3xMf7CGIzbkZsnIANGiHkQEcuDHe5kE8rlTqeuQPyh+q33kHjsB2HPd857bdjn7dwT38gx07va3Y41/gjd4IUrudi8OGDzjUZNxNCIHLYVsy/ulL6977fDY+3NMG7OOYS6ejcsAxZvqVhzQiHEy0OTtOUwhL+Bs6i2jofZKW9RjCgU/8Z+WHkj4uB92NNzYhBAKXdgWRk1yuGw4/gZdvegim2QlNk3vvLxBCIAytVB12YdRcN3e769CUDIDSMkHlCGAmJ9rmXW6nadjgr38k+tIFMcf149/X59q5OujkPXrc0M3dAUozRPWmJ6DFeu4nQ0Z2DEmKCErr4PIk2pLdhQFCb5EOH/uL8NXtfw8Su05TdeT5ibZjtyMAEEKzCKFvRh4YEoHYd/789rrPUIACmL3HL+xXPpqG8S/dan/psylDOeeQJAq7qsxoN+I2VvLLM3u72fscyuCTkTL8ZYDzzSAEzTkj+wMEJO7u1mLtUFv5Mgs2nkRzOo2LvXP7bC5EnbF4orD1P2mX96+v+Q1K0eEk+s7taVJOp6Fs0cxLRMh3pDBNB4D9pp8AbKlvZXfV1hLCU2b9b/t9mlUIANWoKqmFHtsvBRbQ7OEMpfLiZc9E7huu0qJB48PPnRF13fzZbj+WWbIUsRfPAm3bpwsvX/2EiAZPAPaz6+OfIFIdcaXUHxAFXJtrHcZCQTblvYD7hXWJtshiN0AIAQR3ilDDqETbso9g7nGBtXhtKZatL88Lx7TuAKDKsi87zbM4JcmFkl8S3f7Eo3Y5BP5zuwN2ZylII8deyovbXTTfxAQzbQiHxiAWG2HO+3lNeOnhPxNPxh+hB09ZQdt0qZW6HxRUB401hBCCbmcew6a8BGIsmawYv01yIBTM1cbd2zEWCR8K0xgJLdYbpmET2L+8Vi3tA0AoBWR5s/OSIqiDzwZwzp/WozntQFIy69ma+ZsA7Hch0BaakrNFNJQKPfYcWzHzUJrb8Xmzas0KtmmRaTv87N1ymNADQ6FPfcVGUnJH87JV90OL9o0ffv+7Rv4WWS6lnQ/2IeBNtCUWFhY7yB4XWGU1XuRlpgwwGc8HAIdN3VzULncTIPBtolu/j0Ayc0BkZbOgUhiMJSXanl1qQ9P9TJimDUF/H4SCfYTfy0Clel6+uYot+KVKe+fhYpqWbQZvPbqOV2yqIoQQwbmgGbmp4TtHF/DGGoUojrYiGsqAEIUw9TQwpjYnhRKyn984CdWJzbkBqZl/2Q554LFozO0Wc9w+dCkIGbnf1Eb7qyYTAsFMBwnUn8+N2Ejtjau/gNPzcfSTu5bZz3w0KvSooDbnTu3TKJ6P7u0OxrIPbkrm5WsO4esXXYhY+DgwM0lgP79GtqUpDE5s7vU1Qy/Vcpd8l2iLLCwsdpA9KrAmTF6Ek8cMxJBzHhpoMiYTQuC0q4sfvvkk76+z1+KRRLd+H4EkewAuSiDRGhjYLwVWS1sIABBAcAiDS4CRDS2WLYC+hBDwSBgQrSQDIRDeGghfLSAEuAhsvT80u54T3bLdgCR5YbNvJEr2X64i53ZD8KZBgMM9F5JsCmbI+7tcIE2J7yISzEE0fB2UmnNZfdniyKrfZ8Lhnh95+fxNxJNVR9v1iCgDx8ZEyCukjPYAABb2gjpTibFkko2t/cMlGsoz9Q/v6rD4zoEHseW/HgVTGwDTcAohtlwrBxBNeS0cBPPSb+kBte9xiTbJwsJiB9mjAmvBqs14/NWJrs+mzj2IcwFJorCpytz8YTeLn964NdFt32egbTqBJKc08IqSTYjF9t+wUGvIX8ym11z0selG2LIW5/FtDrAb5Fao9lJa2LUK/O/HtEjtewKELGP1lVVgRptEm/2viauEpnERHELXUqFrRyISOBJU1kVdaSOIVM1W/VZvfP1MKVS7GbpvKACC6MPHAFpEJk5PodCj6eAsF6aeCm5u8WziwBNWWyHJDbC7l5JMO4CVibbGwsJiB9mjAqu0ugGSRNvohlkEADKlPpssL+7aLhe9uu/7Rcv3FsTtQfSWu2PKsYcuAAmOjCdEJ9qqPdXYv2rYgdpgbAnz2F3L7Wc/FDDX/Q7g0b9cneR3BG3fvZhtXDoXMbL/C6ytGtdKeHMOwXUVpp4NIBvRYPz3hg6Et3gyBQCh12y7m7g4P4AvmxZUxzraoV8xDB3AD4m2xsLCYgfZowJrfVkNUtzOrrppZgKATVWq2udnlBJCYeW3b8F55j0IXD0YJMkzT/gbDWEYyn/hvvFfIZ7gLnHI8q+hq3oL9+t/Pw+y45S7ELy8m0Ey835CJHiKYOaB6aBpLba2l2rW9BlpWnerz/8LCAFCKKDYftGefChgf+i5RFu029oFQihk5RAoqhq6s5/073e6X0IAlANYAkC4H1+caHssdjN7TGBNnrYMY066DYeMObyvaTIZABw2df2Vpw5vXL6xHK8luuX7GLR9EYgkLeZVZSUwjAMjTGixBUWtJum5C0hKxg6Fs2jXgwBZmS78DcWIhto3FT5IdCss9iLxuSuVAElKm6qcdDTsx9ycaJN2JwqY+SCY+V++qGUAHwK4INGGWOwZ9lhJgJKqBkz66im7wfhALgAaz8FY1Oek23VfIJrodu9z0NwCOG96s5w4nL8dMEndFi3hQdgcf0gDhm8i2Ts296bcZzic172zmTjdk5uTxC3+g6j2ebSwx2Ka1yXRluw+mq9nziVwLv+Hl+Y+2JKbanFAsccE1rwVm/DVz/PTY5reGRCQJCrSPe4NfXp3xrUXHpnodu9zOM55AIEL+3DiTv4WkqQJS2EdEAgAoBInyWnf62/dq6sjL9yh7dQjL0L4ruEcDvcHUGwN1tXw30IIASIpgiRnfmVO/zAkDz030SbtXuI1V6yl9WJxwLHHBNam8lpU1Da21QwzGwAopX6J0nU56QfMVA+7FUIIpG79QHILZ8HuXPbv92ixz6Da1pK07KnSQSMg53XfoU0IIZCHnAr1tNuWEU/GlAMzCcvib7G7VtK2vb+XDzkZSodDE22NhYXFTrLHBNbmqjqAoA/nIgkAZInWpya5qnLTUxLd5n0Wud8wRB8fV0/TMr8mkgQrTrh/I4QAoRJIUsqE2E3vl9E2HXdqe/WYS6G9fVsMDucLUGw1llfzv0HTdcNJUtq7seeeLKNteyfaJAsLi11gjwiszyfNR+kvzyGq6b1YU2zZrio1PTrm+zoUZCa6zfss9lEXw379GSAZ2Z/C4VyTaHssdgNOdyXt0Odzx7MXwHH6Azu1KaV2yMNOhfO+7xfAlfw+oZKVivUfgBAC2F1ziCfrI/WM42E74rJEm2RhYbEL7BGBtXpjJV4cN80eCMc6iKYkX1mSSv/vqtGRIw7pmug279MoR58G710fFpPk1HcIpdzyYu2fxL0QFMTted9xxYvLpYHH7NJ+HGPvQvTZs7nUttvrcCYtatp5optnsYcQQgCSEiRpec+Z87+tU0+9J9EmWVhY7CJ7RGDVeP1YU1KRzhjv0HIgSkoI6cuJsHJJ/g77Yaci9f5TQbPzPkCSZ278U+uGul9icywhKZlvRh4dy21Dztr13ZzzMPQf3ikhaTkPEtXWaF0NBybNohzu1PHSoWO/U46+DEq7QYk2y8LCYhfZIwJrU3kdKmobc42mAqMSpfC4HPVtRxyNIYd0TnSb93nsZ9wIY8b3tTQr/ymo9qClr/YvhACIYouSjLzn2KJfS0nBzuVebYuc2wnq2XfAdvkT3xNP5vNEVpiwvFgHFvHim4DNNYtkFDzJZn2qO85+JtFWWVhY/Av2iMCq9voRimptTc6TAEAIwYKRWIkq/VcL9u4cSvfBsF1wK2xnXvM98aS+RqgkrBvq/kH8PklAUtI/VIaO/VI5/lI4L/z3N0rnuU/A+PYNJvUa/BLszncJpbCuiQMEER++QOyuUpLT4S5Rs7ncccPnibbKwsLiX7LbBZYQAmuKq2Aw1plzIQGAIksiKzU52qEgK9Ht3W9wnnMPtK/fNKRO3Z8hntQfCCFW6s3+AAHgdP9MUjMfMH79Iuo479F/vctmnJe/CtFQ7Ze6HHQfScv9wRJZBwYCAJHkSijq1VU3fvmbOuZ6UKdVzsbCYn9ntwusNz78FbElb4Nz3qlltntK9LRUVyg5yZ7o9u5XuB/4EsasSfUkNe1GOJxzLZG1L9PkhXB71tLc9reJaKTK8chPu/0ojmvHgdeVVdPCrleTlOyf4iMLD+DJwQ9khIjnXdmcjbRNj/v1h+d+n/P4UVAPOyfRlllYWOwGdr8HCwJffrtQDYRiWc0CK6YZoVkL19UsXl2a6PbuVxBCIB3aDzD4ernnoFtIcuo6a9aUfQ/RHOJRbOuJJ/3y2KtfL1aOvQzSHigOSgiB677JELpWLPUcfDlcSf8jVDpAcrJE/J8QTRd50/sDMAlRNOVcEUUtg81xse36j95z/fYh3HdOS7RpFhYW/9/eeYdHVbRt/J5Ttu+mdyCBEDoCCnalqaCIFcGu2Cv6Wl/1tYsVu6LYu5+gYEEQpUOkdwKE0NLbJtv39Jnvj80moaiowYie33VxiWdnz3mmcOYns44jAAA14ElEQVTeZ555po1oc4G1eUcl5q/a4qSM5cSv8RwHt80Oj83e3vU97PDcMwvWc8ZDW/R9Id+t37UkIWULAHNp6G9CPA0JcXpKSFLqNXTLusW2x2+F9djzDtkzCSFw3v4hjMqtZVyHrreQ5MxXiGiRGNjhpb6bPDgxgcoAkFhiVsLpjBANhGiEFwDCNRX/Zwiu+JiBzVVEsrtfK0xb/rU0ZbxhPfGy9jbNxMSkDRHa+oZWiwCD0mSOIxmtr3OAed7SH8R68oXQy4qws1PvxVn3nTmWY/Q1FgoMYdQAMdeG2o3mbfU2x89cpx53yk9/vtw5433Yho7/S57vuu8bRF653M/3PeE+o2T9NnjL74cq58Ym8PZunV9tuJicIgSE4zSI1mqI1q3g+E3E7qpk0VAplFAUvEUk6Xm5zF+dBKAn0dQ+0OTOMAw3YxQgOLzGf7zevEDhTp7NpefdCylaZNx/K1yXv9re1pmYmLQxbS6wVm7aCZ7nrFFZscSvUcoQVmSYgSJ/HKFTbyiFX0D+7JUi4Yhjr9C3rnkE/sZLmK41tbPZtn8ZLROlBk/ydK5j1wegaDttj17yl4mrOM4JH0GZ+45iu/jJt6PPjlnLvFWPI+w7hem6ADR5Sv5GNHv8rPYg7O55xGqfRjwpy7k+g6ulF2+Sk2bt+431UFdMBRweXl/5bRKr2t4Dqno25NDZUKWuzNAJgL9dPX+x3hZbLXGnvsJ1O+ZNWrW90XnXjPY2zcTE5BDR5gIrweOAzSLm1DQGPBoMAIBF5B0DeuamRiQFxe1d48MY6wnjAADBB5LKhAEn3mIUb1hDvTX3QIp0atqL1N4m/uOJB5QTq72auBKf5XoOeo/VlQWd93/VbjZZT7kGVB7LmKas5vsPvdjYtuISBLy3QZG6MkrRpEDar9EIEIunAohokYg7ZSbJLniT7zboZ+arkW1jHwXwxS9+3XLMWAAwAHjlH15cyh8xpFD/8YM3aMW2S+CvvgqKlNe87PY3gzEGAoDwggxn4lwuLfcZYeQNPxtFi6nzP+03ZkxMTA49bS6wdlXUwyoKFk03mpNeMcZsPn80QdH09q7vPwLPxJmQ546NOq59dnL48YuW0arSe1nYfxZUJbZN8+83zxz2xOKbACKICpye2SQx5Unbra+uNTYuMazXvNje5oGzeQAA6prrfbaLJ74efeXKn1h9+U3w142FqmQ27+htBxHSHNDtcO8kqR0e43sdP43W7ZGsp97YXEae8zJIUo5orJ3tJFZHklG7k+M8aYTYPCEkZwZtZ98vU+8exqd1BgAmfztxl+OKl56QXrnoG1q752ES8Z3NDIP/u4islh3UvA6rfRVJyJhMUrJn6JvmRqzXTIal25D2NtHExOQQ0+YCS9V1dMvLzN28s0JA7Jxn6Ablw5KcUlnvb+/6/mOwnXI5gMtZ+IXr1oonnzFe3/DzGay24gYo8onMoNZYKWbGvf0ZmpYCwQAiCgacieuJ0/UC3/v471hDdUhI69reFu6H5ajRAMCkLx4u5gaOvENb8On7LNBwFVGkC6BEMxn9a2OXmuPUnAlLuazOE6rvmLouZ9HZsJx1L4Lz3oU4+k4Hq945wCiccTJT5aOhRDuCFzKgqxytryJgzA/RUhtZPWsj50krlN65cYn16sk1xs6VjBDCom9ctZErGHgV3bH6LhIJ3sV01dZeIqv1xhMiiBpE62qI1rdJcva30sPTGxLWLYXjuveAV5PbxT4TE5O/ljYXWIwxNPjCDkZbXjYMIIyhYM+qIsyetwmnD+/b3vX+x+C64y3Ia6dGjQ8mfSkcO+RHWlc9kijydVC1E6Fr1uZdZabQOmhae3sILyhwJWzgElM/5HJ7fvX+1ZNqr6t5E0Lm3/vIJ/u4RwHAkL9+ej3JyL3DWDP3HVq183xEQ2OgRLuB6sIh92rFj39xJi7luw64hlaWFOeFKqC8dw/U0s02vv8ZpxsbF14LOXQ8dC2BMXqgu2RBifQkhAyhId9N8JYXS0+NmkZSO7wXujannB98GeiabwPCiWMnGqtm6miouo8ZuvUvE1lxEQ6AEA4QRD+s9iXEmfgpySqYqzw3ucE1ZxWc/5kO5J/419hkYmLyt6DNBRZlDHWNQdDml3dswtIMo5dv+1fCjys3m+uEbYztyLEAAOXNCUH5/lun8sedPIdVlg5mvvoLIEvDoWuZzDBiM87htvPqLyLmqWpe1gFEixc2x0KSkPwF16n7fPu1L/mMmmJ2Eybhpr+5uGqN7Zz/AoCuFc3fyPcaull+6+YptHrnUBbxn00U+WRocnrz2EB8dbktxkf8+BfHVpKccaOxtbDY/shchEZnQhwxuhOr2P4AlOgl0DXnfkKPNN+ilSkMTFcF6GpvyJHezFd9Jpfb6yFCtR+JK8UwSlbKXMHAZ6mxIge+mmsZNQ6ZcNzLU0W4WHyVxV4M0TqTJKZ/z+X136AteCfquu9HOMZPBjoOOiR2mJiY/L1pU4G1u7QenYdMQO8+nW1qVG96wcVy10QVteCel79IAkF9e1f6n4q1y3AAAPu8KBC8ute34tALZtOSzd0gRc9k4cBIFg71ha4kgzGyVx6tf6N3q7XnAQSE4xhEMQDRsp64En8iyRk/cF37FRnFKxX7tS/9LQOofw9i72EAQBljVdL7t33K5/b9Ut+8pCvz1Qwm0fAIJoX7Q1ezQY2YZ6tJ3JBYPoU/0rwgghAhruSH9YXfbXY89yOk/w2G5bzLB9Dyra8jEjiuOQCckINIbUWazWCGDkihgTC0T7TvX31UPP3mN8BbNFq2SSIdez3BlOiRCPuOapOGazVOED9nkuMBXgiBF7YQR8IyuJJ+4jLzV1svfq7eKJrPxD6nxMq/eniPGRMTkz9Hmwosf0gCdn+OLiNf6rxpe/le70xV03Pr/aGCUFQ2BdYhplkMvPeYRqOBImL3bFG+m/y6vvLHfBYKnAhVHgIp0hea1pFRw4HmBI6t7vFP8nI11a25hrH8S7HlP9FSBUFcS2z2RSQ5YznJyt1qH/9cRK/fwsT03rHyD/xz2qKVUFQoY0WNfUmR+/UP3tXXzMlh/vojoWtDIEcGQle7QlcTQSm/79Ldb+5KjO/ocyXN5voP+U7sUAB15ivguh2dTyu3T0HEP+jP7PqLjU0GpsrJqN0zUftmUqP+7dxPbM+9C+XNG8v43ic9Byn04e9fKmyJuWvdXoRwAM9HwAllEMQNxO5aCU/aKuJwb7ZdOyWg/jSZ2U67Dbjk+b+6O/fFD2AtAP5P3sfkr0EAsOcgyu0EsBGAufpz+MAB2NWmAkvXY2kZCCH7/AMn0A3D4w9Fjt9QUv7zM5Nn496bTm/vBvhX0HRoLAMQZoxt8J1ENjgf/3CKVjg7jfm83aFrA4kiD2CK1B263hGUJoFSEaC/ni3+76Q5WnsZ4raxVn/nOIDjdSKIQYiWKoiWbSBYQTzJG7msvO0kO7cyfNPdWmpl06R/1aT2rtFfAhcXH4OvVADsUtbN2iX2H/mV8sXDHlpXnscaq7pD1wZClftAV/KhKmmghhuMCmjOvo79vE+xHGFihLiT3zGWfStzXQeA732CVV/+3f8QavhT4qqFJpmlSi74ah4Rzj9jg77ok03CKeNBLPY5RiS4CmHf3kFP+3ijQFiz7YQQgHAghFBwfBSC2AhBLINg3Ursrk0QbeuJzbmd63Z0g/LFfbr7nUis/a57r727sTWFAE5tbyNMDhoCQP2NMhTAwwCewOF+hMG/CwJAa1OBFX9pkv2uA4ZB4Q9LQx67/rzX6v1Bub1r/2+keVIbeoUOoJoxVi198/xCLqsLrxd+72YNddnQ9a5MkbtBV7sRXe/CNCUTupYMxjwwdCsBBNCYkI6nLmghHjTDDvjsXxRsrb5Gmg5b/MU3Cdv/vnGPFAAdvKiBI0FwnBeipYbwwi4I4nZic+4gyRmlXFp2BT9opI/5a3TL8WP3nugP82XAP4t1wBlArIUDADZQXdkQvMg61X7nVKuxdVkyrdmZiWgoF5pawKhRQBjtAkPLhKE3jQ/NQkBEUAOwOTZxHXusQHYBjOLlYHVlQxD2jYkvC+4Vx9Tqb/uNqX2GVMsbptUmGk3Jh7/uBut/p04wlk43lFfu8vPHnvQ14bgTGY153/YaJwwaeFEHQRC86AfH1YDjyyBadxOBL4HFvpskpFdxOT3rLaPvjRjFS5jQ/aSmsfJp7KHv/r3Giuul7QCgNfWdyT8AIX8gEBvokfa2xeSP0eZB7gDgD0UbDzRBSoo6aMGarT3DUWVde1fcZK/lIgOx5QU/gC1UiYJY7ESZ/4HN2LHJTSt2eMBYJqKRNDCaA5AsqFIadC2BCGIWC/k44vBkMF21QpYAwllhsXlgaIChAZSBUQpCCIEgWg8sZBigawpjjBGOi9nGC4BgAQwtAl2NwuYAESwKi4ZqiTuBMl2vIQLvh8VRD2ZUg+MrSUKKDzxfQzxJjXznXiHrqAky9VcxPimn1bOeavrvuPbugr81nNCU7WPaWAVAddOfdYavElxiNlHmv2Vj1bvctHpHAngxkzVWJRDR1omFfQlcx57VtssmBbQtC6D/+AFIwYAjYHcHiRLxMU0Fsdg9IMQaGyM64h4xwgsCOH7v91JLoDuDrqms6SygpgBzgBc48OIQ7YunOoIae4STTwVE6zwmR37ibC4Lk4JlsLsl6FoZsTkCoLQCriQfqFFD0joGiDMhKA69WmbhBip2PnqfVvhve3eDiYnJYUqb/wzLHX4nCMhdDOy5ljPRCBiLHfqcl5X6yIKPn37051WrcPygv18eIZODw/DuBiwOQVv2lUVb9DUR+w9PNMqKRKN4HePSOzu5rLx0Wl8G2lAJRKNgkgzidIt8Qf88CKKwl5eCADA03SjZUMoiAZXYbIDdDi4lG1x6HmHRsM/YvtLHd+tPuI69NH39PL940mgmDjpTZYamC9m92rs5TH6B0H/6wnHPV1B/fMsNiyXZKFlBmLcKQp8h6UyXnbShgiHoBWQJTFMZ16lXKpecnX6gkwmYoWl097pSJoU0WKwgVhtIYiZIcg4hgj0EqhUxJSoZFRvBNJnjOvS0WoZeTYTuJ8lMUyjvTmvv5jAxMfkX0eYCK2/4nUh0Ou/yRyPPUdoisIBYrHGCy7FuQLfckZpu1H3+0vXtXf+/nHufnglfUOKSkhyWS84+UsnvkMycDmt7m2ViYmJiYmLShrT5EiHHc8jtkGKEdkigTbE6rYlIyhFVXt9Zc5cXvbN+Yzn6H9GxvdvgL6GuOoD/vPw9KMeSimsaLqdV3v6U4A6LyPva2zYTExMTExOTtoVr6xtaeAGN/kgpZWw/dUUIgW4YvNcfvvqGMcPSXv7kx/au/1/Cs2/Px/zVuyyqapy2eGPptJrG8PO+sHxOaY0/f+vuuvY2z8TE5B8Ei6VdIYwxbltlgPt2dQXHGOPYvvnv/qW0bp9VOxu4kKTF2+Y32yf+3YiscSt3eDlK6SFt1/jzNN3gPlq8i/NFlH9MX8brRinlVu7wcmH54PuhrW3wRxRuYVFtm/dnmy8Rnn7NC7BZxOFFuypmyqpma71EGIvFYhB4zshMTrz15y+mvTHt+7dxwah/Zqbj599ZgDuuHkIuueezgor6wG2NIfliWdMTGQMEnkPnrORrd1Q2vLPi3RuRkuZqb3NNTEwOUxhj6H/vLAzKT7HtqAkd3RhRTwJDd39UtWo6ZSluKywCV5nssqzJSXbM/3Daxho2/3r+yjeWXVDeEO0OgB7EY4IAPkDshX4FAM+vFeY5gswE27c1AXlDtyz3oO1VoZHGr0xcjAEJDlE6vlvqR/ec1bvu0tcKz6tqlPo6bYIysEvyZzplZY+P7feH2+fcSYuRlWTzbCj1HxtV9ZMNyro2hlU4LALxOMSAQemK3FTnkjtH9dxZUhMyrh4WixF+fuYWDO6VQZ6cUdSlNiANC0l6f1kzUiOKzhIcIuMI2Z3osKxw24VFs+fv9G9453x8smQPGIOruDp4RUTWUziOINllWfr1qor5VwzujLevOxbDHp8LxHKWjQVD90SnWHPOwI6fCDwJX3RCHhn19MK8hrAyPKro/VWDpvkjGlw2AQkOMWIT+aL0BNvCU/tmbthaGdRdNqHXhjL/eYpqHEwKQwLgJwDLAIwEcMwv9b/dwkNSjRqPXVzXp2PChoiiay9cdhQZ8+KSc30RtS+AEICPAHjnPxhLsPvE9E144Nw+5IIXl5zti6j9GBBuKlM/94FhSLzqSwzume7yRdXjJUUfohq0iy+swmEViMsm+Akhq3rlJPx884iC4spGyXDZBOuHi3ZdWuOXc0B+I1UFA1x2IXhq38wPN5b5bRUN0csVjdpBsArALAA4pmsqBnZJJm/NLekckLThYVnvr2g0NaLoLMlpYRzB7hS3dYXbLi7+bs52X8knF+L6d1YCgKtp3KcQAtgEfn5NQF56Rv9sPD6uX+v+vKCpP6U2XyIUOA6GQasIIUEAtv16lhDoBuX94eiEc268eu6UqQtL2tqG9mb5uj04dkAelm0uSxt+zZQrvIHo9ZKqdaXNcbsEBmWIyOoxJd/c9e7ytaWH908RExOTduXiVwpxfLe0xKXFdc9VNUrjVIO6m08cYkBEMUAZg0XgjOKq0MpBx+XeAmBjUXngspKa0BkH+ZgKAF8j9ha7G0BO/P77wyDwHHJTnRW76sIbUlyWEetLfY+pOsUvZ2thSHFZG7OT7HMYYw1DH5t7zbrdvtM9DlFKdll+1nRa9kfaZnddCCT1UVz31MhjftxY85Avog7VdGqPmxGIaqj2S+A5cnVdQKm885O1r15wbKfXb/tgddQXUdEYVq3jJy+7siGs3h1V9S66wZolTCCqgQCo5KOK0yosP3dEt2eO6JT0Q3lDEZNUw71+j+/2oKR1JQBsFr7kpB5p499+amHh2t0NGPrYPCA2IV/GGDs9N81ZysBmfVZYGn5nwc4xxVXBJ8Oynk8pIxwXmzNkzUBdQAbHEeyqC3u3Vgae2fbC6OcveHFJ7/W7Gx+NqsbBrkpJiAmsMwHc/GsFCcCsIu/bUROa9MzFAyYB0DeW+cfWB+RxDKhHTLh4W9o7DADYWOa/oC4gX8xin/0g8KSe4ziMfWnJoGXbvf+LKPopmk4d8X7wRzUAgMCRa+sCctWuutBr/XKTXhrSK0PcVB64vswb+U1PDGMMWYn2xuG9M+YWlQcsu+rCD0iq4QEwBcCsh8f0RVaizfXU10VXlzVEblE1mq8ZlMR31AelmA2VPkl1WPjC0SO6Teya6Z6/sybE/FHNDeA2AAUA4LDwFx1bkHrN4/+dXbinLox+984CYquClzHGzshNc7Z9DFbHzBRQRht2VtbWA0j/pXJRWelRUdd49/lDB97apcOHylsTr2hrU/5yFs3bjpsmf43XP1/qGXXTO2N2VDVcH5G1oyhlfMtRH/GAfwZZ0wc88ea8JDA0trftJiYmhy8LttSiZ07C2ZWN0pWyZghOq9CYm+r8XDfo6qCsK5kJtr5VPunC+qDcWdGM4ziCB79cUXapTlmJbtANiKVqYTxHEhhDPmWMIJaWowqxlxYBUANAAWCPPzfRaQlkJdp37q+ZGASOQ3aS3VsbkEEpoBsUBmXokOyodNmEGrbfNlFGnDbBaxP5EABiUAaNUugGBaUMxh9ctrnlvdW48KFT8hZtrZtSG5D7McZgt/B1bru4OsVl9QclzeqPqv2jitElEFU7qroxccaqiuiy+TteR+EqHPXfsVdV+qRJimY4BJ6jKS5LidMmbHRaBTUk6UmNYeWIqGrk+CLq4DW7GvPPnbR4XG1A/jnFbYFuxOwHAE2iBaXeyJQxtx5/4X8/W7+ZMQaDNp0ywQCDMsIRwrpledJmrCq/3x9Ru3IcYZmJtnkZCbZZ26tDe7pmujuGJO20isboiEBUSzUoe+j0pxesdFgEr07ZWt2gHAAQQghHUGBQ5mrqs2LE8qQRxERAbes24jlCXTaxhBCEm8qAMTDKWFpU0TuFZC2Z43DH+wt3zhl11Ctru9xyHHTKDpjbMF4n3WB7lclJdmLkq4X5q3c2vOeLqH0AwG7hvU6rsCLNYw0Eo5otENUGhBU9rzGs5EQV/ZGwrDfcPKLbJ4ZBt+kGFRHztDGLwKXoBstjAKwiV69otCy2tAeiU+YHiGRQZtUN1tz+douAO0bdixMfvuWGUm/kqYiiCxaeo+keW4nTJmy0W3g1KGnJYVkfGIhqqYpmDN1c7u96/guLz3fbxVXekLJXPUMy67G53P/6WTceO+7sSYuKY3WmLf1psLYXWL3zc5CR5Ams2LyzDEDvA5UhhIAyBl8ocvHMpeuXFP7ftx/f9OAnmPz4pW1tzl9C2e4GDL91Cv5vyQZ3RoLrlA27aq5XNH2oZjALiQurA7wbZEXP37anvrNBmSmwTExM/jDekILS+nAHTacCAeC2iUUXnZD75B2jelYDABn1/ucXjey2bEtF4B5Vpxa7hVfnbqqxqrpxP0AshICFJU3vm5t4WmWj9IWiGSIh5GMAj6Pl6B2G2DJhFyD2I9FhEZb+9MCwSxOdFh37CCZVp6gPynKHm75uviZwBN2y3W9+c9fg53GATVZRRafbq0NRACLQ7PBv4vdHtCzZVouTetyFgfddfGW1T+rHGIPHLm7rkuG+4YZTC5ZdemKeVtkY5S57/efOJdWh1wOSdpqsUbHaJ136wK0nfLzlvD6uFSUNtzSJK5adZJ98xoDsZx88r09VgsNCl2ytEx+bvrlnSU3otYaQcmJjRO1QUhO6cfOkUcvPfHZhsx0OqwBVp6jxy73XMt/LowZkXwtg18/bvU0NG5sgrALHFm2p9YQkPRMARJ6TCzLdb33/36FfAWBXvbmc9szxfPbN6soXGsNKAc8RohsscfyQLjOXbKs7BQAoY+ie6bZ7w8qXvrB6AiGkHMAYxERVvBGbk32zmGczmp/hurFrhmtFRDEEEEDVKbWJfKdFW2u/CEa1PqpGUwzKeqFb6trmHjlATsN9D22PJ5ne8sVGWC7uf0mVX+rDGIPTKhQdkZs04fKTOy+57KTOeqk3wt34zsquWyuDkxvDyjBFp9aQpF3z5fKyryTNuBGAQAhBOKzqxw3IvnTd7sY3VYPiyLzkb/xR9c6tlUESP+zqtjNuCZ7w0N0DW9vUM8eD7lPuz/9hQ9UNEUUXBI4zspPsr517dMcXHh7Tt1LkOVpYXG959YfiAYXF9ZP8Ue2E+qDScUdN+OZNz426ynn5F4zjYnWxWwRoBkW1X+7HcWTyyH7ZV1X7pNJZ66v26s+2TzTKgDFnXaQcN+7yLRwhp9PmXFj7d4KmG05vIPzoeTdftnvy1HlLv56zDueMGNDmJh0q1q4rw9UTp+GpD+a5O6YnnrJ8S9n1UUUdrBvMxuKH5B6g7nGtxXGEqZohGvRgwh9MTExMDkyiw4KsJLvXF1Gh6gy+iHLci7O2/fDWvB3VHCGNBQUp1fVBxUhxW6eme2xrLj4xr2j0kTnBzRUB1rdjYhQA+t/7PUSei6DlFaUACIc/bEnI67rii72ea1DW44rJyx7e90wHMAaHVYgcW5D6Zl6aszJ+mTKG+qBy2jmTFiVStt8mKw7A+uKq4EfFL45uk3ZZt9uHzwsfsz/wfxuONygDzxGkuK2TC9dVLhp9VE588jc0ne3o1SHhYQKUg4B32URvXpqTzN1U00dSjXwAcFqF4gGdk58t9UbKE52x1Dpvz9uhVjZGN+SmOieFJG2QrBnWQFQ9+vYP12QwGjvEkwHonu3ZGoxq9TtrQyd7g8qwH9ZXP3l899Qbw1Et5HKIzfaqBiX9cpOi3pDij6p6pqpT+7pS38t5t3x9Q6LTEvWF1T3bq4OqXeS356U5ZxzXLW31hNO7V5V6I7T+7TEBABj/xjIkOER1+ory+NmFFLFYqeCv9CXx2EVnzw6Jnoii8wQABaNrdzVaWbyfCAyDsgiU338kIgOYd8udlmP+N+ckSmPLx6ke65Sft9fPd9sEXH5yFzDGjLCsFw/IS3pIUo3dDIx3WIT6sKyzscd2ijxzyZEAgIH3z4bDwkfjc6tF4NRVT04MAksBxA5uPP7BOfvZUN4QBSHoE5GNTgSA08pv6ZHjeXpLRaDGIsR+Q7z4/VZlxY6G5ekJtmfDij5V06m1MawMuuOjNSk6pczCxcp1y3Jv80fVujJv9ORqnzRs1rqqJ848KmdCOKSEXO6WtEttLrBuvnIYjjjrQaQkujfW+UKM6vqv/uyQVa3z9rLaF045ts8ltz/zfyULlmzD0JN6tLVZbUpFhQ8dOpyJ7wqLUhNclqHLikqvklR9iG4YNgYSOyAWBz44KuYuJbBbxYqMJNcD91xx8tpte+ox/aX2rpWJicnhyrlHd4DIc9/6o9qwGp90hmZQVyCi9fVHtL7xsx9r/DI4jjCrwNVvKPW9tKLE+3xDSGk5C+8PrMDVBeX8RVuV2/e9zhhDmscW6ZnjmZXqtjYLLIMybC73n8QTctIvPG56oDH68R+zZn8yEmwwKHPbLHxHBoAjRNYNurlLXjL+e3ZsgaWVF2Z50x8AwJJrv8TJPdO7lVSHrAAga8b2TimOGs1o+UF87fCuOHXiPIBhm8ATP1RkcBxJAZBEWUtcEqWs6rhuqbeFJO39+pAyqC4oj91Y5vefNajDvfM21zTX1aCMvPfdluqhx3Z6UTXo/ZJidAxLeiYDMr0hBYQQ+CIqCAF4jshbK4NLftpYfcvu+sj21m3/e1F16iiqCLy1rarlGDsGIKro9oisZ3CEwG0TV7pswnLsuQ+xULyDgzEG3aBsze7GBJHnOrDYNUnR6CaPXcSMuwbv2w+FTX9++Z77Xflt72ZY1pDstHZGk3cUwI5hfTLrF29t2cn/n1E90ffumdANVswR4mcMGaLApae6rWmqanjjQgxA5egjO9z31cqyd6t9Ut/6kHzJwqJa/5B+Wfev2tnQfL9DclRO99xMiKKwVhS4Wk1H5i+Vazp2DqGoPMgiht8acnT3a5/9+Icdr727ALdcPfRQmPaneOW9RRg7pB959N0fO558xbjTZy7dMj4YlQdoOrPE6/Nr3dz0Dxxuh3VlZpL7zu8njy+cOmsDu+zso9q7aiYmJocpm8v9UHWDDMhLbpixsvzWaSvK3ivzRnpThrz6oOy2W/iOvojmNCjND0l6WljR00Hw341l/qWSqi/5M8922YTdHrv4A9tnVmcMSHFbFadNrIkHDgMAxxFkJdqXAVjDGNvXg8UDWBPwSW226UczKAiIouk0CAAgsCQ6LZmVjdJe5c56diGSXJYe9UFlOKWMWEQudGL39KlzNlR5GRgFwNlEPlWnzEFA9jrvMarosIl8AqWwITanKQJPFOw9HXBvXnP0jnMmLZ6wamfDe4Go2nN3bfhKTae1VpG3yqrR3G7s+6tIY1j5dOKMohWbyv1HyapRUBeUPZQhwzBoqmawrJCs5ak6tTWElFM9dvE/5a+fc9OLZ2xld5zZ8w+1E2Ug9UE5hTXtJow7hwBwIs/RrCT7Z/kZrid310WqGWNct/98FyvAc9b+eUkJYVnDyqZ79emYELtFLI4PhBDwHEd0g0qKZgRI7JrFYeVTJXXvbE5nPbcQGQm2XlU+aahBGeE5EvDYxRkAwp9POPG3K/Ir8BwHSdV9TdsyCAMS1u5utFoFLtq6nNMqwG7h0yobo04QwKAsqug0QniudX/yT1/cf+PKnQ3XRWT9o6CkFeyqC19TkOlutIm8NV6vQyKwjujWEQlOx+5te6q2RGU189fKxj09jaHokDVbS9/OzUi++Zarh27ZvqMW3bpmHArzfjcPvPAd3A6rZf7a7b2nL9k4zheKnhNVtAKjOaCQ+9XfW7FXD4PA82qC0/ZZfnbyI9MXFJX6gxLGjerf3tUzMTE5jPFHVFgFzjr62YXP1QWVozgCPcEhvrGgqPYF5ZOLuN11Yf77NZXCsh3eYxcU1X4RlLQ0STGcy0u8yZT+cS1DCIHdwm+cfPWgCZ8X7tHfveG4vT7fAWAFAJz9AfrnJgGIpW7IS3N+XVhc/2zkowsPeN/S+jCwz9xECAFHfr+tvoiKW0Z0Dz0xY/MmjpCjdYNx5Q3Rcwb3TJ+9+vZv/dtfOguvzynGgM7JjlveW3X3nvrIVYwxpLitxQWZ7tlWkd9iEbgGRadpqk77ryjxnr74kVO/6JGzg10zrCtGPb0Ag/JTbJ8V7hmn6kYCASDwZHtmor16W2Vw3zQWhDG2/Kguyfes3d34ji+iZtQG5Ht4jjSrDLddMK6ZsnzktqrgA7rBYBW5rb07Jtzdj0vyT7rsSP6jhTv5oKwnfbRk98u7asPjKGMo80Yyj37gB74u+AfW7pqwCJzktgm31wWVTRwBbxE4uO3iDb6weglljOM5UvXdPUOKJ/+4HYQQOvC+2eFqnwQG5tYMevzKJ09f8e3qcpw1sCNW72zExa8W5hgMfWhsQ4Gen+4yRh15b7jb7eM2EkKOMSjjQ5J+4bDeGXPX3TnTX/T8mbjn07U4riDVOnFG0d2768JXUsaQ6LAUndQzfQ5iqR7+FDnJdgg8t0XkOZ+q02RFM44s3FY/rPils2Y+NHUDHhvbD0c/8AMG5afYftpYfaFqUBeJtU3xoPyUOqvAJexzS25PfXj5UV2S7129q/GNoKRllDdE7hF4YsRH6iERWLlZKbj81ucjg4cPmucLRoYZ9MBxWM2jDgClFMGwNKSc+KYOv2LSBI/gWPjQ89/Qx+48+1CY+Ju89sFCjBnWj0z8cG7WyqLSE/0ReUxYUoeoup5GacxbBQL8WtKR2FaM2MvBYRVrUxOdT/XpnPFOaY0/oqx+EkkJT7ZL3UxMTP45NIQUnDWwg7q7LuLcUx8+jgFI89gyh/bOMK56c/mGLukutr7Ux1U2RvtpBnMwAAJP1IwEW1gzKBr+4HNjSRrR9bnvtt5BGaOnTpy31+ccIVzXTNfK17/ZsjB+jVKGQFQ7+cQe6TqdOG9vDxYDLCKnvzm3ZMaTF/ZvXlZUNSos3FJ7oTekDHRd8QW3jw1ckstSMbJf9peKZqgf33LCXre8dWQPvHvP9zTFbf3EF1HPD0laYkjSzlu1szEp2WWZOvjRnyo+K9zjnjJ3xxnVfuliWTMgcAROqzBv0qVHemesLPfvqQ9/H1WMKyVVdxRXB18+4p5Zx3jsQuHgR34KV/mk1M8L95xTF5BH6ZTBYeG1jATbR49+uSk6pFf6vhMynhjXD307JX5/1H2zb1M1+kZU0WPKkzS3GcoaolJxVah/VNGdVpE/WtFoKDPR/tGTMzZHfREV2yqD2RFZ7wTE5ha3XQysnDiSnvf8YpT+wb7kCIwOKY4N2cmOFcseH4EBD/0Im4X3byrzHx+Wtc61Afnq4x6cM7suqCzIuWE6bCK/wCJwV8iaIeyoDT0w6L7ZWY9P37x02GNztV114ZyKxuh5QUnrE4t1Ejaf0COtEvdfCrtV+D9fWD0vquopjWHl7GUlXleS0zJt8CM/VS7b7k2YsbJiqDekjFV1AxxHYLPwcz+86TjvpJlb//y/k7CKC47N3VBcHfwmqhrjVZ0mNoSVN/vf+/3UBUW1y4Y8+lNYN1j27PVVp9cHlVGUMlgEPprosLw/7qWlEs+RxH3vOe32EzEwP3XGiQ/9mLijNvRqUNKcMQ9d7PNDIrAuH3MCThs/CQ6bZU6113+7oWppv7VGGvNkMfhCkd6Son528cNTXjmyR6cpI659seGH+28H6dzmOVH3Y92mcvTv04E8MfmHlMUbdx356U9rRkRkbaSsaAU6pWKzEzyurn7FbRX/hOcI9Thsi7rmJD/65t3nLPlkznr6ygPnHPK6mJiY/Ds4a2AHHPu/ObRrpvuDoKSd4ouoHb1BuWBlVPvYYQ0ErCLPIrLOy5qRqBuUFzkOiQ7LD0d1Tl4dUXQUN90nFhvTLJyad0K1hu4T3+MNKb19Jd5nDmQXRwgUzXgB9ZGFDLF76pRhS2VgFEfIqH3LMwZ47ALtkuYqA1DGmmySNENs2kW23/PBAMawnDH2LQD1QHbceFo3nNwz/ecJ769+ekOZ7+6oYqRU+aKn1gakU0SeMwzKOJ0yjjEGkeeMrETbvGO6pr5w4ctL6aKtdWrnNOeDUbc1ORDVRkdkPX23Er5d4MgEniNUMygXD9Z3WPhw92zPO+OH5H+5dFsd6oPKXm0KAAkOERNnbGaLHzn1yxFPzu+4pSL4mKIb9lgZICRp/LDeGSvrg8o3u+vCF6m6IW6tDNy+uy48fmOZTzUMhrCiu1SdOpqeWZuRYPsk47qvaO1b54Pc1dKWtKkHfykmq7ktm55Nacu1o7ok4+Ur397c/56zXt9dbzwbkfXkap/04Mj+2UWqTuty05yzw4o+Y099+PxgVEvZJgXv5nlyB08I0wzKG5QRQggSHJbKvDTni58s2RMe2S8Lp/fPXvjQtI33EIJnoqqRWuOXRtQH5dP27QeB54yOKY6FR3ZOfvmcSYvoN3cP2WucoLld43PtPnssmuvVMpbrgzJemb1N7ZDieEjVaUpI0kZLqpGzsyb8H54nt/GEUJ0y3qCxpU2HVQh77OLEnjmeryoaowhKWqwtW/VnmseGKXO347Qjsj4d+9LStJLq0COqQe1xuw6JwAKA/t07IS8rbXNptXexounnM4Zf9WIBLds5ZVXLKK3xPub1h4emJLief/Tb7xadd9Nk6avXbzzgttA/w1ufLkH3vAz+o+9Xpjw4eWb/qKKNCEbkYWFZ7a6qup2yeGxVPN3Cb6SSJS2B7BaBr0902l7vmpM6eeXW8voFhTtw6xUnHaomNzEx+RdCCMH0lWU4d1DHpSc/8tN5VpEbr2j0eMpYpkGZLRjVYBU52AlfZhMtFSlu64LsRPtbFY3RwNVD8/Fl033y0pwQeS7McaRI1Q0bAakFgHWtntU9ywPEhEwxAD9i6ZIOaBdHCJ/kspR6uqUi2Wmt6Jrp3mJQRg80IcYvOayC5rDyXkIIG/PC4u3dszx5iOXoOiAMjE+wW3ZmJtpp6+Dz1lx/SgEmvL9KPf+Yjs+rOi1sjKjjQ5J2jEFZhqIZvFXkGQPzuW3iHoeF/7Jzhmva16vLGyonn4unvinC1spgxaCuKdeu2tFwXm1APlPRaU8ASZpBYbeIBmWoTnCIG9M8ts8G90yfV1hcr9gtPDqkOPRAVNseljUjM9FejKb4pv+d1xdrn19s9MtNekVSDSul7EIAXHqCbQ/PETmqGNEj85Juk1XjZ1U3zpdUI5fnSHJI0i0CT2C38CGbyJckOMSizET7+4Pyk+dvrQw2z42ZiXa47SLrmuHe7XdrmQQoAaD/Ql9WM7BtNpEP5KY5JMZiy7ovXzkQF768FBzBR6LAHaPptLfNwqeKPDd4za7Gacu21zcO6Z1xo9PKL61slM6UNSOfECQZBoPdIuocR6pdNqEwK9H+/tz/DV/zwaJdGD8kH9mfraP/OaPHh9NXlu+o8cuX+SLqUYQgRzOoaBV5cByCNoEvsVn4acd0TZ3x7tsr6umqW8Hd3WJ3VqINiU5LfdcM10adMjHVbd0D+2BAWtpcJjfVCQJIlLEtsmYkEpAqAOiR40FU0Sv65SZds36P73xvSDlT02lPECRpOoXdwhsMqLZb+FW5qc4vh/XOmB+UdDUr0Y6sRLsGYDsDo5mJ9m3xcXn9Kd0w8qn5au+OiS/bRT45JOujGWM0PcGmHTK3EGMM/c95CB0zkscWl9Z8rGi6ZX9xxABGWpRXq8/jIsUqCmGn3fpTgsvxcVZywpJX7r+w8cMZy+jdN4z4QzYBIAsXb+f+b+4aT3VDsHMgIg2ISOrxiqYfo2h6F91g9ta/kghi9jXnY2EkZjIIQFjTEiFprgpAwPMcddosi1PcjkfPPbnvknXFlca7T4773faamJiY/B7enb8DPXM8/IeLd3sEjqTXBGRbQ0hhBVluqBr1Zyc7Gp68sF903e5GdmSXlL2+u6LEC47AIqmGu+kdKAGIDundEka7sKgGiAWje3AQZ9kyhgjHQeYIsTYlvfxVCMB4ngSjiqHbRN5JGbP91ncEntOTXZYgY2C9Oyb+ii0MnxfuQbdsj/DVirKksKynb6sK8hkJNggcaTy2ILXx+lMKJFWnzCrye31XUnTYrZfh5dkP27ZWBtIUjSZVNUbROd1lqDqtHT2wg//cY17XmfEUCCHYUNoIxsCFZc2jG0zgCJEnzdwafnX8QOQ2HYv2/doKWAROFHjOTZoOObGJfJAArHtOAjx2kTz77Rb7tqpgishzSSU1ISS7LMhMsCkBSasfd1xucPQJk3UmTdzL8bClwg+eI8QbVDxaLDmnjlj+MnqAvnQCsHMcoQ4LHwSgD8xPBQAoqo67Pl2Hscd2cjUl7SQ6ZfLKHd7wQ2OOQDCqwm0XyT2frrPWBuQ0RTOSGsIqCjLdhkXgaq84ubOvpDZkjDsub79+6HXnTLw6fiD/waJdHoeFz9xTHxEzEmxIdlmDndOddbed3kPSDMpa7dprZkFRDRhjIkeIGwDhOBLVdCoN75vVXGb1Ti8AIkRV3UMp4xDL+xUGgCG9M+GPKEh03ognZ9xhK/VG0mTNSKr2ScjPdBuGQWuH98n0l9SE9P+d17d1W3FN414ghMi3vLcqPPPeIc39ubCoBjaRtym64WxyKNFDuu5222Ofwu2wJcxetml6vS80rCWbeXNT/6LAAlh8EwIIIRB4TrGKwtYkj3OFKAiLnHbrlvQkd22XnLTgyON6awOPyjXQcp4SCfgkYeJrP8DmFhxFu6pdlLIMWdVygxG5QNH0voqm99ANlq8ZRiKl8cMdm8RUkx0MDIT9tsBqbafdKlZlJLundMlKfmP9zqr6B0aciHOu+GeetWhiYmJiYmJyYA6pwFq9dg/Ov+s19O/e6YItu6s+UFTNQfYRUb8msOInNLReQyYcAc/xBs9zfovAewFUJbqdkqSoVQ2BiA8AnHarPTMlIbeuMcQTjqTqupHCGFIMSt0GpXzLum3LIdSEtDwPv0NgxdxWBKLAR91267cd0hMmPXPDqHXTF2+i9914art0qomJiYmJiUn7csgjx2995FN0yky2fTl/9Tu1DYFLaFPSuxgHJ7BaLjGw/ZYZmxJ7xhVQqzLxmK74PZrl1F7PI833btkaeDACK4bAc9TtsK1Ncjuf65WbMbOkrD46663r2jxWzMTExMTExOTw4WBP3v7DvPrIJVi4Zpucl5X6jNNuKwH+XIre+BZI0lr0HKhM/O/Nmqklw/qfIR7QyXEcXHbrzrRE190nHNH5rNrG4NScZHd09tvXm+LKxMTExMTkX84hF1gAMOHiU/HFy5M2ZaYkPGQRhQDYn5FY7UN8mzHHEVgFoTzF43hqQLecUUs/uu3FnBRP9abp9+Lem80lQRMTExMTE5NDmKahNSOG9sFFE6bg6B5dpn2zbG23irrGB1VNFw4fRw8DxxG47DZvepLra4/D9lpuYtKmqKFR01tlYmJiYmJisi9/qTq45ZFPkZ2e6Jw+d/XDDaHw7YZBRdI6DuogYrBaDvxribdqzlHVdG3vmC6G2F6/puXB/T4/cAxWPLCeIxwsIl+WleqZ1SM344Mxw/uvLSmt0264xMxnZWJiYmJiYnJg/nL3yxlXvwi33e6s9vkervL6J6iabgXhmjRTOwqspnLx/+c5jtqt4s5El/0rh8Xy4cWnHVkyd/l245MXr/irm8zExMTExMTkMKNd1rceeP4rpCd77FPnrLzaGwg/KKl6OgCQdhJYcW8VIQSiIEguh3VDssc5NcFh++rVe8dUrNlaTkef0rc9msrExMTExMTkMKTdAohe+XAuRp7Ql7v9mc+HVXn9jwci0jGGQZscWfFz/g6dwGrJg0XA84RaRaHSbbfNT/I4vuyZl1n4wn3n+euqQywj23NwFTIxMTExMTExaaJdI7T3VHjR/9xHcdHpR2dv3lV1XWMwcm1EkrMpbfEotZnAar1xkRDwHMdEQfA6bJbVKR7HLLfDNmfcqUfu2Vnh1e67cYSZasHExMTExMTkD/O3UBFffLcK/bp34J946/vepdXeqxqDkfOistohfqr1XsYehMA6UDJSjhCIAq9bBL7a5bButFutP7nt1gW9u2SXPDV5lqRsew1Wq9jeTWFiYmJiYmLyD+BvIbDifDCtEHk5qfw705fkl9U0nBGKyqMjktpbN4xUgzKe7bW819r4lvMD4yKM4zgm8JzE81ytzSLuctqs6xJd9hUZye71x/fLL3932s/Kz1/e/bttNDExMTExMTH5Lf5WAiuOpugQLDy5/7kZrqJdld19oejRUVk9iue5/qGonOxy2nJAIWq6AY7jYLEICEtKHU+4AM+TCosg7BJ4fkuC216c7HaWdMvNqPjfzadL9Q1hlp7qbu/qmZiYmJiYmPzD+X+QaL7NdoS/9AAAACV0RVh0ZGF0ZTpjcmVhdGUAMjAyNi0wNS0xMlQwNzoxMzo1NSswMDowMA3zHLAAAAAldEVYdGRhdGU6bW9kaWZ5ADIwMjYtMDUtMTJUMDc6MTM6NTUrMDA6MDB8rqQMAAAAAElFTkSuQmCC" alt="Üçel">
      <p>Yapısal Çelik · İş Akışı Yönetim Platformu</p>
    </div>
    <div class="login-form">
      <label>Kullanıcı Adı</label>
      <input type="text" id="lu" placeholder="kullanıcı adınız" autocomplete="username">
      <label>Şifre</label>
      <input type="password" id="lp" placeholder="••••••••" autocomplete="current-password">
      <button class="login-btn" onclick="doLogin()">🔐 Giriş Yap</button>
      <div class="login-err" id="le"></div>
      <div class="login-hint">
        💡 <strong>Demo:</strong> Tüm kullanıcılarda şifre <strong>ucel123</strong><br>
        habib (Yönetici) · fatih (Teklif & Projelendirme)<br>
        ahmet (Satın Alma) · murat (Stok/Üretim/Sevkiyat)<br>
        selim (Saha Montajı) · elif (Muhasebe)
      </div>
    </div>
  </div>
</div>

<!-- ========== APP ========== -->
<div id="app">
  <div class="auth-strip">
    <div class="left">
      <button class="menu-btn" onclick="tSidebar()">☰</button>
      <img class="logo-mini" src="data:image/png;base64,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" alt="">
      <div>
        <div class="name" id="aName">-</div>
        <div class="sub" id="aSub">-</div>
      </div>
    </div>
    <div style="display:flex;gap:8px;align-items:center">
      <button class="notif-btn" onclick="tNotif(event)">🔔<span class="notif-badge" id="nBadge">0</span></button>
      <button class="logout-btn" onclick="doLogout()">🚪 Çıkış</button>
    </div>
  </div>

  <div class="sb-overlay" id="sbOv" onclick="tSidebar()"></div>

  <div class="layout">
    <aside class="sidebar" id="sb">
      <div class="sidebar-section">Genel</div>
      <div class="sidebar-item" data-page="overview" data-perm="yonetici" onclick="goto('overview')"><span class="ico">📊</span> Genel Bakış</div>
      <div class="sidebar-item" data-page="projects" data-perm="*" onclick="goto('projects')"><span class="ico">🏗️</span> Projeler <span class="sidebar-badge" id="bP">0</span></div>
      <div class="sidebar-item" data-page="mytasks" data-perm="*" onclick="goto('mytasks')"><span class="ico">✓</span> Görevlerim <span class="sidebar-badge ok" id="bM">0</span></div>

      <div class="sidebar-section">Birimler</div>
      <div class="sidebar-item" data-page="d-teklifproje" data-perm="yonetici,teklifproje" onclick="goto('d-teklifproje')"><span class="ico">📐</span> Teklif & Projelendirme</div>
      <div class="sidebar-item" data-page="d-satinalma" data-perm="yonetici,satinalma" onclick="goto('d-satinalma')"><span class="ico">🛒</span> Satın Alma</div>
      <div class="sidebar-item" data-page="d-stok" data-perm="yonetici,stok,uretim" onclick="goto('d-stok')"><span class="ico">📦</span> Stok</div>
      <div class="sidebar-item" data-page="d-uretim" data-perm="yonetici,uretim" onclick="goto('d-uretim')"><span class="ico">🔧</span> Üretim</div>
      <div class="sidebar-item" data-page="d-sevk" data-perm="yonetici,sevk,uretim" onclick="goto('d-sevk')"><span class="ico">🚚</span> Sevkiyat</div>
      <div class="sidebar-item" data-page="d-montaj" data-perm="yonetici,montaj" onclick="goto('d-montaj')"><span class="ico">🏗️</span> Saha Montajı</div>
      <div class="sidebar-item" data-page="d-muhasebe" data-perm="yonetici,muhasebe" onclick="goto('d-muhasebe')"><span class="ico">💰</span> Muhasebe</div>

      <div class="sidebar-section">Yönetim</div>
      <div class="sidebar-item" data-page="team" data-perm="yonetici" onclick="goto('team')"><span class="ico">👥</span> Ekip</div>
      <div class="sidebar-foot" id="storeInfo">📦 -</div>
    </aside>

    <main class="main">
      <!-- OVERVIEW (sadece yönetici) -->
      <div class="page" id="page-overview">
        <div class="page-h">
          <div><div class="page-title">Genel Bakış</div><div class="page-sub" id="dateInfo"></div></div>
          <div><button class="btn" onclick="openProj()">+ Yeni Proje</button></div>
        </div>
        <div class="banner"><span class="ico">👑</span><div><strong>Yönetici görünümü.</strong> Tüm 7 birimin verilerini görür ve yönetebilirsiniz.</div></div>
        <div class="kpi-grid" id="kpiGrid"></div>
        <div class="section-h"><h2>🏢 Birim Bazlı Özet</h2></div>
        <div class="dept-grid" id="deptGrid"></div>
        <div class="section-h"><h2>👥 Ekip Yükü</h2></div>
        <div class="table-wrap"><table><thead><tr><th>Çalışan</th><th>Birim</th><th>Açık</th><th>Geciken</th><th>Yük</th></tr></thead><tbody id="teamMini"></tbody></table></div>
      </div>

      <!-- PROJECTS -->
      <div class="page" id="page-projects">
        <div class="page-h">
          <div><div class="page-title">Projeler</div><div class="page-sub"><span id="pCount">0</span> aktif proje</div></div>
          <div class="toolbar"><button class="btn sec sm" onclick="window.print()">🖨</button><button class="btn" onclick="openProj()">+ Yeni Proje</button></div>
        </div>
        <div class="table-wrap"><table>
          <thead><tr><th>No</th><th>Müşteri</th><th>Aşama</th><th>Tonaj</th><th>Bedel</th><th>Sevk</th><th>%</th><th>Sorumlu</th><th></th></tr></thead>
          <tbody id="pList"></tbody>
        </table></div>
      </div>

      <!-- MY TASKS -->
      <div class="page" id="page-mytasks">
        <div class="page-h">
          <div><div class="page-title">Görevlerim</div><div class="page-sub" id="mtSub">-</div></div>
          <div><button class="btn" onclick="openTask()">+ Yeni Görev</button></div>
        </div>
        <div id="myList"></div>
      </div>

      <!-- DEPT PAGES (7 birim) -->
      <div class="page" id="page-d-teklifproje"><div class="page-h"><div><div class="page-title">📐 Teklif & Projelendirme</div><div class="page-sub">Müşteri teklifleri + çizim</div></div><div><button class="btn" onclick="openTask('teklifproje')">+ Yeni Görev</button></div></div><div class="banner warn" id="b-teklifproje"></div><div class="kpi-grid" id="dk-teklifproje"></div><div class="section-h"><h2>Görevler</h2></div><div id="d-teklifproje"></div></div>
      <div class="page" id="page-d-satinalma"><div class="page-h"><div><div class="page-title">🛒 Satın Alma</div><div class="page-sub">Sipariş ve tedarikçi</div></div><div><button class="btn" onclick="openTask('satinalma')">+ Yeni Görev</button></div></div><div class="banner warn" id="b-satinalma"></div><div class="kpi-grid" id="dk-satinalma"></div><div class="section-h"><h2>Görevler</h2></div><div id="d-satinalma"></div></div>
      <div class="page" id="page-d-stok"><div class="page-h"><div><div class="page-title">📦 Stok</div><div class="page-sub">Hammadde ve ara mamul</div></div><div><button class="btn" onclick="openTask('stok')">+ Yeni Görev</button></div></div><div class="banner warn" id="b-stok"></div><div class="kpi-grid" id="dk-stok"></div><div class="section-h"><h2>Görevler</h2></div><div id="d-stok"></div></div>
      <div class="page" id="page-d-uretim"><div class="page-h"><div><div class="page-title">🔧 Üretim</div><div class="page-sub">Atölye ve emirler</div></div><div><button class="btn" onclick="openTask('uretim')">+ Yeni Görev</button></div></div><div class="banner warn" id="b-uretim"></div><div class="kpi-grid" id="dk-uretim"></div><div class="section-h"><h2>Görevler</h2></div><div id="d-uretim"></div></div>
      <div class="page" id="page-d-sevk"><div class="page-h"><div><div class="page-title">🚚 Sevkiyat</div><div class="page-sub">Sevk planı ve lojistik</div></div><div><button class="btn" onclick="openTask('sevk')">+ Yeni Görev</button></div></div><div class="banner warn" id="b-sevk"></div><div class="kpi-grid" id="dk-sevk"></div><div class="section-h"><h2>Görevler</h2></div><div id="d-sevk"></div></div>
      <div class="page" id="page-d-montaj"><div class="page-h"><div><div class="page-title">🏗️ Saha Montajı</div><div class="page-sub">Şantiye ve günlük rapor</div></div><div><button class="btn" onclick="openTask('montaj')">+ Yeni Görev</button></div></div><div class="banner warn" id="b-montaj"></div><div class="kpi-grid" id="dk-montaj"></div><div class="section-h"><h2>Görevler</h2></div><div id="d-montaj"></div></div>
      <div class="page" id="page-d-muhasebe"><div class="page-h"><div><div class="page-title">💰 Muhasebe</div><div class="page-sub">Fatura ve tahsilat</div></div><div><button class="btn" onclick="openTask('muhasebe')">+ Yeni Görev</button></div></div><div class="banner warn" id="b-muhasebe"></div><div class="kpi-grid" id="dk-muhasebe"></div><div class="section-h"><h2>Görevler</h2></div><div id="d-muhasebe"></div></div>

      <!-- TEAM -->
      <div class="page" id="page-team">
        <div class="page-h"><div><div class="page-title">👥 Ekip</div><div class="page-sub">Tüm çalışanlar ve yük</div></div></div>
        <div class="dept-grid" id="teamGrid"></div>
      </div>
    </main>
  </div>
</div>

<!-- ========== NOTIF PANEL ========== -->
<div class="notif-panel" id="nPanel" onclick="event.stopPropagation()">
  <div class="notif-h"><span>🔔 Bildirimler (Tüm Birimler)</span><button onclick="markAllRead()" style="background:transparent;border:none;color:var(--pl);font-size:11px;cursor:pointer;font-weight:600">Hepsini okundu say</button></div>
  <div class="notif-list" id="nList"></div>
</div>

<!-- ========== PROJECT MODAL ========== -->
<div class="modal-bg" id="pModal">
  <div class="modal">
    <div class="modal-h"><h3 id="pmTitle">Yeni Proje</h3><button class="x" onclick="closeProj()">✕</button></div>
    <div class="modal-b">
      <div class="fgrid">
        <div class="frow"><label>Proje No</label><input id="pf-no" placeholder="2026-027"></div>
        <div class="frow"><label>Müşteri</label><input id="pf-cust" placeholder="ABC İnşaat"></div>
      </div>
      <div class="frow"><label>Proje Adı</label><input id="pf-title" placeholder="Sancaktepe Depo Çatı"></div>
      <div class="fgrid">
        <div class="frow"><label>Lokasyon</label><input id="pf-loc" placeholder="İstanbul"></div>
        <div class="frow"><label>Bedel (TL)</label><input id="pf-amt" type="number" placeholder="0"></div>
        <div class="frow"><label>Tonaj (kg)</label><input id="pf-ton" type="number" step="0.1" placeholder="0"></div>
        <div class="frow"><label>Sevk Tarihi</label><input id="pf-ship" type="date"></div>
      </div>
      <div class="frow"><label>Aşama</label><select id="pf-stage">
        <option value="teklifproje">📐 Teklif & Projelendirme</option>
        <option value="satinalma">🛒 Satın Alma</option>
        <option value="uretim" selected>🔧 Üretim</option>
        <option value="sevk">🚚 Sevkiyat</option>
        <option value="montaj">🏗️ Saha Montajı</option>
        <option value="tamamlandi">✅ Tamamlandı</option>
      </select></div>
      <div class="frow"><label>Sorumlu</label><select id="pf-own"></select></div>
      <div class="fgrid">
        <div class="frow"><label>İlerleme %</label><input id="pf-prog" type="number" min="0" max="100" value="0"></div>
        <div class="frow"><label>&nbsp;</label></div>
      </div>
      <div class="frow"><label>Notlar</label><textarea id="pf-notes"></textarea></div>
    </div>
    <div class="modal-f">
      <button class="btn err" id="pfDel" style="margin-right:auto;display:none" onclick="delProj()">🗑 Sil</button>
      <button class="btn sec" onclick="closeProj()">Vazgeç</button>
      <button class="btn ok" onclick="saveProj()">💾 Kaydet</button>
    </div>
  </div>
</div>

<!-- ========== TASK MODAL ========== -->
<div class="modal-bg" id="tModal">
  <div class="modal">
    <div class="modal-h"><h3 id="tmTitle">Yeni Görev</h3><button class="x" onclick="closeTask()">✕</button></div>
    <div class="modal-b">
      <div class="frow"><label>Başlık</label><input id="tf-title" placeholder="Görev açıklaması"></div>
      <div class="fgrid">
        <div class="frow"><label>Birim</label><select id="tf-dept">
          <option value="teklifproje">📐 Teklif & Projelendirme</option>
          <option value="satinalma">🛒 Satın Alma</option>
          <option value="stok">📦 Stok</option>
          <option value="uretim">🔧 Üretim</option>
          <option value="sevk">🚚 Sevkiyat</option>
          <option value="montaj">🏗️ Saha Montajı</option>
          <option value="muhasebe">💰 Muhasebe</option>
        </select></div>
        <div class="frow"><label>Atanan</label><select id="tf-as"></select></div>
        <div class="frow"><label>Bitiş</label><input id="tf-due" type="date"></div>
        <div class="frow"><label>Öncelik</label><select id="tf-pri">
          <option value="low">Düşük</option>
          <option value="medium" selected>Normal</option>
          <option value="high">Yüksek</option>
          <option value="urgent">Acil</option>
        </select></div>
      </div>
      <div class="frow"><label>Bağlı Proje</label><select id="tf-pr"></select></div>
      <div class="frow"><label>Açıklama</label><textarea id="tf-desc"></textarea></div>
    </div>
    <div class="modal-f">
      <button class="btn err" id="tfDel" style="margin-right:auto;display:none" onclick="delTask()">🗑 Sil</button>
      <button class="btn sec" onclick="closeTask()">Vazgeç</button>
      <button class="btn ok" onclick="saveTask()">💾 Kaydet</button>
    </div>
  </div>
</div>

<div class="toast-wrap" id="toasts"></div>

<script>
/* ============ DATA & USERS ============ */
const SK = 'ucel_v6';
const DN = {teklifproje:'Teklif & Projelendirme',satinalma:'Satın Alma',stok:'Stok',uretim:'Üretim',sevk:'Sevkiyat',montaj:'Saha Montajı',muhasebe:'Muhasebe'};
const DI = {teklifproje:'📐',satinalma:'🛒',stok:'📦',uretim:'🔧',sevk:'🚚',montaj:'🏗️',muhasebe:'💰'};
const ALL_D = ['teklifproje','satinalma','stok','uretim','sevk','montaj','muhasebe'];
const SP = {teklifproje:'pl-purple',satinalma:'pl-cyan',uretim:'pl-orange',sevk:'pl-blue',montaj:'pl-green',muhasebe:'pl-red',tamamlandi:'pl-gray',stok:'pl-cyan'};
const PRI = {low:'pl-gray',medium:'pl-blue',high:'pl-orange',urgent:'pl-red'};
const PRL = {low:'Düşük',medium:'Normal',high:'Yüksek',urgent:'Acil'};
const DCH = {teklifproje:'dh-tp',satinalma:'dh-sa',stok:'dh-st',uretim:'dh-ur',sevk:'dh-sv',montaj:'dh-mn',muhasebe:'dh-mu'};

// USERS - kullanıcı adı + şifre + rol + yetki
const USERS = {
  habib:    {pw:'ucel123',id:'u1',name:'Habib İlgin',ini:'Hİ',role:'yonetici',label:'👑 Yönetici - Tam Yetki',color:'#1f4e8c',perms:['*']},
  fatih:    {pw:'ucel123',id:'u3',name:'Fatih Kaya',ini:'FK',role:'teklifproje',label:'📐 Teklif & Projelendirme',color:'#27ae60',perms:['teklifproje']},
  ahmet:    {pw:'ucel123',id:'u4',name:'Ahmet Yıldız',ini:'AY',role:'satinalma',label:'🛒 Satın Alma',color:'#1f4e8c',perms:['satinalma','stok']},
  murat:    {pw:'ucel123',id:'u5',name:'Murat Korkmaz',ini:'MK',role:'uretim',label:'🔧 Stok / Üretim / Sevkiyat',color:'#e74c3c',perms:['stok','uretim','sevk']},
  selim:    {pw:'ucel123',id:'u6',name:'Selim Erdoğan',ini:'SE',role:'montaj',label:'🏗️ Saha Şefi',color:'#27ae60',perms:['montaj']},
  elif:     {pw:'ucel123',id:'u7',name:'Elif Nazlı',ini:'EN',role:'muhasebe',label:'💰 Muhasebe',color:'#f39c12',perms:['muhasebe']}
};

let state = null;
let me = null;
let editP = null, editT = null;

function load(){
  try{const r=localStorage.getItem(SK);if(r){state=JSON.parse(r);return}}catch(e){}
  state=seed();save();
}
function save(){try{localStorage.setItem(SK,JSON.stringify(state));uStore()}catch(e){toast('Kayıt hatası: '+e.message,'err')}}
function uStore(){const s=document.getElementById('storeInfo');if(s)s.innerHTML=`📦 ${state.projects.length} proje · ${state.tasks.length} görev`}

function seed(){
  const t=new Date(),d=n=>{const x=new Date(t);x.setDate(x.getDate()+n);return x.toISOString().slice(0,10)};
  return {
    projects:[
      {id:'p1',no:'2026-018',customer:'ABC İnşaat',title:'Sancaktepe Depo - Çatı',location:'Sancaktepe',amount:410500,tonnage:12.4,shipdate:d(2),stage:'sevk',progress:78,ownerId:'u5',notes:''},
      {id:'p2',no:'2026-019',customer:'GHI San.',title:'Gebze Üretim Holü',location:'Gebze',amount:520000,tonnage:15.2,shipdate:d(25),stage:'uretim',progress:30,ownerId:'u5',notes:''},
      {id:'p3',no:'2026-021',customer:'XYZ Lojistik',title:'Hadımköy Antrepo',location:'Hadımköy',amount:295000,tonnage:8.7,shipdate:d(11),stage:'uretim',progress:45,ownerId:'u5',notes:''},
      {id:'p4',no:'2026-022',customer:'DEF Mimarlık',title:'Çerkezköy Fabrika',location:'Çerkezköy',amount:980000,tonnage:28.5,shipdate:d(18),stage:'montaj',progress:62,ownerId:'u3',notes:'Revize'},
      {id:'p5',no:'2026-024',customer:'KLM Yapı',title:'Tuzla Showroom',location:'Tuzla',amount:180000,tonnage:5.2,shipdate:'',stage:'teklifproje',progress:15,ownerId:'u3',notes:'Cevap bekleniyor'},
      {id:'p6',no:'2026-025',customer:'NOP İnş.',title:'Bursa Hangar',location:'Bursa',amount:340000,tonnage:9.8,shipdate:d(35),stage:'teklifproje',progress:25,ownerId:'u3',notes:''},
      {id:'p7',no:'2026-026',customer:'QRS Holding',title:'Ankara Plaza',location:'Ankara',amount:780000,tonnage:22.3,shipdate:d(50),stage:'satinalma',progress:18,ownerId:'u4',notes:''}
    ],
    tasks:[
      {id:'t1',title:'ABC sevk irsaliyesi hazırla',dept:'sevk',projectId:'p1',assigneeId:'u5',due:d(0),priority:'urgent',desc:'',done:false,created:Date.now()},
      {id:'t2',title:'Demir Çelik siparişini onayla',dept:'satinalma',projectId:'p2',assigneeId:'u4',due:d(-1),priority:'high',desc:'',done:false,created:Date.now()},
      {id:'t3',title:'XYZ kaynak QC kontrol',dept:'uretim',projectId:'p3',assigneeId:'u5',due:d(0),priority:'high',desc:'',done:false,created:Date.now()},
      {id:'t4',title:'DEF günlük saha raporu',dept:'montaj',projectId:'p4',assigneeId:'u6',due:d(0),priority:'medium',desc:'',done:false,created:Date.now()},
      {id:'t5',title:'Logo cariler senkronu',dept:'muhasebe',projectId:'',assigneeId:'u7',due:d(-2),priority:'low',desc:'',done:true,created:Date.now()},
      {id:'t6',title:'KLM teklif revizesi + çizim',dept:'teklifproje',projectId:'p5',assigneeId:'u3',due:d(2),priority:'medium',desc:'',done:false,created:Date.now()},
      {id:'t7',title:'NOP çizim + statik hesap',dept:'teklifproje',projectId:'p6',assigneeId:'u3',due:d(5),priority:'medium',desc:'',done:false,created:Date.now()},
      {id:'t8',title:'2026-022 hak ediş tablosu',dept:'muhasebe',projectId:'p4',assigneeId:'u7',due:d(4),priority:'medium',desc:'',done:false,created:Date.now()},
      {id:'t9',title:'HEA 240 stok kritik - sipariş aç',dept:'satinalma',projectId:'',assigneeId:'u4',due:d(0),priority:'urgent',desc:'',done:false,created:Date.now()},
      {id:'t10',title:'Atölye günlük temizlik',dept:'uretim',projectId:'',assigneeId:'u5',due:d(0),priority:'low',desc:'',done:false,created:Date.now()}
    ],
    notifs:[
      {id:'n1',text:'KLM Yapı teklif cevabı bekleniyor (8 gün)',ts:Date.now()-3600000,icon:'📝',read:false,dept:'teklifproje'},
      {id:'n2',text:'HEA 240 stok kritik seviyede',ts:Date.now()-7200000,icon:'⚠️',read:false,dept:'stok'},
      {id:'n3',text:'2026-022 DEF revize çizim yüklendi',ts:Date.now()-14400000,icon:'📐',read:false,dept:'teklifproje'}
    ]
  };
}

/* ============ AUTH ============ */
function doLogin(){
  const u=document.getElementById('lu').value.trim().toLowerCase();
  const p=document.getElementById('lp').value;
  const err=document.getElementById('le');
  err.textContent='';
  if(!u||!p){err.textContent='Kullanıcı adı ve şifre gerekli';return}
  const usr=USERS[u];
  if(!usr||usr.pw!==p){err.textContent='Kullanıcı adı veya şifre hatalı';return}
  me=usr;
  sessionStorage.setItem('ucel_user',u);
  document.getElementById('login').classList.add('hidden');
  document.getElementById('app').classList.add('show');
  initApp();
}
function doLogout(){
  if(!confirm('Çıkış yapmak istediğinize emin misiniz?'))return;
  sessionStorage.removeItem('ucel_user');
  me=null;
  document.getElementById('login').classList.remove('hidden');
  document.getElementById('app').classList.remove('show');
  document.getElementById('lu').value='';
  document.getElementById('lp').value='';
}

/* ============ INIT & ROUTING ============ */
function initApp(){
  document.getElementById('aName').textContent=me.name;
  document.getElementById('aSub').textContent=me.label;
  // av background
  const sa=document.querySelectorAll('.auth-strip .av');
  sa.forEach(a=>{a.style.background=me.color;a.textContent=me.ini});
  // Add av if not exists
  if(sa.length===0){
    const left=document.querySelector('.auth-strip .left');
    const av=document.createElement('div');av.className='av';av.style.background=me.color;av.textContent=me.ini;
    left.insertBefore(av,document.querySelector('.auth-strip .left > div:last-child'));
  }
  document.getElementById('dateInfo').textContent=new Date().toLocaleDateString('tr-TR',{weekday:'long',day:'numeric',month:'long',year:'numeric'});
  applyPerms();
  renderAll();
  const def=me.role==='yonetici'?'overview':(me.perms[0]==='*'?'overview':'d-'+me.perms[0]);
  goto(def);
}
function applyPerms(){
  document.querySelectorAll('.sidebar-item').forEach(i=>{
    const p=i.dataset.perm;
    if(!p||p==='*'){i.style.display='flex';return}
    const ok=me.perms.includes('*')||p.split(',').includes(me.role)||p.split(',').some(x=>me.perms.includes(x));
    i.style.display=ok?'flex':'none';
  });
}
function goto(id){
  const it=document.querySelector(`[data-page="${id}"]`);
  if(it&&it.style.display==='none'){toast('Bu sayfaya erişim yetkiniz yok','err');return}
  document.querySelectorAll('.page').forEach(p=>p.classList.remove('show'));
  const pg=document.getElementById('page-'+id);
  if(pg)pg.classList.add('show');
  document.querySelectorAll('.sidebar-item').forEach(i=>i.classList.remove('active'));
  if(it)it.classList.add('active');
  document.getElementById('sb').classList.remove('show');
  document.getElementById('sbOv').classList.remove('show');
  if(id==='overview')renderOverview();
  if(id==='projects')renderProjects();
  if(id==='mytasks')renderMyTasks();
  if(id==='team')renderTeam();
  if(id.startsWith('d-'))renderDept(id.substring(2));
  window.scrollTo({top:0,behavior:'smooth'});
}
function tSidebar(){
  document.getElementById('sb').classList.toggle('show');
  document.getElementById('sbOv').classList.toggle('show');
}

/* ============ RENDERS ============ */
function uBadges(){
  document.getElementById('bP').textContent=state.projects.filter(p=>p.stage!=='tamamlandi').length;
  document.getElementById('bM').textContent=state.tasks.filter(t=>t.assigneeId===me.id&&!t.done).length;
}
function renderAll(){
  if(me.role==='yonetici')renderOverview();
  renderProjects();renderMyTasks();renderTeam();
  ALL_D.forEach(d=>renderDept(d));
  renderNotifs();uBadges();uStore();
}
function renderOverview(){
  const op=state.projects.filter(p=>p.stage!=='tamamlandi');
  const ot=state.tasks.filter(t=>!t.done);
  const td=new Date().toISOString().slice(0,10);
  const ov=ot.filter(t=>t.due&&t.due<td);
  const ttl=op.reduce((s,p)=>s+(+p.amount||0),0);
  const tn=op.reduce((s,p)=>s+(+p.tonnage||0),0);
  document.getElementById('kpiGrid').innerHTML=`
    <div class="kpi"><div class="kpi-label">Açık Proje</div><div class="kpi-val">${op.length}</div><div class="kpi-sub">Tüm birimler</div></div>
    <div class="kpi ok"><div class="kpi-label">Toplam Tonaj</div><div class="kpi-val g">${tn.toFixed(1)} t</div><div class="kpi-sub">Aktif</div></div>
    <div class="kpi err"><div class="kpi-label">Geciken</div><div class="kpi-val r">${ov.length}</div><div class="kpi-sub">Acil aksiyon</div></div>
    <div class="kpi"><div class="kpi-label">Açık Görev</div><div class="kpi-val">${ot.length}</div><div class="kpi-sub">Tüm ekip</div></div>
    <div class="kpi ok"><div class="kpi-label">Aktif Ciro</div><div class="kpi-val g">${(ttl/1000).toFixed(0)}K TL</div><div class="kpi-sub">Sözleşme</div></div>
    <div class="kpi w"><div class="kpi-label">Teklif/Çizim</div><div class="kpi-val">${state.projects.filter(p=>p.stage==='teklifproje').length}</div><div class="kpi-sub">Hazırlık</div></div>`;
  document.getElementById('deptGrid').innerHTML=ALL_D.map(d=>{
    const dt=state.tasks.filter(t=>t.dept===d);
    const o=dt.filter(t=>!t.done),ovd=o.filter(t=>t.due&&t.due<td);
    const pr=state.projects.filter(p=>p.stage===d);
    return `<div class="dept-card" onclick="goto('d-${d}')">
      <div class="dept-head ${DCH[d]}"><span class="nm">${DN[d]}</span><span class="ic">${DI[d]}</span></div>
      <div class="dept-body">
        <div class="row"><span class="lbl">Açık görev</span><span class="val">${o.length}</span></div>
        <div class="row"><span class="lbl">Geciken</span><span class="val ${ovd.length>0?'r':'g'}">${ovd.length}</span></div>
        <div class="row"><span class="lbl">Aktif proje</span><span class="val">${pr.length}</span></div>
        <div class="row"><span class="lbl">Tamamlanan</span><span class="val g">${dt.filter(t=>t.done).length}</span></div>
      </div></div>`;
  }).join('');
  // Team mini
  const uu={};Object.values(USERS).forEach(u=>{uu[u.id]=u});
  document.getElementById('teamMini').innerHTML=Object.values(uu).filter(u=>u.role!=='yonetici').map(u=>{
    const ts=state.tasks.filter(t=>t.assigneeId===u.id&&!t.done);
    const od=ts.filter(t=>t.due&&t.due<td);
    return `<tr><td><span class="av-mini" style="background:${u.color}">${u.ini}</span> ${u.name}</td>
      <td>${u.label.replace(/^[^\s]+ /,'')}</td><td>${ts.length}</td>
      <td><span class="pill ${od.length>0?'pl-red':'pl-green'}">${od.length}</span></td>
      <td><div class="progress"><div class="pbar" style="width:${Math.min(ts.length*8,100)}%${ts.length>10?';background:linear-gradient(90deg,var(--err),#c0392b)':''}"></div></div></td></tr>`;
  }).join('');
}
function renderProjects(){
  const tb=document.getElementById('pList');if(!tb)return;
  const td=new Date().toISOString().slice(0,10);
  tb.innerHTML=state.projects.map(p=>{
    const o=Object.values(USERS).find(u=>u.id===p.ownerId)||{ini:'?',color:'#999'};
    const lt=p.shipdate&&p.shipdate<td?'style="color:var(--err);font-weight:700"':'';
    return `<tr class="click" onclick="openProj('${p.id}')">
      <td><strong>${p.no}</strong></td><td>${p.customer}</td>
      <td><span class="pill ${SP[p.stage]||'pl-gray'}">${DI[p.stage]||''} ${DN[p.stage]||p.stage}</span></td>
      <td>${p.tonnage} t</td><td>${p.amount?(p.amount/1000).toFixed(0)+'K':'-'}</td>
      <td ${lt}>${p.shipdate||'-'}</td>
      <td><div class="progress"><div class="pbar" style="width:${p.progress}%"></div></div></td>
      <td><span class="av-mini" style="background:${o.color}">${o.ini}</span></td>
      <td><button class="icon-btn" onclick="event.stopPropagation();openProj('${p.id}')">✏️</button></td>
    </tr>`;
  }).join('');
  document.getElementById('pCount').textContent=state.projects.length;
}
function renderMyTasks(){
  const mt=state.tasks.filter(t=>t.assigneeId===me.id);
  document.getElementById('mtSub').textContent=`${mt.filter(t=>!t.done).length} açık · ${mt.filter(t=>t.done).length} tamamlandı`;
  document.getElementById('myList').innerHTML=renderTL(mt);
}
function renderDept(d){
  const tasks=state.tasks.filter(t=>t.dept===d);
  const open=tasks.filter(t=>!t.done);
  const td=new Date().toISOString().slice(0,10);
  const ov=open.filter(t=>t.due&&t.due<td);
  const pr=state.projects.filter(p=>p.stage===d);
  const dk=document.getElementById('dk-'+d);
  if(dk)dk.innerHTML=`
    <div class="kpi"><div class="kpi-label">Açık Görev</div><div class="kpi-val">${open.length}</div></div>
    <div class="kpi err"><div class="kpi-label">Geciken</div><div class="kpi-val r">${ov.length}</div></div>
    <div class="kpi ok"><div class="kpi-label">Tamamlanan</div><div class="kpi-val g">${tasks.filter(t=>t.done).length}</div></div>
    <div class="kpi"><div class="kpi-label">Aktif Proje</div><div class="kpi-val">${pr.length}</div></div>`;
  const b=document.getElementById('b-'+d);
  if(b){
    if(me.role==='yonetici'){b.innerHTML='<span class="ico">👑</span><div><strong>Yönetici görünümü.</strong> Bu birimi yönetebilirsiniz.</div>';b.className='banner'}
    else{b.innerHTML='<span class="ico">🔒</span><div><strong>Sınırlı erişim.</strong> Bu birimi düzenleyebilirsiniz.</div>';b.className='banner warn'}
  }
  const el=document.getElementById('d-'+d);if(el)el.innerHTML=renderTL(tasks);
}
function renderTL(tasks){
  if(tasks.length===0)return '<div style="text-align:center;padding:30px;color:var(--m)">Görev yok. Üstteki <strong>+ Yeni Görev</strong> butonunu kullanın.</div>';
  tasks.sort((a,b)=>(a.done?1:0)-(b.done?1:0)||(a.due||'').localeCompare(b.due||''));
  const td=new Date().toISOString().slice(0,10);
  return tasks.map(t=>{
    const a=Object.values(USERS).find(u=>u.id===t.assigneeId)||{ini:'?',color:'#999',name:'?'};
    const p=state.projects.find(x=>x.id===t.projectId);
    const ov=t.due&&t.due<td&&!t.done;
    return `<div class="task-card ${t.done?'done':''}">
      <div class="check ${t.done?'checked':''}" onclick="toggle('${t.id}')"></div>
      <div class="task-info" onclick="openTask(null,'${t.id}')">
        <div class="task-title ${t.done?'done':''}">${esc(t.title)}</div>
        <div class="task-sub">
          <span class="pill ${PRI[t.priority]||'pl-gray'}">${PRL[t.priority]||t.priority}</span>
          <span>${DI[t.dept]} ${DN[t.dept]}</span>
          ${p?`<span>· ${p.no}</span>`:''}
          ${t.due?`<span class="${ov?'due':''}">${ov?'⏰ Gecikmiş':'📅'} ${t.due}</span>`:''}
        </div>
      </div>
      <span class="av-mini" style="background:${a.color}" title="${a.name}">${a.ini}</span>
      <div class="task-actions"><button class="icon-btn" onclick="openTask(null,'${t.id}')">✏️</button></div>
    </div>`;
  }).join('');
}
function renderTeam(){
  const td=new Date().toISOString().slice(0,10);
  const uu={};Object.values(USERS).forEach(u=>{uu[u.id]=u});
  document.getElementById('teamGrid').innerHTML=Object.values(uu).map(u=>{
    const ts=state.tasks.filter(t=>t.assigneeId===u.id&&!t.done);
    const od=ts.filter(t=>t.due&&t.due<td);
    return `<div style="background:#fff;padding:18px;border-radius:12px;box-shadow:0 1px 4px rgba(0,0,0,.05)">
      <div style="display:flex;gap:14px;align-items:center">
        <div style="width:54px;height:54px;border-radius:50%;background:${u.color};color:#fff;font-weight:800;font-size:18px;display:flex;align-items:center;justify-content:center">${u.ini}</div>
        <div><div style="font-weight:700">${u.name}</div><div style="font-size:11px;color:var(--m)">${u.label}</div></div>
      </div>
      <div style="margin-top:14px;display:flex;justify-content:space-between;font-size:12px">
        <div><div style="font-size:20px;font-weight:800">${ts.length}</div><div style="color:var(--m);font-size:11px">Açık</div></div>
        <div><div style="font-size:20px;font-weight:800;color:${od.length?'var(--err)':'var(--ok)'}">${od.length}</div><div style="color:var(--m);font-size:11px">Geciken</div></div>
        <div><div style="font-size:20px;font-weight:800">${state.tasks.filter(t=>t.assigneeId===u.id&&t.done).length}</div><div style="color:var(--m);font-size:11px">Bitti</div></div>
      </div></div>`;
  }).join('');
}
function renderNotifs(){
  const l=document.getElementById('nList');
  const s=[...state.notifs].sort((a,b)=>(b.ts||0)-(a.ts||0));
  l.innerHTML=s.length===0?'<div style="padding:24px;text-align:center;color:var(--m);font-size:12px">Bildirim yok</div>'
    :s.slice(0,30).map(n=>{
      const ago=ta(n.ts);
      const dl=DN[n.dept]?`<span style="background:#f1f4f8;padding:1px 6px;border-radius:8px;font-size:9px">${DN[n.dept]}</span>`:'';
      const ub=!n.read?'background:#eff6ff;border-left:3px solid var(--pl)':'';
      return `<div class="notif-item" style="${ub}" onclick="markRead('${n.id}')">
        <div style="display:flex;gap:6px"><span>${n.icon}</span><div style="flex:1">${esc(n.text)}<div class="when">⏱️ ${ago} ${dl}</div></div></div></div>`;
    }).join('');
  const u=state.notifs.filter(n=>!n.read).length;
  const b=document.getElementById('nBadge');
  b.textContent=u;b.style.display=u>0?'inline-block':'none';
}
function ta(ts){const d=Math.floor((Date.now()-ts)/1000);if(d<60)return'az önce';if(d<3600)return Math.floor(d/60)+' dk önce';if(d<86400)return Math.floor(d/3600)+' saat önce';return Math.floor(d/86400)+' gün önce'}
function markRead(id){const n=state.notifs.find(x=>x.id===id);if(n)n.read=true;save();renderNotifs()}
function markAllRead(){state.notifs.forEach(n=>n.read=true);save();renderNotifs();toast('Tüm bildirimler okundu','info')}
function tNotif(e){if(e)e.stopPropagation();document.getElementById('nPanel').classList.toggle('show')}
document.addEventListener('click',()=>document.getElementById('nPanel').classList.remove('show'));

/* ============ NOTIFICATIONS BROADCAST ============ */
function notify(text,icon,dept){
  const n={id:'n'+Date.now()+Math.random().toString(36).slice(2,5),text,icon:icon||'🔔',ts:Date.now(),read:false,dept:dept||'system'};
  state.notifs.unshift(n);
  if(state.notifs.length>50)state.notifs=state.notifs.slice(0,50);
}

/* ============ PROJECT CRUD ============ */
function openProj(id){
  editP=id||null;
  const sel=document.getElementById('pf-own');
  const uu={};Object.values(USERS).forEach(u=>{uu[u.id]=u});
  sel.innerHTML=Object.values(uu).map(u=>`<option value="${u.id}">${u.label} - ${u.name}</option>`).join('');
  if(id){
    const p=state.projects.find(x=>x.id===id);
    document.getElementById('pmTitle').textContent='Proje Düzenle';
    document.getElementById('pf-no').value=p.no;
    document.getElementById('pf-cust').value=p.customer;
    document.getElementById('pf-title').value=p.title;
    document.getElementById('pf-loc').value=p.location;
    document.getElementById('pf-amt').value=p.amount;
    document.getElementById('pf-ton').value=p.tonnage;
    document.getElementById('pf-ship').value=p.shipdate;
    document.getElementById('pf-stage').value=p.stage;
    document.getElementById('pf-own').value=p.ownerId;
    document.getElementById('pf-prog').value=p.progress;
    document.getElementById('pf-notes').value=p.notes||'';
    document.getElementById('pfDel').style.display=me.role==='yonetici'?'inline-flex':'none';
  } else {
    document.getElementById('pmTitle').textContent='Yeni Proje';
    ['pf-no','pf-cust','pf-title','pf-loc','pf-amt','pf-ton','pf-ship','pf-notes'].forEach(x=>document.getElementById(x).value='');
    document.getElementById('pf-no').value='P-'+Date.now().toString().slice(-4);
    document.getElementById('pf-stage').value='teklifproje';
    document.getElementById('pf-prog').value='0';
    document.getElementById('pfDel').style.display='none';
  }
  document.getElementById('pModal').classList.add('show');
}
function closeProj(){document.getElementById('pModal').classList.remove('show');editP=null}
function saveProj(){
  const d={no:document.getElementById('pf-no').value.trim(),customer:document.getElementById('pf-cust').value.trim(),
    title:document.getElementById('pf-title').value.trim(),location:document.getElementById('pf-loc').value.trim(),
    amount:+document.getElementById('pf-amt').value||0,tonnage:+document.getElementById('pf-ton').value||0,
    shipdate:document.getElementById('pf-ship').value,stage:document.getElementById('pf-stage').value,
    ownerId:document.getElementById('pf-own').value,progress:+document.getElementById('pf-prog').value||0,
    notes:document.getElementById('pf-notes').value};
  if(!d.no||!d.customer||!d.title){toast('Proje No, Müşteri ve Adı zorunlu','err');return}
  if(editP){
    const p=state.projects.find(x=>x.id===editP);
    const oS=p.stage;
    Object.assign(p,d);
    toast('Proje güncellendi: '+d.no,'info');
    notify(`✏️ ${me.name} "${d.no} ${d.customer}" projesini güncelledi`,'📝',me.role);
    if(oS!==d.stage)notify(`🔄 ${d.no} aşaması: ${DN[oS]||oS} → ${DN[d.stage]||d.stage}`,'🔄',me.role);
  } else {
    state.projects.push({id:'p'+Date.now(),...d});
    toast('Yeni proje eklendi: '+d.no,'ok');
    notify(`🆕 ${me.name} yeni proje açtı: ${d.no} - ${d.customer}`,'🏗️',me.role);
  }
  save();renderAll();closeProj();
}
function delProj(){
  if(!confirm('Bu proje silinsin mi?'))return;
  const p=state.projects.find(x=>x.id===editP);
  const inf=p?`${p.no} ${p.customer}`:'proje';
  state.projects=state.projects.filter(p=>p.id!==editP);
  state.tasks=state.tasks.filter(t=>t.projectId!==editP);
  notify(`🗑️ ${me.name} "${inf}" projesini sildi`,'🗑️',me.role);
  toast('Proje silindi','w');save();renderAll();closeProj();
}

/* ============ TASK CRUD ============ */
function openTask(dept,id){
  editT=id||null;
  const ass=document.getElementById('tf-as');
  const uu={};Object.values(USERS).forEach(u=>{uu[u.id]=u});
  ass.innerHTML=Object.values(uu).map(u=>`<option value="${u.id}">${u.label} - ${u.name}</option>`).join('');
  const ps=document.getElementById('tf-pr');
  ps.innerHTML='<option value="">— Proje yok —</option>'+state.projects.map(p=>`<option value="${p.id}">${p.no} · ${p.customer}</option>`).join('');
  if(id){
    const t=state.tasks.find(x=>x.id===id);
    document.getElementById('tmTitle').textContent='Görev Düzenle';
    document.getElementById('tf-title').value=t.title;
    document.getElementById('tf-dept').value=t.dept;
    document.getElementById('tf-as').value=t.assigneeId;
    document.getElementById('tf-due').value=t.due||'';
    document.getElementById('tf-pri').value=t.priority;
    document.getElementById('tf-pr').value=t.projectId||'';
    document.getElementById('tf-desc').value=t.desc||'';
    document.getElementById('tfDel').style.display='inline-flex';
  } else {
    document.getElementById('tmTitle').textContent='Yeni Görev';
    document.getElementById('tf-title').value='';
    document.getElementById('tf-dept').value=dept||(me.role==='yonetici'?'teklifproje':me.role);
    document.getElementById('tf-as').value=me.id;
    document.getElementById('tf-due').value=new Date().toISOString().slice(0,10);
    document.getElementById('tf-pri').value='medium';
    document.getElementById('tf-pr').value='';
    document.getElementById('tf-desc').value='';
    document.getElementById('tfDel').style.display='none';
  }
  document.getElementById('tModal').classList.add('show');
}
function closeTask(){document.getElementById('tModal').classList.remove('show');editT=null}
function saveTask(){
  const d={title:document.getElementById('tf-title').value.trim(),dept:document.getElementById('tf-dept').value,
    assigneeId:document.getElementById('tf-as').value,due:document.getElementById('tf-due').value,
    priority:document.getElementById('tf-pri').value,projectId:document.getElementById('tf-pr').value,
    desc:document.getElementById('tf-desc').value};
  if(!d.title){toast('Başlık zorunlu','err');return}
  const an=Object.values(USERS).find(u=>u.id===d.assigneeId)||{name:'birim'};
  if(editT){
    const t=state.tasks.find(x=>x.id===editT);
    const oD=t.dept,oA=t.assigneeId;
    Object.assign(t,d);
    toast('Görev güncellendi','info');
    notify(`✏️ ${me.name} "${d.title}" görevini güncelledi (${DN[d.dept]})`,DI[d.dept]||'📝',me.role);
    if(oD!==d.dept)notify(`🔁 Görev birim değişti: ${DN[oD]||oD} → ${DN[d.dept]||d.dept}`,'🔁',me.role);
    if(oA!==d.assigneeId)notify(`👤 "${d.title}" görevi ${an.name} kişisine atandı`,'👤',me.role);
  } else {
    state.tasks.push({id:'t'+Date.now(),done:false,created:Date.now(),...d});
    toast('Yeni görev eklendi','ok');
    notify(`🆕 ${me.name} yeni görev açtı: "${d.title}" → ${an.name} (${DN[d.dept]})`,DI[d.dept]||'➕',me.role);
  }
  save();renderAll();closeTask();
}
function delTask(){
  if(!confirm('Bu görev silinsin mi?'))return;
  const t=state.tasks.find(x=>x.id===editT);
  state.tasks=state.tasks.filter(x=>x.id!==editT);
  notify(`🗑️ ${me.name} "${t?t.title:'görev'}" görevini sildi`,'🗑️',me.role);
  toast('Görev silindi','w');save();renderAll();closeTask();
}
function toggle(id){
  const t=state.tasks.find(x=>x.id===id);t.done=!t.done;
  if(t.done)notify(`✅ ${me.name} "${t.title}" görevini tamamladı`,'✅',me.role);
  else notify(`↩️ ${me.name} "${t.title}" görevini yeniden açtı`,'↩️',me.role);
  save();renderAll();toast(t.done?'✓ Tamamlandı - tüm birimlere bildirildi':'Yeniden açıldı',t.done?'ok':'info');
}

/* ============ UTIL ============ */
function esc(s){return String(s).replace(/[&<>"']/g,c=>({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'})[c])}
function toast(m,t='ok'){const el=document.createElement('div');el.className='toast '+t;el.textContent=m;document.getElementById('toasts').appendChild(el);setTimeout(()=>el.style.opacity='0',2400);setTimeout(()=>el.remove(),2700)}

// Modal close on bg click
document.getElementById('pModal').addEventListener('click',e=>{if(e.target.id==='pModal')closeProj()});
document.getElementById('tModal').addEventListener('click',e=>{if(e.target.id==='tModal')closeTask()});

// Enter on login
document.getElementById('lp').addEventListener('keydown',e=>{if(e.key==='Enter')doLogin()});
document.getElementById('lu').addEventListener('keydown',e=>{if(e.key==='Enter')document.getElementById('lp').focus()});

// Auto-login from session
window.addEventListener('DOMContentLoaded',()=>{
  load();
  const u=sessionStorage.getItem('ucel_user');
  if(u&&USERS[u]){
    document.getElementById('lu').value=u;
    document.getElementById('lp').value=USERS[u].pw;
    doLogin();
  }
});
</script>
</body>
</html>
