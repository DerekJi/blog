// Dark mode toggle
const darkModeToggle = document.getElementById('dark-mode-toggle');
const sunIcon = document.getElementById('sun-icon');
const moonIcon = document.getElementById('moon-icon');
const html = document.documentElement;

// Check for saved theme preference or default to dark
const savedTheme = localStorage.getItem('theme');
const currentTheme = savedTheme || 'dark';

if (currentTheme === 'dark') {
    html.setAttribute('data-theme', 'dark');
    sunIcon.style.display = 'none';
    moonIcon.style.display = 'block';
} else {
    html.removeAttribute('data-theme');
    sunIcon.style.display = 'block';
    moonIcon.style.display = 'none';
}

darkModeToggle.addEventListener('click', function() {
    const theme = html.getAttribute('data-theme');
    if (theme === 'dark') {
        html.removeAttribute('data-theme');
        localStorage.setItem('theme', 'light');
        sunIcon.style.display = 'block';
        moonIcon.style.display = 'none';
    } else {
        html.setAttribute('data-theme', 'dark');
        localStorage.setItem('theme', 'dark');
        sunIcon.style.display = 'none';
        moonIcon.style.display = 'block';
    }
});

// Handle Ctrl + Home to focus on the main content area instead of the brand button
document.addEventListener('keydown', function(e) {
    if ((e.ctrlKey || e.metaKey) && e.key === 'Home') {
        e.preventDefault();
        const pageTop = document.getElementById('page-top');
        if (pageTop) {
            pageTop.focus();
            window.scrollTo(0, 0);
        }
    }
});

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
