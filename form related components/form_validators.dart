class FormValidators {
  // Email validation
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    
    return null;
  }

  // Password validation with strong requirements
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    
    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter';
    }
    
    if (!value.contains(RegExp(r'[a-z]'))) {
      return 'Password must contain at least one lowercase letter';
    }
    
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one number';
    }
    
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password must contain at least one special character';
    }
    
    return null;
  }

  // Simple password validation (less strict)
  static String? validatePasswordSimple(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    
    return null;
  }

  // Confirm password validation
  static String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    
    if (value != password) {
      return 'Passwords do not match';
    }
    
    return null;
  }

  // Name validation
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }
    
    if (value.length < 2) {
      return 'Name must be at least 2 characters';
    }
    
    if (!value.contains(RegExp(r'^[a-zA-Z\s]+$'))) {
      return 'Name can only contain letters and spaces';
    }
    
    return null;
  }

  // Username validation
  static String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Username is required';
    }
    
    if (value.length < 3) {
      return 'Username must be at least 3 characters';
    }
    
    if (value.length > 20) {
      return 'Username must not exceed 20 characters';
    }
    
    if (!value.contains(RegExp(r'^[a-zA-Z0-9_]+$'))) {
      return 'Username can only contain letters, numbers, and underscores';
    }
    
    return null;
  }

  // Phone number validation
  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }
    
    // Remove spaces, dashes, and parentheses
    final cleanedValue = value.replaceAll(RegExp(r'[\s\-\(\)]'), '');
    
    // Check if it contains only digits and optional + at start
    if (!cleanedValue.contains(RegExp(r'^\+?[0-9]{10,15}$'))) {
      return 'Please enter a valid phone number';
    }
    
    return null;
  }

  // Required field validation
  static String? validateRequired(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  // Minimum length validation
  static String? validateMinLength(String? value, int minLength, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    
    if (value.length < minLength) {
      return '$fieldName must be at least $minLength characters';
    }
    
    return null;
  }

  // Maximum length validation
  static String? validateMaxLength(String? value, int maxLength, String fieldName) {
    if (value != null && value.length > maxLength) {
      return '$fieldName must not exceed $maxLength characters';
    }
    
    return null;
  }

  // URL validation
  static String? validateUrl(String? value) {
    if (value == null || value.isEmpty) {
      return 'URL is required';
    }
    
    final urlRegex = RegExp(
      r'^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$',
    );
    
    if (!urlRegex.hasMatch(value)) {
      return 'Please enter a valid URL';
    }
    
    return null;
  }

  // Numeric validation
  static String? validateNumeric(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    
    if (!value.contains(RegExp(r'^[0-9]+$'))) {
      return '$fieldName must contain only numbers';
    }
    
    return null;
  }

  // Age validation
  static String? validateAge(String? value) {
    if (value == null || value.isEmpty) {
      return 'Age is required';
    }
    
    final age = int.tryParse(value);
    
    if (age == null) {
      return 'Please enter a valid age';
    }
    
    if (age < 13) {
      return 'You must be at least 13 years old';
    }
    
    if (age > 120) {
      return 'Please enter a valid age';
    }
    
    return null;
  }

  // Postal/ZIP code validation
  static String? validatePostalCode(String? value) {
    if (value == null || value.isEmpty) {
      return 'Postal code is required';
    }
    
    // Supports various formats (US ZIP, UK postal codes, etc.)
    final postalRegex = RegExp(r'^[A-Za-z0-9\s\-]{3,10}$');
    
    if (!postalRegex.hasMatch(value)) {
      return 'Please enter a valid postal code';
    }
    
    return null;
  }

  // Credit card validation (basic Luhn algorithm)
  static String? validateCreditCard(String? value) {
    if (value == null || value.isEmpty) {
      return 'Card number is required';
    }
    
    // Remove spaces and dashes
    final cleanedValue = value.replaceAll(RegExp(r'[\s\-]'), '');
    
    if (!cleanedValue.contains(RegExp(r'^[0-9]{13,19}$'))) {
      return 'Please enter a valid card number';
    }
    
    // Luhn algorithm
    int sum = 0;
    bool alternate = false;
    
    for (int i = cleanedValue.length - 1; i >= 0; i--) {
      int digit = int.parse(cleanedValue[i]);
      
      if (alternate) {
        digit *= 2;
        if (digit > 9) {
          digit -= 9;
        }
      }
      
      sum += digit;
      alternate = !alternate;
    }
    
    if (sum % 10 != 0) {
      return 'Invalid card number';
    }
    
    return null;
  }
}

// Usage example in TextFormField:
/*
TextFormField(
  controller: emailController,
  decoration: InputDecoration(labelText: 'Email'),
  validator: FormValidators.validateEmail,
),

TextFormField(
  controller: passwordController,
  decoration: InputDecoration(labelText: 'Password'),
  validator: FormValidators.validatePassword,
),

TextFormField(
  controller: confirmPasswordController,
  decoration: InputDecoration(labelText: 'Confirm Password'),
  validator: (value) => FormValidators.validateConfirmPassword(
    value, 
    passwordController.text
  ),
),
*/