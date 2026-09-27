	.include "macro.inc"

	.syntax unified

	thumb_func_start EnablePalSync
EnablePalSync: @ 0x0800105C
	push {r7, lr}
	mov r7, sp
	ldr r0, _0800106C @ =0x0300000D
	movs r1, #1
	strb r1, [r0]
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800106C: .4byte 0x0300000D
