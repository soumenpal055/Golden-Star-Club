/**
 * Golden Star Club - Main JavaScript
 * Handles Interactivity, Smooth Scrolling, and Live Countdown
 */

document.addEventListener('DOMContentLoaded', function() {
    
    // ==========================================
    // 1. NAVBAR SCROLL EFFECT
    // ==========================================
    const navbar = document.getElementById('mainNavbar');
    
    if (navbar) {
        window.addEventListener('scroll', function() {
            if (window.scrollY > 50) {
                navbar.classList.add('scrolled'); // Dark background on scroll
            } else {
                navbar.classList.remove('scrolled'); // Transparent initially
            }
        });
    }

    // ==========================================
    // 2. SMOOTH SCROLLING
    // ==========================================
    // Applies to all links starting with '#'
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            
            const targetId = this.getAttribute('href');
            if(targetId === '#') return;
            
            const targetElement = document.querySelector(targetId);
            
            if (targetElement) {
                // Adjust scroll position to account for the fixed navbar
                const navbarHeight = navbar ? navbar.offsetHeight : 0;
                const targetPosition = targetElement.getBoundingClientRect().top + window.pageYOffset - navbarHeight;
                
                window.scrollTo({
                    top: targetPosition,
                    behavior: 'smooth'
                });
                
                // Update active link state
                document.querySelectorAll('.nav-link').forEach(link => link.classList.remove('active'));
                this.classList.add('active');
                
                // Auto-close mobile hamburger menu after clicking a link
                const navbarCollapse = document.getElementById('navbarNav');
                if (navbarCollapse && navbarCollapse.classList.contains('show')) {
                    // Bootstrap 5 method to hide collapse
                    const bsCollapse = bootstrap.Collapse.getInstance(navbarCollapse);
                    if(bsCollapse) {
                        bsCollapse.hide();
                    }
                }
            }
        });
    });

    // ==========================================
    // 3. COUNTDOWN TIMER LOGIC
    // ==========================================
    // Set target date for Saraswati Puja (Example: Feb 14, 2027)
    // You can update this date easily every year
    const targetDate = new Date("February 14, 2027 00:00:00").getTime();
    
    const daysElement = document.getElementById('days');
    const hoursElement = document.getElementById('hours');
    const minutesElement = document.getElementById('minutes');
    const secondsElement = document.getElementById('seconds');
    
    function updateCountdown() {
        // Ensure countdown elements exist on this page before attempting updates
        if (!daysElement || !hoursElement || !minutesElement || !secondsElement) return;
        
        const now = new Date().getTime();
        const difference = targetDate - now;
        
        if (difference > 0) {
            // Time calculations for days, hours, minutes and seconds
            const days = Math.floor(difference / (1000 * 60 * 60 * 24));
            const hours = Math.floor((difference % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
            const minutes = Math.floor((difference % (1000 * 60 * 60)) / (1000 * 60));
            const seconds = Math.floor((difference % (1000 * 60)) / 1000);
            
            // Output the result in the corresponding elements with leading zeros
            daysElement.innerText = days < 10 ? '0' + days : days;
            hoursElement.innerText = hours < 10 ? '0' + hours : hours;
            minutesElement.innerText = minutes < 10 ? '0' + minutes : minutes;
            secondsElement.innerText = seconds < 10 ? '0' + seconds : seconds;
        } else {
            // If the countdown is over, display 00 and update the title
            daysElement.innerText = "00";
            hoursElement.innerText = "00";
            minutesElement.innerText = "00";
            secondsElement.innerText = "00";
            
            const countdownTitle = document.querySelector('.countdown-section h2');
            if(countdownTitle) {
                countdownTitle.innerText = "Happy Saraswati Puja!";
            }
        }
    }
    
    // Initial call to prevent 1-second delay flash
    updateCountdown();
    // Update every second (1000 milliseconds)
    setInterval(updateCountdown, 1000);
    
    // ==========================================
    // 4. FADE-IN ANIMATION OBSERVER
    // ==========================================
    const faders = document.querySelectorAll('.fade-in-section');
    const appearOptions = {
        threshold: 0.15,
        rootMargin: "0px 0px -50px 0px"
    };
    const appearOnScroll = new IntersectionObserver(function(entries, observer) {
        entries.forEach(entry => {
            if (!entry.isIntersecting) return;
            entry.target.classList.add('is-visible');
            observer.unobserve(entry.target);
        });
    }, appearOptions);
    
    faders.forEach(fader => {
        appearOnScroll.observe(fader);
    });

    // ==========================================
    // 5. SCROLL TO TOP BUTTON
    // ==========================================
    const scrollTopBtn = document.getElementById("scrollToTopBtn");
    if (scrollTopBtn) {
        window.addEventListener("scroll", function() {
            if (window.scrollY > 300) scrollTopBtn.classList.add("show");
            else scrollTopBtn.classList.remove("show");
        });
    }

    // ==========================================
    // 6. FEEDBACK FORM VALIDATION & AJAX SUBMIT
    // ==========================================
    const feedbackForm = document.getElementById('feedbackForm');
    if (feedbackForm) {
        feedbackForm.addEventListener('submit', function(e) {
            e.preventDefault();
            e.stopPropagation();
            
            const nameInput = document.getElementById('feedbackName');
            const mobileInput = document.getElementById('feedbackMobile');
            const emailInput = document.getElementById('feedbackEmail');
            const messageInput = document.getElementById('feedbackMessage');
            
            let isValid = true;
            
            if (!nameInput.value.trim()) {
                nameInput.setCustomValidity('Invalid');
                isValid = false;
            } else {
                nameInput.setCustomValidity('');
            }
            
            if (!/^[0-9]{10,12}$/.test(mobileInput.value.trim())) {
                mobileInput.setCustomValidity('Invalid');
                isValid = false;
            } else {
                mobileInput.setCustomValidity('');
            }
            
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailRegex.test(emailInput.value.trim())) {
                emailInput.setCustomValidity('Invalid');
                isValid = false;
            } else {
                emailInput.setCustomValidity('');
            }
            
            if (!messageInput.value.trim()) {
                messageInput.setCustomValidity('Invalid');
                isValid = false;
            } else {
                messageInput.setCustomValidity('');
            }
            
            if (!isValid || !feedbackForm.checkValidity()) {
                feedbackForm.classList.add('was-validated');
                return;
            }
            
            // Collect Data
            const formData = new URLSearchParams(new FormData(feedbackForm));
            const submitBtn = feedbackForm.querySelector('.feedback-submit-btn');
            const originalBtnText = submitBtn.innerHTML;
            
            // Show Loading state
            submitBtn.innerHTML = '<span class="spinner-border spinner-border-sm me-2" role="status" aria-hidden="true"></span> Sending...';
            submitBtn.disabled = true;
            
            fetch('feedback', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'
                },
                body: formData.toString()
            })
            .then(response => response.json())
            .then(data => {
                showFeedbackToast(data.status, data.message);
                if (data.status === 'success') {
                    feedbackForm.reset();
                    feedbackForm.classList.remove('was-validated');
                }
            })
            .catch(error => {
                console.error('Error:', error);
                showFeedbackToast('error', 'An error occurred. Please try again later.');
            })
            .finally(() => {
                // Restore button
                submitBtn.innerHTML = originalBtnText;
                submitBtn.disabled = false;
            });
        });
    }

    function showFeedbackToast(status, message) {
        const toastEl = document.getElementById('feedbackToast');
        if (toastEl) {
            const toastMessage = document.getElementById('feedbackToastMessage');
            const toastIcon = document.getElementById('feedbackToastIcon');
            const toast = new bootstrap.Toast(toastEl, { delay: 4000 });
            
            toastMessage.innerText = message;
            
            if (status === 'success') {
                toastIcon.className = 'fa-solid fa-circle-check fs-4 me-2 text-success';
                toastEl.style.borderColor = '#198754'; // Bootstrap success green
            } else {
                toastIcon.className = 'fa-solid fa-circle-exclamation fs-4 me-2 text-danger';
                toastEl.style.borderColor = '#dc3545'; // Bootstrap danger red
            }
            
            toast.show();
        }
    }
});
