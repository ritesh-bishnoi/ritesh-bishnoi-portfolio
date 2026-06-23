import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/contact_bloc.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({
    super.key,
  });

  @override
  State<ContactSection> createState() =>
      _ContactSectionState();
}

class _ContactSectionState
    extends State<ContactSection> {
  final _formKey =
      GlobalKey<FormState>();

  final _nameController =
      TextEditingController();

  final _emailController =
      TextEditingController();

  final _messageController =
      TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();

    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    context.read<ContactBloc>().add(
          SubmitContactEvent(
            name: _nameController.text.trim(),
            email: _emailController.text.trim(),
            message:
                _messageController.text.trim(),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<
        ContactBloc,
        ContactState>(
      listener: (context, state) {
        if (state is ContactSuccess) {
          _nameController.clear();
          _emailController.clear();
          _messageController.clear();

          ScaffoldMessenger.of(context)
              .showSnackBar(
            const SnackBar(
              content: Text(
                'Message sent successfully',
              ),
            ),
          );
        }

        if (state is ContactError) {
          ScaffoldMessenger.of(context)
              .showSnackBar(
            SnackBar(
              content: Text(
                state.message,
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        return Padding(
          padding:
              const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 48,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints:
                  const BoxConstraints(
                maxWidth: 800,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Contact Me',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(
                            fontWeight:
                                FontWeight.bold,
                          ),
                    ),

                    const SizedBox(
                      height: 12,
                    ),

                    Text(
                      'Have a project in mind or want to connect? Send me a message.',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge,
                    ),

                    const SizedBox(
                      height: 32,
                    ),

                    /// NAME
                    TextFormField(
                      controller:
                          _nameController,
                      textInputAction:
                          TextInputAction.next,
                      decoration:
                          const InputDecoration(
                        labelText: 'Name',
                        border:
                            OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null ||
                            value
                                .trim()
                                .isEmpty) {
                          return 'Name is required';
                        }

                        return null;
                      },
                    ),

                    const SizedBox(
                      height: 16,
                    ),

                    /// EMAIL
                    TextFormField(
                      controller:
                          _emailController,
                      keyboardType:
                          TextInputType
                              .emailAddress,
                      textInputAction:
                          TextInputAction.next,
                      decoration:
                          const InputDecoration(
                        labelText: 'Email',
                        border:
                            OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null ||
                            value
                                .trim()
                                .isEmpty) {
                          return 'Email is required';
                        }

                        final emailRegex =
                            RegExp(
                          r'^[^@]+@[^@]+\.[^@]+$',
                        );

                        if (!emailRegex
                            .hasMatch(value)) {
                          return 'Enter a valid email';
                        }

                        return null;
                      },
                    ),

                    const SizedBox(
                      height: 16,
                    ),

                    /// MESSAGE
                    TextFormField(
                      controller:
                          _messageController,
                      maxLines: 6,
                      decoration:
                          const InputDecoration(
                        labelText: 'Message',
                        alignLabelWithHint:
                            true,
                        border:
                            OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null ||
                            value
                                .trim()
                                .isEmpty) {
                          return 'Message is required';
                        }

                        if (value.trim().length <
                            10) {
                          return 'Minimum 10 characters required';
                        }

                        return null;
                      },
                    ),

                    const SizedBox(
                      height: 24,
                    ),

                    SizedBox(
                      width:
                          double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        onPressed:
                            state
                                    is ContactLoading
                                ? null
                                : _submit,
                        child:
                            state
                                    is ContactLoading
                                ? const SizedBox(
                                    height: 22,
                                    width: 22,
                                    child:
                                        CircularProgressIndicator(),
                                  )
                                : const Text(
                                    'Send Message',
                                  ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}