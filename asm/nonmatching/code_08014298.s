	.include "macro.inc"

	.syntax unified

	thumb_func_start WaitForFade
WaitForFade: @ 0x08014298
	push {r4, lr}
	adds r4, r0, #0
	bl FadeExists
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080142AC
	adds r0, r4, #0
	bl Proc_Break
_080142AC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
