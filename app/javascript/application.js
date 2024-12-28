import "@hotwired/turbo-rails"
import "./controllers"

function initializeThemeToggle() {
  var themeToggleDarkIcon = document.getElementById('theme-toggle-dark-icon');
  var themeToggleLightIcon = document.getElementById('theme-toggle-light-icon');
  var themeToggleBtn = document.getElementById('theme-toggle');

  if (themeToggleDarkIcon && themeToggleLightIcon && themeToggleBtn) {
    themeToggleDarkIcon.classList.add('hidden');
    themeToggleLightIcon.classList.add('hidden');

    if (localStorage.getItem('color-theme') === 'dark' || (!('color-theme' in localStorage) && window.matchMedia('(prefers-color-scheme: dark)').matches)) {
      themeToggleLightIcon.classList.remove('hidden');
    } else {
      themeToggleDarkIcon.classList.remove('hidden');
    }

    themeToggleBtn.removeEventListener('click', handleThemeToggle);
    themeToggleBtn.addEventListener('click', handleThemeToggle);
  }
}

function handleThemeToggle() {
  var themeToggleDarkIcon = document.getElementById('theme-toggle-dark-icon');
  var themeToggleLightIcon = document.getElementById('theme-toggle-light-icon');

  themeToggleDarkIcon.classList.toggle('hidden');
  themeToggleLightIcon.classList.toggle('hidden');

  if (localStorage.getItem('color-theme') === 'dark') {
    document.documentElement.classList.remove('dark');
    localStorage.setItem('color-theme', 'light');
  } else {
    document.documentElement.classList.add('dark');
    localStorage.setItem('color-theme', 'dark');
  }
}

document.addEventListener('DOMContentLoaded', initializeThemeToggle);
document.addEventListener('turbo:load', initializeThemeToggle);