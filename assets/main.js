(function () {
    var overlay = document.getElementById('lightbox');
    var lbImg = document.getElementById('lightbox-img');

    document.querySelectorAll('.post-content img').forEach(function (img) {
        img.addEventListener('click', function () {
            lbImg.src = img.src;
            lbImg.alt = img.alt;
            overlay.classList.add('active');
        });
    });

    function close() {
        overlay.classList.remove('active');
        lbImg.src = '';
    }

    document.getElementById('lightbox-close').addEventListener('click', close);
    overlay.addEventListener('click', function (e) {
        if (e.target === overlay) close();
    });
    document.addEventListener('keydown', function (e) {
        if (e.key === 'Escape') close();
    });
})();
