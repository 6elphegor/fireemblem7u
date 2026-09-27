	.include "macro.inc"

	.syntax unified

	thumb_func_start ClearUnit
ClearUnit: @ 0x08017508
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrb r5, [r4, #0xb]
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r2, _0801752C @ =0x01000024
	mov r0, sp
	adds r1, r4, #0
	bl CpuSet
	strb r5, [r4, #0xb]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801752C: .4byte 0x01000024
