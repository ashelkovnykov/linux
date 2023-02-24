#!/bin/bash
# ==============================================================================
# trap
#
#   Reference for trapping signals in bash.
#
# ==============================================================================

# ==========================================================
# MAIN
# ==========================================================

# trap [-p] <arg> <signal...>
#   arg is the command to run when receiving signal
#   arg should be wrapped in quotes
#   multiple commands in arg should be separated by ";"
#   if the p opt is used, trap will print the commands it runs beforehand

# valid signals:
#   SIGHUP      controlling terminal (real, pseudo, or virtual) closed
#   SIGINT      user interrupt request (ctrl+c)
#   SIGQUIT     SIGTERM with core dump
#   SIGILL      attempted to execute invalid, ill-formed, or privileged instruction
#   SIGTRAP     breakpoint/trace trap
#   SIGABRT     signal sent by abort() function
#   SIGBUS      attempt to access memory that CPU physically cannot access
#   SIGFPE      floating point exception
#   SIGKILL     OS terminate signal (cannot be ignored or modified)
#   SIGUSR1     user-defined signal 1
#   SIGSEGV     attempt to access memory to which the program doesn't have access
#   SIGUSR2     user-defined signal 2
#   SIGPIPE     broken pipe (e.g. write to pipe with no readers)
#   SIGALRM     signal sent by timer() function
#   SIGTERM     user terminate request (ctrl+z)
#   SIGSTKFLT   stack fault on coprocesser (no longer used)
#   SIGCHLD     child process stopped or terminated
#   SIGCONT     continue (if previously stopped by SIGSTOP)
#   SIGSTOP     OS stop request (non-fatal, can be resumed)
#   SIGTSTP     user stop request (non-fatal, can be resumed)
#   SIGTTIN     terminal input to background process
#   SIGTTOU     terminal output from background process
#   SIGURG      urgent condition on socket
#   SIGXCPU     CPU time limit exceeded
#   SIGXFSZ     file size limit exceeded
#   SIGPROF     profiling timer expired
#   SIGWINCH    window resize
#   SIGIO       IO is now possible
#   SIGPWR      power failure has occurred
#   SIGSYS      bad argument to system call
#   SIGWAITING  all threads blocked and waiting
#   SIGLWP      interrupt to thread library
#   SIGRTMIN    undefined realtime thread signals; can be used as desired
#   SIGRTMIN+1
#   ...
#   SIGRTMIN+15
#   SIGRTMAX-14
#   ...
#   SIGRTMAX-1
#   SIGRTMAX

# special bash signals:
#   DEBUG       sent before each command is executed
#   ERR         send when command or pipeline returns non-zero exit code
#   EXIT        sent when shell exits

# keep track of the last executed command
trap 'LAST_COMMAND=$current_command; current_command=$BASH_COMMAND' DEBUG

# echo an error message before exiting
trap 'echo "ERROR MESSAGE"' EXIT

# make script uninterruptible (SIGKILL cannot be trapped)
trap "" SIGINT SIGABRT

# clear commands for signal
trap - SIGINT SIGABRT
