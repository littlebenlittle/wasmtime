;;! target = "riscv64"
;;! test = "compile"
;;! flags = " -C cranelift-enable-heap-access-spectre-mitigation -O static-memory-maximum-size=0 -O static-memory-guard-size=0 -O dynamic-memory-guard-size=0"

;; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
;; !!! GENERATED BY 'make-load-store-tests.sh' DO NOT EDIT !!!
;; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

(module
  (memory i32 1)

  (func (export "do_store") (param i32 i32)
    local.get 0
    local.get 1
    i32.store offset=0xffff0000)

  (func (export "do_load") (param i32) (result i32)
    local.get 0
    i32.load offset=0xffff0000))

;; wasm[0]::function[0]:
;;       addi    sp, sp, -0x10
;;       sd      ra, 8(sp)
;;       sd      s0, 0(sp)
;;       mv      s0, sp
;;       slli    a1, a2, 0x20
;;       srli    a4, a1, 0x20
;;       lui     a1, 0x3fffc
;;       addi    a2, a1, 1
;;       slli    a5, a2, 2
;;       add     a2, a4, a5
;;       bgeu    a2, a4, 8
;;       .byte   0x00, 0x00, 0x00, 0x00
;;       ld      a5, 0x68(a0)
;;       ld      a0, 0x60(a0)
;;       sltu    a5, a5, a2
;;       add     a4, a0, a4
;;       lui     a2, 0xffff
;;       slli    a0, a2, 4
;;       add     a4, a4, a0
;;       neg     a1, a5
;;       not     a5, a1
;;       and     a5, a4, a5
;;       sw      a3, 0(a5)
;;       ld      ra, 8(sp)
;;       ld      s0, 0(sp)
;;       addi    sp, sp, 0x10
;;       ret
;;
;; wasm[0]::function[1]:
;;       addi    sp, sp, -0x10
;;       sd      ra, 8(sp)
;;       sd      s0, 0(sp)
;;       mv      s0, sp
;;       slli    a1, a2, 0x20
;;       srli    a3, a1, 0x20
;;       lui     a1, 0x3fffc
;;       addi    a2, a1, 1
;;       slli    a4, a2, 2
;;       add     a2, a3, a4
;;       bgeu    a2, a3, 8
;;       .byte   0x00, 0x00, 0x00, 0x00
;;       ld      a4, 0x68(a0)
;;       ld      a5, 0x60(a0)
;;       sltu    a4, a4, a2
;;       add     a3, a5, a3
;;       lui     a2, 0xffff
;;       slli    a5, a2, 4
;;       add     a3, a3, a5
;;       neg     a1, a4
;;       not     a4, a1
;;       and     a5, a3, a4
;;       lw      a0, 0(a5)
;;       ld      ra, 8(sp)
;;       ld      s0, 0(sp)
;;       addi    sp, sp, 0x10
;;       ret
