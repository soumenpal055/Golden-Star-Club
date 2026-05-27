<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Feedback Form -->
<div class="col-lg-3 col-md-6 feedback-section">
    <h5 class="gold-text text-uppercase mb-4 fw-bold">Feedback Form</h5>
    <div class="feedback-form-container glass-panel">
        <form id="feedbackForm" class="mt-2" novalidate>
            <div class="mb-3 position-relative">
                <input type="text" class="form-control premium-input" id="feedbackName" name="name" placeholder="Full Name" required>
                <div class="invalid-feedback">Please enter your full name.</div>
            </div>
            <div class="mb-3 position-relative">
                <input type="tel" class="form-control premium-input" id="feedbackMobile" name="mobile" placeholder="Mobile Number" pattern="[0-9]{10,12}" required>
                <div class="invalid-feedback">Enter a valid 10 digit mobile number.</div>
            </div>
            <div class="mb-3 position-relative">
                <input type="email" class="form-control premium-input" id="feedbackEmail" name="email" placeholder="Email Address" required>
                <div class="invalid-feedback">Please enter a valid email address.</div>
            </div>
            <div class="mb-3 position-relative">
                <textarea class="form-control premium-input disable-resize" id="feedbackMessage" name="message" rows="3" placeholder="Your Message" required></textarea>
                <div class="invalid-feedback">Please write your feedback message.</div>
            </div>
            <button type="submit" class="btn btn-gold w-100 fw-bold feedback-submit-btn">
                <span>SUBMIT</span> <i class="fa-solid fa-paper-plane ms-2 gold-send-icon"></i>
            </button>
            <div id="feedbackStatus" class="mt-3 text-center small fw-bold" style="display: none;"></div>
        </form>
    </div>
</div>

<!-- Feedback Success/Error Toast -->
<div class="toast-container position-fixed bottom-0 end-0 p-3" style="z-index: 1055;">
    <div id="feedbackToast" class="toast premium-toast align-items-center text-white border-0" role="alert" aria-live="assertive" aria-atomic="true">
        <div class="d-flex">
            <div class="toast-body d-flex align-items-center">
                <i id="feedbackToastIcon" class="fa-solid fa-circle-check fs-4 me-2"></i>
                <span id="feedbackToastMessage">Feedback submitted successfully!</span>
            </div>
            <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
        </div>
    </div>
</div>
