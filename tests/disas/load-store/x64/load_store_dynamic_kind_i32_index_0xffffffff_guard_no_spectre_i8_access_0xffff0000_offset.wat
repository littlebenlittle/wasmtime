;;! target = "x86_64"
;;! test = "compile"
;;! flags = " -C cranelift-enable-heap-access-spectre-mitigation=false -O static-memory-maximum-size=0 -O static-memory-guard-size=4294967295 -O dynamic-memory-guard-size=4294967295"

;; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
;; !!! GENERATED BY 'make-load-store-tests.sh' DO NOT EDIT !!!
;; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

(module
  (memory i32 1)

  (func (export "do_store") (param i32 i32)
    local.get 0
    local.get 1
    i32.store8 offset=0xffff0000)

  (func (export "do_load") (param i32) (result i32)
    local.get 0
    i32.load8_u offset=0xffff0000))

;; wasm[0]::function[0]:
;;       pushq   %rbp
;;       movq    %rsp, %rbp
;;       movq    0x68(%rdi), %r11
;;       movl    %edx, %r10d
;;       cmpq    %r11, %r10
;;       ja      0x26
;;   14: addq    0x60(%rdi), %r10
;;       movl    $0xffff0000, %edi
;;       movb    %cl, (%r10, %rdi)
;;       movq    %rbp, %rsp
;;       popq    %rbp
;;       retq
;;   26: ud2
;;
;; wasm[0]::function[1]:
;;       pushq   %rbp
;;       movq    %rsp, %rbp
;;       movq    0x68(%rdi), %r11
;;       movl    %edx, %r10d
;;       cmpq    %r11, %r10
;;       ja      0x57
;;   44: addq    0x60(%rdi), %r10
;;       movl    $0xffff0000, %edi
;;       movzbq  (%r10, %rdi), %rax
;;       movq    %rbp, %rsp
;;       popq    %rbp
;;       retq
;;   57: ud2
