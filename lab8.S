    .text
#CODE From Lab3
    .global hailstone_length
hailstone_length:
    mov $0, %rax
hailstone_loop:
    cmp $1, %rdi
    je hailstone_done
    add $1, %rax
    mov %rdi, %rcx
    and $1, %rcx
    jz hailstone_even
    imul $3, %rdi
    add $1, %rdi
    jmp hailstone_loop
hailstone_even:
    shr $1, %rdi
    jmp hailstone_loop
hailstone_done:
    ret

    .global hailstone_length_cmov
hailstone_length_cmov:
    mov $0, %rax
hailstone_loop_cmov:
    cmp $1, %rdi
    je hailstone_cmov_done
    add $1, %rax
    mov %rdi, %rcx
    shr $1, %rcx  # rcx = n / 2
    mov %rdi, %rdx
    imul $3, %rdx
    add $1, %rdx
    test $1, %rdi
    cmovz %rcx, %rdx
    mov %rdx, %rdi
    jmp hailstone_loop_cmov
hailstone_cmov_done:
    ret
