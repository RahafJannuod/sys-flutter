import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../blocs/auth/auth_bloc.dart';
import '../../blocs/auth/auth_event.dart';
import '../../blocs/auth/auth_state.dart';
import '../../core/config/app_config.dart';
import '../../core/localization/app_localizations.dart';
import '../../core/routing/route_names.dart';
import '../../design_system/colors/app_colors.dart';
import '../../design_system/spacing/app_spacing.dart';
import '../../design_system/typography/app_typography.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();

  bool _isSignUp = false;
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (!_formKey.currentState!.validate()) return;

    final authBloc = context.read<AuthBloc>();

    if (_isSignUp) {
      authBloc.add(AuthRegisterRequested(
        email: _emailController.text.trim(),
        password: _passwordController.text,
        name: _nameController.text.trim(),
        phoneNumber: _phoneController.text.trim().isEmpty
            ? null
            : _phoneController.text.trim(),
      ));
    } else {
      authBloc.add(AuthLoginRequested(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      ));
    }
  }

  void _toggleAuthMode() {
    setState(() {
      _isSignUp = !_isSignUp;
    });
    _formKey.currentState?.reset();
  }

  void _handleSocialLogin(String provider) {
    // TODO: Implement actual social login
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$provider login will be implemented')),
    );
  }

  void _browseAsGuest() {
    context.go(RouteNames.home);
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthAuthenticated) {
          context.go(RouteNames.home);
        } else if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: AppColors.error,
            ),
          );
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppSpacing.screenPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: AppSpacing.xxxxxl),

                // App Logo and Welcome
                _buildHeader(localizations),

                const SizedBox(height: AppSpacing.xxxxxl),

                // Authentication Form
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      if (_isSignUp) ...[
                        _buildNameField(localizations),
                        const SizedBox(height: AppSpacing.l),
                      ],

                      _buildEmailField(localizations),
                      const SizedBox(height: AppSpacing.l),

                      _buildPasswordField(localizations),

                      if (_isSignUp) ...[
                        const SizedBox(height: AppSpacing.l),
                        _buildPhoneField(localizations),
                      ],

                      const SizedBox(height: AppSpacing.xxxl),

                      // Submit Button
                      BlocBuilder<AuthBloc, AuthState>(
                        builder: (context, state) {
                          final isLoading = state is AuthLoading;

                          return ElevatedButton(
                            onPressed: isLoading ? null : _submitForm,
                            child: isLoading
                                ? const SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(strokeWidth: 2),
                                  )
                                : Text(_isSignUp
                                    ? localizations.signUp
                                    : localizations.signIn),
                          );
                        },
                      ),

                      const SizedBox(height: AppSpacing.l),

                      // Toggle Auth Mode
                      TextButton(
                        onPressed: _toggleAuthMode,
                        child: Text(_isSignUp
                            ? 'Already have an account? Sign In'
                            : 'Don\'t have an account? Sign Up'),
                      ),

                      if (!_isSignUp) ...[
                        TextButton(
                          onPressed: () {
                            // TODO: Implement forgot password
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Password reset will be implemented')),
                            );
                          },
                          child: Text(localizations.forgotPassword),
                        ),
                      ],
                    ],
                  ),
                ),

                const SizedBox(height: AppSpacing.xxxl),

                // Divider
                Row(
                  children: [
                    const Expanded(child: Divider()),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.l),
                      child: Text(
                        'OR',
                        style: AppTypography.caption.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ),
                    const Expanded(child: Divider()),
                  ],
                ),

                const SizedBox(height: AppSpacing.xxxl),

                // Social Login Buttons
                _buildSocialLoginButtons(localizations),

                const SizedBox(height: AppSpacing.xxxl),

                // Browse as Guest
                OutlinedButton(
                  onPressed: _browseAsGuest,
                  child: Text(localizations.browseAsGuest),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(AppLocalizations localizations) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(AppSpacing.radiusXL),
          ),
          child: const Icon(
            Icons.storefront,
            size: 40,
            color: Colors.white,
          ),
        ),

        const SizedBox(height: AppSpacing.l),

        const Text(
          AppConfig.appName,
          style: AppTypography.englishHeadlineLarge,
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: AppSpacing.s),

        Text(
          _isSignUp
              ? 'Create your account to get started'
              : 'Welcome back! Please sign in to continue',
          style: AppTypography.englishBodyMedium.copyWith(
            color: AppColors.textSecondary,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildNameField(AppLocalizations localizations) {
    return TextFormField(
      controller: _nameController,
      decoration: const InputDecoration(
        labelText: 'Full Name',
        prefixIcon: Icon(Icons.person_outline),
      ),
      validator: (value) {
        if (_isSignUp && (value == null || value.trim().isEmpty)) {
          return 'Name is required';
        }
        return null;
      },
    );
  }

  Widget _buildEmailField(AppLocalizations localizations) {
    return TextFormField(
      controller: _emailController,
      decoration: InputDecoration(
        labelText: localizations.email,
        prefixIcon: const Icon(Icons.email_outlined),
      ),
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Email is required';
        }
        if (!value.contains('@') || !value.contains('.')) {
          return 'Please enter a valid email';
        }
        return null;
      },
    );
  }

  Widget _buildPasswordField(AppLocalizations localizations) {
    return TextFormField(
      controller: _passwordController,
      decoration: InputDecoration(
        labelText: localizations.password,
        prefixIcon: const Icon(Icons.lock_outline),
        suffixIcon: IconButton(
          icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility),
          onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
        ),
      ),
      obscureText: _obscurePassword,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Password is required';
        }
        if (_isSignUp && value.length < 6) {
          return 'Password must be at least 6 characters';
        }
        return null;
      },
    );
  }

  Widget _buildPhoneField(AppLocalizations localizations) {
    return TextFormField(
      controller: _phoneController,
      decoration: const InputDecoration(
        labelText: 'Phone Number (Optional)',
        prefixIcon: Icon(Icons.phone_outlined),
      ),
      keyboardType: TextInputType.phone,
    );
  }

  Widget _buildSocialLoginButtons(AppLocalizations localizations) {
    return Column(
      children: [
        _buildSocialButton(
          onPressed: () => _handleSocialLogin('Google'),
          icon: Icons.g_mobiledata,
          label: localizations.signInWithGoogle,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black87,
        ),

        const SizedBox(height: AppSpacing.m),

        _buildSocialButton(
          onPressed: () => _handleSocialLogin('Facebook'),
          icon: Icons.facebook,
          label: localizations.signInWithFacebook,
          backgroundColor: const Color(0xFF1877F2),
          foregroundColor: Colors.white,
        ),

        const SizedBox(height: AppSpacing.m),

        _buildSocialButton(
          onPressed: () => _handleSocialLogin('Apple'),
          icon: Icons.apple,
          label: localizations.signInWithApple,
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
      ],
    );
  }

  Widget _buildSocialButton({
    required VoidCallback onPressed,
    required IconData icon,
    required String label,
    required Color backgroundColor,
    required Color foregroundColor,
  }) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, color: foregroundColor),
      label: Text(
        label,
        style: TextStyle(color: foregroundColor),
      ),
      style: OutlinedButton.styleFrom(
        backgroundColor: backgroundColor,
        side: BorderSide(color: backgroundColor),
      ),
    );
  }
}