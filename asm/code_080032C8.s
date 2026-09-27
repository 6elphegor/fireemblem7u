	.include "macro.inc"

	.syntax unified

	thumb_func_start GetOamSplice
GetOamSplice: @ 0x080032C8
	push {r7, lr}
	mov r7, sp
	ldr r0, _080032D4 @ =0x03000028
	ldrh r1, [r0, #0xa]
	adds r0, r1, #0
	b _080032D8
	.align 2, 0
_080032D4: .4byte 0x03000028
_080032D8:
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0
