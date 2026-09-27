	.include "macro.inc"

	.syntax unified

	thumb_func_start GetAffinityName
GetAffinityName: @ 0x08026B74
	push {r4, r5, lr}
	sub sp, #0x20
	mov r2, sp
	ldr r1, _08026B9C @ =0x081C3CC4
	ldm r1!, {r3, r4, r5}
	stm r2!, {r3, r4, r5}
	ldm r1!, {r3, r4, r5}
	stm r2!, {r3, r4, r5}
	ldm r1!, {r3, r4}
	stm r2!, {r3, r4}
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
	bl DecodeMsg
	add sp, #0x20
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08026B9C: .4byte 0x081C3CC4
