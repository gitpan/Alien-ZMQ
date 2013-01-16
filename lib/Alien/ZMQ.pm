package Alien::ZMQ;
{
  $Alien::ZMQ::VERSION = '0.02';
}
# ABSTRACT: detect and/or install zeromq

use warnings;
use strict;


sub inc_version { }


sub lib_version { }


sub inc_dir { }


sub lib_dir { }


sub cflags {
    "-I'" . inc_dir . "'";
}


sub libs {
    "-L'" . lib_dir . "' -lzmq";
}

1;

__END__

=pod

=head1 NAME

Alien::ZMQ - detect and/or install zeromq

=head1 VERSION

version 0.02

=head1 SYNOPSIS

    use Alien::ZMQ;

    my $version = Alien::ZMQ::lib_version;

=head1 DESCRIPTION

Upon installation, the target system is probed for the presence of libzmq.  If
it is not found, zeromq 3.2.2 is installed in a shared directory.  In short,
modules that need libzmq can depend on this module to make sure that it is
available.

=head1 METHODS

=head2 inc_version

Get the version number of libzmq as a dotted version string according to the
F<zmq.h> header file.

=head2 lib_version

Get the version number of libzmq as a dotted version string according to the
F<libzmq.so> file.

=head2 inc_dir

Get the directory containing the F<zmq.h> header file.

=head2 lib_dir

Get the directory containing the F<libzmq.so> file.

=head2 cflags

Get the C compiler flags required to compile a program that uses libzmq.  This
is a shortcut for constructing a C<-I> flag using C<inc_dir>.

=head2 libs

Get the linker flags required to link a program against libzmq.  This is
a shortcut for constructing a C<-L> flag using C<lib_dir>, plus C<-lzmq>.

=head1 OPTIONS

These options to F<Build.PL> affect the installation of this module.

=over 4

=item --zmq-skip-probe

By default, zeromq is not compiled and installed if it is detected to already
be on the system.  Use this to skip those checks and always install zeromq.

=item --zmq-config=...

Pass extra flags to zeromq's F<configure> script.  You may want to consider
passing either C<--with-pgm> or C<--with-system-pgm> if you need support for
PGM; this is not enabled by default because it is not supported by every
system.

=item --zmq-libs=...

Pass extra flags to the linker when probing for an existing installation of
zeromq.  In particular, if your F<libzmq.so> file is installed to a special
location, you may pass flags such as C<-L/opt/libzmq2/lib -lzmq>.

=item --zmq-cflags=...

Pass extra flags to the compiler when probing for an existing installation of
zeromq.  These flags will not be used when actually compiling zeromq from
source.  For that, just use the C<CFLAGS> environment variable.

=back

=head1 CAVEATS

Probing is only done upon installation, so if you are using a system-installed
version of libzmq and you uninstall or upgrade it, you will also need to
reinstall this module.

=head1 BUGS

Windows is not yet supported.  Patches are welcome.

=head1 SEE ALSO

=over 4

=item * L<GitHub project|https://github.com/chazmcgarvey/p5-Alien-ZMQ>

=item * L<ZMQ> - good perl bindings for zeromq

=item * L<ZeroMQ|http://www.zeromq.org/> - official libzmq website

=back

=head1 ACKNOWLEDGEMENTS

The design and implementation of this module were influenced by other L<Alien>
modules, including L<Alien::GMP> and L<Alien::Tidyp>.

=head1 AUTHOR

Charles McGarvey <chazmcgarvey@brokenzipper.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Charles McGarvey.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
