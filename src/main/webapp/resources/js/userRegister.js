
console.log("userRegister.js in!!");

document.addEventListener('DOMContentLoaded', () => {
    const modBtn = document.getElementById('modBtn');
    const u = document.getElementById('u');
    const p = document.getElementById('p');
    const e = document.getElementById('e');
    const n = document.getElementById('n');
    const ok = document.getElementById('statusMessage').dataset.ok;
    const inputs = [u, p, e, n];

    inputs.forEach(input => {
        input.addEventListener('change', () => {
            if (u.value !== "" && p.value !== "" && e.value !== "" && n.value !== "" && ok == "1") {
                modBtn.disabled = false; 
            } else {
                modBtn.disabled = true;
            }
        });
    });
    modBtn.disabled = true; 
});