window.addEventListener('message', function(event) {
    if (event.data.type === "toggleHUD") {
        document.getElementById('hud').style.display = event.data.display ? 'flex' : 'none';
    }

    if (event.data.type === "updateHUD") {
        const locale = event.data.locale;
        const locales = event.data.locales;
        document.getElementById('player-id').textContent = locales.id + event.data.id;
        document.getElementById('player-money').textContent = locales.money  + event.data.money + "€";
        document.getElementById('player-wallet').textContent = locales.wallet + event.data.wallet + "€";
    }
});
