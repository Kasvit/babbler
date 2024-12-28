import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["textarea", "error", "counter", "counterNumber"]
  static values = {
    maxLength: { type: Number, default: 280 }
  }

  connect() {
    this.adjustHeight()
    this.updateCounter()
    this.validateLength()
    this.element.addEventListener('input', () => {
      this.adjustHeight()
      this.validateLength()
      this.updateCounter()
    })
  }

  adjustHeight() {
    const textarea = this.textareaTarget
    const maxRows = 7
    const minRows = 2

    textarea.rows = minRows
    
    const lineHeight = parseInt(getComputedStyle(textarea).lineHeight)
    const padding = parseInt(getComputedStyle(textarea).paddingTop) + 
                   parseInt(getComputedStyle(textarea).paddingBottom)
    
    const contentRows = Math.ceil((textarea.scrollHeight - padding) / lineHeight)
    
    textarea.rows = Math.min(Math.max(contentRows, minRows), maxRows)
  }

  validateLength() {
    const textarea = this.textareaTarget
    const length = textarea.value.length
    const currentError = this.errorTarget.textContent

    if (length > this.maxLengthValue) {
      textarea.classList.add('border-red-500', 'focus:ring-red-500')
      if (!currentError.includes('maximum')) {
        this.errorTarget.textContent = `Content is too long (maximum is ${this.maxLengthValue} characters)`
      }
      return false
    } else {
      textarea.classList.remove('border-red-500', 'focus:ring-red-500')
      if (currentError.includes('maximum')) {
        this.errorTarget.textContent = ''
      }
      return true
    }
  }

  updateCounter() {
    const length = this.textareaTarget.value.length
    const remaining = this.maxLengthValue - length
    this.counterNumberTarget.textContent = remaining

    if (remaining < 0) {
      this.counterTarget.classList.add('text-red-500')
      this.counterTarget.classList.remove('text-gray-500', 'text-yellow-500')
    } else if (remaining <= 20) {
      this.counterTarget.classList.add('text-yellow-500')
      this.counterTarget.classList.remove('text-gray-500', 'text-red-500')
    } else {
      this.counterTarget.classList.remove('text-red-500', 'text-yellow-500')
      this.counterTarget.classList.add('text-gray-500')
    }
  }
} 